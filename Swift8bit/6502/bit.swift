//
//  bit.swift
//  Swift6502
//
//  Created by Luka Jankovic on 2021-07-13.
//

import Foundation

extension cpu {
    
    func BitTest(_ x: UInt8) {
        updateZNFlags(registry: x);
        V = ((x >> 6) != 0);
    }
    
    func BIT_ZP(memory: [UInt8]) -> [UInt8] {
        BitTest(A & zeroPageRead(memory: memory));
        return memory;
    }
    
    func BIT_AB(memory: [UInt8]) -> [UInt8] {
        BitTest(A & memory[Int(absolute(memory: memory))]);
        return memory;
    }
}
