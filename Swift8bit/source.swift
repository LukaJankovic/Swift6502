//
//  source.swift
//  Swift6502
//
//  Created by Luka Jankovic on 2021-07-09.
//

import Foundation

extension String {
    mutating func popFirst(_ k: Int) -> String {
        let retString = prefix(k);
        self = String(dropFirst(k));
        return String(retString);
    }
}

func readSourceString(source: String) -> [UInt8] {
    
    let MEM_SIZE = 1024 * 64;
    var memory: [UInt8] = [UInt8](repeating: 0, count: MEM_SIZE);
    
    var sourceCopy = source;
    
    while sourceCopy.hasPrefix(":") {
        sourceCopy.remove(at: source.startIndex);
        let dataSize = Int(sourceCopy.popFirst(2), radix: 16)!;
        let address = Int(sourceCopy.popFirst(4), radix: 16)!;
        let lineType = Int(sourceCopy.popFirst(2), radix: 16)!;
        
        for i in 0...dataSize - 1 {
            memory[address + i] = UInt8(sourceCopy.popFirst(2), radix: 16)!;
        }
        
        let _ = sourceCopy.popFirst(3);
    }
    
    return memory;
}
