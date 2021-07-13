//
//  cmp.swift
//  Swift6502
//
//  Created by Luka Jankovic on 2021-07-13.
//

import Foundation

extension cpu {
    func CMP(reg: UInt8, other: UInt8) {
        C = reg >= other;
        Z = reg == other;
        N = (((reg - other) >> 7) != 0);
    }
    
    func CMP_IM(memory: [UInt8]) -> [UInt8] {
        CMP(reg: A, other: immediate(memory: memory));
        return memory;
    }
    
    func CMP_ZP(memory: [UInt8]) -> [UInt8] {
        CMP(reg: A, other: zeroPageRead(memory: memory));
        return memory;
    }
    
    func CMP_ZP_X(memory: [UInt8]) -> [UInt8] {
        CMP(reg: A, other: zeroPageX(memory: memory));
        return memory;
    }
    
    func CMP_AB(memory: [UInt8]) -> [UInt8] {
        CMP(reg: A, other: memory[Int(absolute(memory: memory))]);
        return memory;
    }
    
    func CMP_AB_X(memory: [UInt8]) -> [UInt8] {
        CMP(reg: A, other: memory[Int(absoluteX(memory: memory))]);
        return memory;
    }
    
    func CMP_AB_Y(memory: [UInt8]) -> [UInt8] {
        CMP(reg: A, other: memory[Int(absoluteY(memory: memory))]);
        return memory;
    }
    
    func CPX_IM(memory: [UInt8]) -> [UInt8] {
        CMP(reg: X, other: immediate(memory: memory));
        return memory;
    }
    
    func CPX_ZP(memory: [UInt8]) -> [UInt8] {
        CMP(reg: X, other: zeroPageRead(memory: memory));
        return memory;
    }
    
    func CPX_AB(memory: [UInt8]) -> [UInt8] {
        CMP(reg: X, other: memory[Int(absolute(memory: memory))]);
        return memory;
    }
    
    func CPY_IM(memory: [UInt8]) -> [UInt8] {
        CMP(reg: Y, other: immediate(memory: memory));
        return memory;
    }
    
    func CPY_ZP(memory: [UInt8]) -> [UInt8] {
        CMP(reg: Y, other: zeroPageRead(memory: memory));
        return memory;
    }
    
    func CPY_AB(memory: [UInt8]) -> [UInt8] {
        CMP(reg: Y, other: memory[Int(absolute(memory: memory))]);
        return memory;
    }
}
