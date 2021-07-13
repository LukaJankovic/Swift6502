//
//  asl.swift
//  Swift6502
//
//  Created by Luka Jankovic on 2021-07-09.
//

import Foundation

extension cpu {
    func ASL_AC(memory: [UInt8]) -> [UInt8] {
        
        print(String(A, radix: 2));
        print(String((1 << 7), radix: 2));
        print((A & (1 << 7)));
        
        if ((A & (1 << 7)) != 0) {
            C = true;
        } else {
            C = false;
        }
        
        A = A << 1;
        cycles += 2;
        updateZNFlags(registry: A);
        return memory;
    }
    
    func ASL_ZP(memory: [UInt8]) -> [UInt8] {
        var memoryCopy = memory;
        let address = Int(zeroPageAddress(memory: memory));
        if (memory[address] & (1 << 7)) != 0 {
            C = true;
        } else {
            C = false;
        }
        
        memoryCopy[address] = memory[address] << 1;
        cycles += 2;
        updateZNFlags(registry: memory[address]);
        return memoryCopy;
    }
    
    func ASL_ZP_X(memory: [UInt8]) -> [UInt8] {
        var memoryCopy = memory;
        let address = Int(zeroPageAddressX(memory: memory));
        if (memory[address] & (1 << 7)) != 0 {
            C = true;
        } else {
            C = false;
        }
        
        memoryCopy[address] = memory[address] << 1;
        cycles += 2;
        updateZNFlags(registry: memory[address]);
        return memoryCopy;
    }
    
    func ASL_AB(memory: [UInt8]) -> [UInt8] {
        var memoryCopy = memory;
        let address = Int(absolute(memory: memory));
        if (memory[address] & (1 << 7)) != 0 {
            C = true;
        } else {
            C = false;
        }
        
        memoryCopy[address] = memory[address] << 1;
        cycles += 2;
        updateZNFlags(registry: memory[address]);
        return memoryCopy;
    }
    
    func ASL_AB_X(memory: [UInt8]) -> [UInt8] {
        var memoryCopy = memory;
        let address = Int(absoluteX(memory: memory));
        if (memory[address] & (1 << 7)) != 0 {
            C = true;
        } else {
            C = false;
        }
        
        memoryCopy[address] = memory[address] << 1;
        cycles += 2;
        updateZNFlags(registry: memory[address]);
        return memoryCopy;
    }
}
