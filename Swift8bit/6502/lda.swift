//
//  lda.swift
//  Swift6502
//
//  Created by Luka Jankovic on 2021-07-08.
//

import Foundation

extension cpu {
    func LDA_IM(memory: [UInt8]) -> [UInt8] {
        A = immediate(memory: memory);
        updateZNFlags(registry: A);
        return memory;
    }
    
    func LDA_ZP(memory: [UInt8]) -> [UInt8] {
        A = zeroPageRead(memory: memory);
        updateZNFlags(registry: A);
        return memory;
    }
    
    func LDA_ZP_X(memory: [UInt8]) -> [UInt8] {
        A = zeroPageReadX(memory: memory);
        cycles += 1;
        updateZNFlags(registry: A);
        return memory;
    }
    
    func LDA_AB(memory: [UInt8]) -> [UInt8] {
        let address = absolute(memory: memory);
        A = readByte(memory: memory, address: Int(address));
        updateZNFlags(registry: A);
        return memory;
    }
    
    func LDA_AB_X(memory: [UInt8]) -> [UInt8] {
        let address = absoluteX(memory: memory);
        A = readByte(memory: memory, address: Int(address));
        updateZNFlags(registry: A);
        return memory;
    }
    
    func LDA_AB_Y(memory: [UInt8]) -> [UInt8] {
        let address = absoluteY(memory: memory);
        A = readByte(memory: memory, address: Int(address));
        updateZNFlags(registry: A);
        return memory;
    }
}
