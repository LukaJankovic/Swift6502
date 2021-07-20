//
//  main.swift
//  Swift6502
//
//  Created by Luka Jankovic on 2021-06-10.
//

import Foundation

do {
    let files = try FileManager.default.contentsOfDirectory(atPath: FileManager.default.currentDirectoryPath);
    for file in files {
        let fileURL = URL(string: FileManager.default.currentDirectoryPath)?.appendingPathComponent(file);
        if fileURL?.pathExtension == "hex" {
            do {
                let sourceString = try String(contentsOfFile: fileURL!.absoluteString, encoding: .utf8);
                var  memory = readSourceString(source: sourceString);
                
                let testCpu = cpu();
                
                while true {
                    memory = testCpu.execute(memory: memory);
                }
            } catch {
                print(error.localizedDescription)
            }
        }
    }
} catch {
    print(error.localizedDescription)
}
