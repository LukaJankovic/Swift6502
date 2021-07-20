//
//  ora.swift
//  Swift6502
//
//  Created by Luka Jankovic on 2021-07-13.
//

import Foundation

extension cpu {
    func ORA_IM(memory: [UInt8]) -> [UInt8] {
        A = A | immediate(memory: memory);
        updateZNFlags(registry: A);
        return memory;
    }
    
    func ORA_ZP(memory: [UInt8]) -> [UInt8] {
        A = A | zeroPageRead(memory: memory);
        updateZNFlags(registry: A);
        return memory;
    }
    
    func ORA_ZP_X(memory: [UInt8]) -> [UInt8] {
        A = A | zeroPageReadX(memory: memory);
        updateZNFlags(registry: A);
        return memory;
    }
    
    func ORA_AB(memory: [UInt8]) -> [UInt8] {
        A = A | memory[Int(absolute(memory: memory))];
        updateZNFlags(registry: A);
        return memory;
    }
    
    func ORA_AB_X(memory: [UInt8]) -> [UInt8] {
        A = A | memory[Int(absoluteX(memory: memory))];
        updateZNFlags(registry: A);
        return memory;
    }
    
    func ORA_AB_Y(memory: [UInt8]) -> [UInt8] {
        A = A | memory[Int(absoluteY(memory: memory))];
        updateZNFlags(registry: A);
        return memory;
    }
}
