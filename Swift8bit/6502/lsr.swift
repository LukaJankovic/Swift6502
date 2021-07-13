//
//  LSR.swift
//  Swift6502
//
//  Created by Luka Jankovic on 2021-07-09.
//

import Foundation

extension cpu {
    func LSR(_ M: UInt8) -> UInt8 {
        if ((M & (1 << 7)) != 0) {
            C = true;
        } else {
            C = false;
        }
        
        let res = M >> 1;
        updateZNFlags(registry: res);
        return res;
    }
    
    func LSR_AC(memory: [UInt8]) -> [UInt8] {
        A = LSR(A);
        cycles += 2;
        return memory;
    }
    
    func LSR_ZP(memory: [UInt8]) -> [UInt8] {
        var memoryCopy = memory;
        let address = Int(zeroPageAddress(memory: memory));
        
        memoryCopy[address] = LSR(memory[address]);
        cycles += 2;
        return memoryCopy;
    }
    
    func LSR_ZP_X(memory: [UInt8]) -> [UInt8] {
        var memoryCopy = memory;
        let address = Int(zeroPageAddressX(memory: memory));
        
        memoryCopy[address] = LSR(memory[address]);
        cycles += 2;
        return memoryCopy;
    }
    
    func LSR_AB(memory: [UInt8]) -> [UInt8] {
        var memoryCopy = memory;
        let address = Int(absolute(memory: memory));
        
        memoryCopy[address] = LSR(memory[address]);
        cycles += 2;
        return memoryCopy;
    }
    
    func LSR_AB_X(memory: [UInt8]) -> [UInt8] {
        var memoryCopy = memory;
        let address = Int(absoluteX(memory: memory));
        
        memoryCopy[address] = LSR(memory[address]);
        cycles += 2;
        return memoryCopy;
    }
}
