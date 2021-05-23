//
//  File.swift
//  Truck
//
//  Created by defu.li on 2021/4/29.
//

import Foundation

class FileHelper {
    
    
    /* Returns the default singleton instance.
    */
    open var instance: FileHelper {
        get {
            return FileHelper()
        }
        
    }
    
    func write(fileName: String, data: String) -> String {
        // Create data to be saved
        guard let dataStr = data.data(using: .utf8) else {
            print("[File#write] Unable to convert string to data")
            return ""
        }
        // Save the data
        do {
            let directoryURL = FileManager.default.urls(for: .applicationSupportDirectory, in: .userDomainMask)[0]
            let fileURL = URL(fileURLWithPath: fileName, relativeTo: directoryURL).appendingPathExtension("txt")
            try dataStr.write(to: fileURL)
            // /Users/defu/Library/Containers/com.defu.Wf/Data/Documents/test.txt
            // /Users/defu/Library/Containers/com.defu.Wf/Data/Library/Application%20Support/test.txt
            print("File saved: \(fileURL.absoluteURL)")
            return fileURL.absoluteURL.absoluteString
        } catch {
            // Catch any errors
            print(error.localizedDescription)
            return ""
        }
        
    }
    
    
}
