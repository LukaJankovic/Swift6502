//
//  asl.swift
//  Swift6502
//
//  Created by Luka Jankovic on 2021-07-09.
//

import Foundation

extension cpu {
    func ASL(_ M: UInt8) -> UInt8 {
        if ((M & (1 << 7)) != 0) {
            C = true;
        } else {
            C = false;
        }
        
        let res = UInt8((UInt16(M) * 2) & 0xFF);
        updateZNFlags(registry: res);
        return res;
    }
    
    func ASL_AC(memory: [UInt8]) -> [UInt8] {
        A = ASL(A);
        cycles += 2;
        return memory;
    }
    
    func ASL_ZP(memory: [UInt8]) -> [UInt8] {
        var memoryCopy = memory;
        let address = Int(zeroPageAddress(memory: memory));
        
        memoryCopy[address] = ASL(memory[address]);
        cycles += 2;
        return memoryCopy;
    }
    
    func ASL_ZP_X(memory: [UInt8]) -> [UInt8] {
        var memoryCopy = memory;
        let address = Int(zeroPageAddressX(memory: memory));
        
        memoryCopy[address] = ASL(memory[address]);
        cycles += 2;
        return memoryCopy;
    }
    
    func ASL_AB(memory: [UInt8]) -> [UInt8] {
        var memoryCopy = memory;
        let address = Int(absolute(memory: memory));
        
        memoryCopy[address] = ASL(memory[address]);
        cycles += 2;
        return memoryCopy;
    }
    
    func ASL_AB_X(memory: [UInt8]) -> [UInt8] {
        var memoryCopy = memory;
        let address = Int(absoluteX(memory: memory));
        
        memoryCopy[address] = ASL(memory[address]);
        cycles += 2;
        return memoryCopy;
    }
}
