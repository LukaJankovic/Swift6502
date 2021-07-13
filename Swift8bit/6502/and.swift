//
//  and.swift
//  Swift6502
//
//  Created by Luka Jankovic on 2021-07-09.
//

import Foundation

extension cpu {
    func AND_IM(memory: [UInt8]) -> [UInt8] {
        A = A & immediate(memory: memory);
        updateZNFlags(registry: A);
        return memory;
    }
    
    func AND_ZP(memory: [UInt8]) -> [UInt8] {
        A = A & zeroPageRead(memory: memory);
        updateZNFlags(registry: A);
        return memory;
    }
    
    func AND_ZP_X(memory: [UInt8]) -> [UInt8] {
        A = A & zeroPageX(memory: memory);
        updateZNFlags(registry: A);
        return memory;
    }
    
    func AND_AB(memory: [UInt8]) -> [UInt8] {
        A = A & memory[Int(absolute(memory: memory))];
        updateZNFlags(registry: A);
        return memory;
    }
    
    func AND_AB_X(memory: [UInt8]) -> [UInt8] {
        A = A & memory[Int(absoluteX(memory: memory))];
        updateZNFlags(registry: A);
        return memory;
    }
    
    func AND_AB_Y(memory: [UInt8]) -> [UInt8] {
        A = A & memory[Int(absoluteY(memory: memory))];
        updateZNFlags(registry: A);
        return memory;
    }
}
