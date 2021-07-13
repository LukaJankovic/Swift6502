//
//  adc.swift
//  Swift6502
//
//  Created by Luka Jankovic on 2021-07-09.
//

import Foundation

extension cpu {
    func add(other: UInt8) -> UInt8 {
        var res = UInt16(A) + UInt16(other);
        var carry = false;
        
        if res > 255 {
            res = res - 256;
            carry = true;
        }
        
        if C {
            res += 1;
        }
        
        C = carry;
        print(((A ^ other) >> 7) == 0)
        print(((UInt16(A) ^ res) >> 7 != 0));
        O = ((A ^ other) >> 7) == 0 && (((UInt16(A) ^ res) >> 7) != 0);
        updateZNFlags(registry: UInt8(res));
        return UInt8(res);
    }

    func ADC_IM(memory: [UInt8]) -> [UInt8] {
        A = add(other: immediate(memory: memory));
        return memory;
    }
    
    func ADC_ZP(memory: [UInt8]) -> [UInt8] {
        A = add(other: zeroPageRead(memory: memory));
        return memory;
    }
    
    func ADC_ZP_X(memory: [UInt8]) -> [UInt8] {
        A = add(other: zeroPageX(memory: memory));
        return memory;
    }
    
    func ADC_AB(memory: [UInt8]) -> [UInt8] {
        A = add(other: memory[Int(absolute(memory: memory))]);
        return memory;
    }
    
    func ADC_AB_X(memory: [UInt8]) -> [UInt8] {
        A = add(other: memory[Int(absoluteX(memory: memory))]);
        return memory;
    }
    
    func ADC_AB_Y(memory: [UInt8]) -> [UInt8] {
        A = add(other: memory[Int(absoluteY(memory: memory))]);
        return memory;
    }
}
