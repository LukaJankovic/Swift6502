//
//  tax.swift
//  Swift6502
//
//  Created by Luka Jankovic on 2021-07-12.
//

import Foundation

extension cpu {
    func TAX(memory: [UInt8]) -> [UInt8] {
        X = A;
        updateZNFlags(registry: X);
        cycles += 2;
        return memory;
    }
    
    func TAY(memory: [UInt8]) -> [UInt8] {
        Y = A;
        updateZNFlags(registry: Y);
        cycles += 2;
        return memory;
    }
    
    func TXA(memory: [UInt8]) -> [UInt8] {
        A = X;
        updateZNFlags(registry: A);
        cycles += 2;
        return memory;
    }
    
    func TYA(memory: [UInt8]) -> [UInt8] {
        A = Y;
        updateZNFlags(registry: A);
        cycles += 2;
        return memory;
    }
}
