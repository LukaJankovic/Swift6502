//
//  inc.swift
//  Swift6502
//
//  Created by Luka Jankovic on 2021-07-17.
//

import Foundation

extension cpu {
    func INC(memory: [UInt8], address: Int) -> [UInt8] {
        var memoryCopy = memory;
        if memoryCopy[address] == 0xFF {
            memoryCopy[address] = 0;
        } else {
            memoryCopy[address] += 1;
        }
        updateZNFlags(registry: memoryCopy[address]);
        return memoryCopy;
    }
    
    func INC_ZP(memory: [UInt8]) -> [UInt8] {
        return INC(memory: memory, address: Int(zeroPageAddress(memory: memory)));
    }
    
    func INC_ZP_X(memory: [UInt8]) -> [UInt8] {
        return INC(memory: memory, address: Int(zeroPageAddressX(memory: memory)));
    }
    
    func INC_AB(memory: [UInt8]) -> [UInt8] {
        return INC(memory: memory, address: Int(absolute(memory: memory)));
    }
    
    func INC_AB_X(memory: [UInt8]) -> [UInt8] {
        return INC(memory: memory, address: Int(absoluteX(memory: memory)));
    }
    
    func INX(memory: [UInt8]) -> [UInt8] {
        if X == 0xFF {
            X = 0;
        } else {
            X += 1;
        }
        updateZNFlags(registry: X);
        return memory;
    }
    
    func INY(memory: [UInt8]) -> [UInt8] {
        if Y == 0xFF {
            Y = 0;
        } else {
            Y += 1;
        }
        updateZNFlags(registry: Y);
        return memory;
    }
}
