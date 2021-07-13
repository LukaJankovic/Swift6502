//
//  status.swift
//  Swift6502
//
//  Created by Luka Jankovic on 2021-07-12.
//

import Foundation

extension cpu {
    func CLC(memory: [UInt8]) -> [UInt8] {
        cycles += 2;
        C = false;
        return memory;
    }
    
    func CLD(memory: [UInt8]) -> [UInt8] {
        cycles += 2;
        D = false;
        return memory;
    }
    
    func CLI(memory: [UInt8]) -> [UInt8] {
        cycles += 2;
        I = false;
        return memory;
    }
    
    func CLV(memory: [UInt8]) -> [UInt8] {
        cycles += 2;
        V = false;
        return memory;
    }
    
    func SEC(memory: [UInt8]) -> [UInt8] {
        cycles += 2;
        C = true;
        return memory;
    }
    
    func SED(memory: [UInt8]) -> [UInt8] {
        cycles += 2;
        D = true;
        return memory;
    }
    
    func SEI(memory: [UInt8]) -> [UInt8] {
        cycles += 2;
        I = true;
        return memory;
    }
}
