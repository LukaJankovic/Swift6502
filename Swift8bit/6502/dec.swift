//
//  dec.swift
//  Swift6502
//
//  Created by Luka Jankovic on 2021-07-17.
//

import Foundation

extension cpu {
    func DEC(memory: [UInt8], address: Int) -> [UInt8] {
        var memoryCopy = memory;
        if memoryCopy[address] == 0 {
            memoryCopy[address] = 0xFF;
        } else {
            memoryCopy[address] -= 1;
        }
        updateZNFlags(registry: memoryCopy[address]);
        return memoryCopy;
    }
    
    func DEC_ZP(memory: [UInt8]) -> [UInt8] {
        return DEC(memory: memory, address: Int(zeroPageAddress(memory: memory)));
    }
    
    func DEC_ZP_X(memory: [UInt8]) -> [UInt8] {
        return DEC(memory: memory, address: Int(zeroPageAddressX(memory: memory)));
    }
    
    func DEC_AB(memory: [UInt8]) -> [UInt8] {
        return DEC(memory: memory, address: Int(absolute(memory: memory)));
    }
    
    func DEC_AB_X(memory: [UInt8]) -> [UInt8] {
        return DEC(memory: memory, address: Int(absoluteX(memory: memory)));
    }
    
    func DEX(memory: [UInt8]) -> [UInt8] {
        if X == 0 {
            X = 0xFF;
        } else {
            X -= 1;
        }
        updateZNFlags(registry: X);
        return memory;
    }
    
    func DEY(memory: [UInt8]) -> [UInt8] {
        if Y == 0 {
            Y = 0xFF;
        } else {
            Y -= 1;
        }
        updateZNFlags(registry: Y);
        return memory;
    }
}
