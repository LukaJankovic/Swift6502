//
//  sbc.swift
//  Swift6502
//
//  Created by Luka Jankovic on 2021-07-13.
//

import Foundation

extension cpu {
    func sbc(other: UInt8) -> UInt8 {
        var res = UInt16(A) - UInt16(other);
        var carry = false;
        
        if res > 255 {
            res = res - 256;
            carry = true;
        }
        
        if !C {
            res -= 1;
        }
        
        C = carry;
        V = ((A ^ other) >> 7) == 0 && (((UInt16(A) ^ res) >> 7) != 0);
        updateZNFlags(registry: UInt8(res));
        return UInt8(res);
    }

    func SBC_IM(memory: [UInt8]) -> [UInt8] {
        A = sbc(other: immediate(memory: memory));
        return memory;
    }
    
    func SBC_ZP(memory: [UInt8]) -> [UInt8] {
        A = sbc(other: zeroPageRead(memory: memory));
        return memory;
    }
    
    func SBC_ZP_X(memory: [UInt8]) -> [UInt8] {
        A = sbc(other: zeroPageReadX(memory: memory));
        return memory;
    }
    
    func SBC_AB(memory: [UInt8]) -> [UInt8] {
        A = sbc(other: memory[Int(absolute(memory: memory))]);
        return memory;
    }
    
    func SBC_AB_X(memory: [UInt8]) -> [UInt8] {
        A = sbc(other: memory[Int(absoluteX(memory: memory))]);
        return memory;
    }
    
    func SBC_AB_Y(memory: [UInt8]) -> [UInt8] {
        A = sbc(other: memory[Int(absoluteY(memory: memory))]);
        return memory;
    }
}
