//
//  Bash.swift
//  Truck
//
//  Created by defu.li on 2021/4/26.
//

import Foundation


class Bash: Script {
    func run(commandName: String, arguments: [String] = []) throws -> String {
        return try run(resolve(commandName), with: arguments)
    }

    private func resolve(_ command: String) throws -> String {
        guard var bashCommand = try? run("/bin/bash" , with: ["-c", "which \(command)"]) else {
            throw ScriptError.commandNotFound(name: command)
        }
        bashCommand = bashCommand.trimmingCharacters(in: NSCharacterSet.whitespacesAndNewlines)
        return bashCommand
    }

    // example：
    //  let files = bash.run(commandName: "ls", arguments: ["-la", "~/Desktop"])
    /**
     let bash = Bash()
     let files = try? bash.run(commandName: "ls", arguments: ["-la", "~/Desktop"])
     print(files)
     
     if let lsOutput = try? bash.run(commandName: "ls", arguments: []) { print(lsOutput) }
     if let output = try? bash.run(commandName: "ls", arguments: ["-la"]) { print(output)}
     
     // file:///Users/defu/Library/Containers/com.defu.Wf/Data/Documents/test.txt
     // let file = FileHelper()
     // file.write(fileName: "test", data: "submit btn action...")
     */
    private func run(_ command: String, with arguments: [String] = []) throws -> String {
        let process = Process()
        process.launchPath = command
        process.arguments = arguments
        let outputPipe = Pipe()
        process.standardOutput = outputPipe
        process.launch()
        let outputData = outputPipe.fileHandleForReading.readDataToEndOfFile()
        let output = String(decoding: outputData, as: UTF8.self)
        return output
    }
    
}
