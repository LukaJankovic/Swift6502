//
//  branch.swift
//  Swift6502
//
//  Created by Luka Jankovic on 2021-07-12.
//

import Foundation

extension cpu {
    func BCC(memory: [UInt8]) -> [UInt8] {
        cycles += 1;
        if !C {
            PC += UInt16(fetchByte(memory: memory));
        }
        return memory;
    }
    
    func BCS(memory: [UInt8]) -> [UInt8] {
        cycles += 1;
        if C {
            PC += UInt16(fetchByte(memory: memory));
        }
        return memory;
    }
    
    func BEQ(memory: [UInt8]) -> [UInt8] {
        cycles += 1;
        if Z {
            PC += UInt16(fetchByte(memory: memory));
        }
        return memory;
    }
    
    func BMI(memory: [UInt8]) -> [UInt8] {
        cycles += 1;
        if N {
            PC += UInt16(fetchByte(memory: memory));
        }
        return memory;
    }
    
    func BNE(memory: [UInt8]) -> [UInt8] {
        cycles += 1;
        if !Z {
            PC += UInt16(fetchByte(memory: memory));
        }
        return memory;
    }
    
    func BPL(memory: [UInt8]) -> [UInt8] {
        cycles += 1;
        if !N {
            PC += UInt16(fetchByte(memory: memory));
        }
        return memory;
    }
    
    func BVC(memory: [UInt8]) -> [UInt8] {
        cycles += 1;
        if !O {
            PC += UInt16(fetchByte(memory: memory));
        }
        return memory;
    }
    
    func BVS(memory: [UInt8]) -> [UInt8] {
        cycles += 1;
        if O {
            PC += UInt16(fetchByte(memory: memory));
        }
        return memory;
    }
}
