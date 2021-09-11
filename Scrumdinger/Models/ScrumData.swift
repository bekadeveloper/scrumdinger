//
//  ScrumData.swift
//  Scrumdinger
//
//  Created by Beka on 11.09.2021.
//

import Foundation

class ScrumData: ObservableObject {
    @Published var scrums: [DailyScrum] = []
    
    private static var documentsFolder: URL {
        do {
            return try FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false)
        } catch {
            fatalError("Can't find documents directory")
        }
    }
    
    private static var fileURL: URL {
        documentsFolder.appendingPathComponent("scrum.data")
    }
    
    func load() {
        DispatchQueue.global(qos: .background).async { [weak self] in
            guard let data = try? Data(contentsOf: Self.fileURL) else {
                #if DEBUG
                DispatchQueue.main.async {
                    self?.scrums = DailyScrum.data
                }
                #endif
                return
            }
        
            do {
                let dailyScrums = try JSONDecoder().decode([DailyScrum].self, from: data)
                
                DispatchQueue.main.async {
                    self?.scrums = dailyScrums
                }
            } catch {
                fatalError("Can't decode saved scrum data")
            }
        }
    }
    
    func save() {
        DispatchQueue.global(qos: .background).async { [weak self] in
            guard let scrums = self?.scrums else { fatalError("Self out of scope") }
            
            do {
                let data = try JSONEncoder().encode(scrums)
                
                do {
                    try data.write(to: Self.fileURL)
                } catch {
                    fatalError("Can't write to file")
                }
            } catch {
                fatalError("Error encoding scrum data")
            }
        }
    }
}
