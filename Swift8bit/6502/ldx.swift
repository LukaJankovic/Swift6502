//
//  ldx.swift
//  Swift6502
//
//  Created by Luka Jankovic on 2021-07-08.
//

import Foundation

extension cpu {
    func LDX_IM(memory: [UInt8]) -> [UInt8] {
        X = immediate(memory: memory);
        updateZNFlags(registry: X);
        return memory;
    }
    
    func LDX_ZP(memory: [UInt8]) -> [UInt8] {
        X = zeroPageRead(memory: memory);
        updateZNFlags(registry: X);
        return memory;
    }
    
    func LDX_ZP_Y(memory: [UInt8]) -> [UInt8] {
        X = zeroPageY(memory: memory);
        cycles += 1;
        updateZNFlags(registry: X);
        return memory;
    }
    
    func LDX_AB(memory: [UInt8]) -> [UInt8] {
        let address = absolute(memory: memory);
        X = readByte(memory: memory, address: Int(address));
        updateZNFlags(registry: X);
        return memory;
    }
    
    func LDX_AB_Y(memory: [UInt8]) -> [UInt8] {
        let address = absoluteX(memory: memory);
        Y = readByte(memory: memory, address: Int(address));
        updateZNFlags(registry: X);
        return memory;
    }
}
