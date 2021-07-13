//
//  jmp.swift
//  Swift6502
//
//  Created by Luka Jankovic on 2021-07-08.
//

import Foundation

extension cpu {
    func JMP_AB(memory: [UInt8]) -> [UInt8] {
        PC = absolute(memory: memory)
        return memory
    }
}
