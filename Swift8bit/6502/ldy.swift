//
//  ldy.swift
//  Swift6502
//
//  Created by Luka Jankovic on 2021-07-08.
//

import Foundation

extension cpu {
    func LDY_IM(memory: [UInt8]) -> [UInt8] {
        Y = immediate(memory: memory);
        updateZNFlags(registry: Y);
        return memory;
    }
    
    func LDY_ZP(memory: [UInt8]) -> [UInt8] {
        Y = zeroPageRead(memory: memory);
        updateZNFlags(registry: Y);
        return memory;
    }
    
    func LDY_ZP_X(memory: [UInt8]) -> [UInt8] {
        Y = zeroPageReadY(memory: memory);
        cycles += 1;
        updateZNFlags(registry: Y);
        return memory;
    }
    
    func LDY_AB(memory: [UInt8]) -> [UInt8] {
        let address = absolute(memory: memory);
        Y = readByte(memory: memory, address: Int(address));
        updateZNFlags(registry: Y);
        return memory;
    }
    
    func LDY_AB_X(memory: [UInt8]) -> [UInt8] {
        let address = absoluteX(memory: memory);
        Y = readByte(memory: memory, address: Int(address));
        updateZNFlags(registry: Y);
        return memory;
    }
}
