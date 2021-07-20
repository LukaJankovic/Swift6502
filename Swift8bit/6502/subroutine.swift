//
//  subroutine.swift
//  Swift6502
//
//  Created by Luka Jankovic on 2021-07-19.
//

import Foundation

extension cpu {
    func JMP_AB(memory: [UInt8]) -> [UInt8] {
        PC = absolute(memory: memory)
        return memory
    }
    
    func JSR_AB(memory: [UInt8]) -> [UInt8] {
        var memoryCopy = memory;
        
        // PC - 1 ??
        memoryCopy = pushStack(val: UInt8((PC) >> 8), memory: memoryCopy);
        memoryCopy = pushStack(val: UInt8((PC) & 0x00FF), memory: memoryCopy);
        return memoryCopy;
    }
    
    func RTS(memory: [UInt8]) -> [UInt8] {
        let PCLow = popStack(memory: memory);
        let PCHigh = popStack(memory: memory);
        PC = UInt16(PCLow | (PCHigh << 8));
        return memory;
    }
}
