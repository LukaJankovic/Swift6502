//
//  stx.swift
//  Swift6502
//
//  Created by Luka Jankovic on 2021-07-08.
//

import Foundation

extension cpu {
    func STX_ZP(memory: [UInt8]) -> [UInt8] {
        var memoryCopy = memory;
        let address = zeroPageAddress(memory: memory);
        memoryCopy[Int(address)] = X;
        return memoryCopy;
    }
    
    func STX_ZP_Y(memory: [UInt8]) -> [UInt8] {
        var memoryCopy = memory;
        let address = zeroPageAddressY(memory: memory);
        memoryCopy[Int(address)] = X;
        return memoryCopy;
    }
    
    func STX_AB(memory: [UInt8]) -> [UInt8] {
        var memoryCopy = memory;
        let address = absolute(memory: memory);
        memoryCopy[Int(address)] = X;
        return memoryCopy;
    }
}
