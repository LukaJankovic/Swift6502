//
//  sty.swift
//  Swift6502
//
//  Created by Luka Jankovic on 2021-07-08.
//

import Foundation

extension cpu {
    func STY_ZP(memory: [UInt8]) -> [UInt8] {
        var memoryCopy = memory;
        let address = zeroPageAddress(memory: memory);
        memoryCopy[Int(address)] = Y;
        return memoryCopy;
    }
    
    func STY_ZP_X(memory: [UInt8]) -> [UInt8] {
        var memoryCopy = memory;
        let address = zeroPageAddressY(memory: memory);
        memoryCopy[Int(address)] = Y;
        return memoryCopy;
    }
    
    func STY_AB(memory: [UInt8]) -> [UInt8] {
        var memoryCopy = memory;
        let address = absolute(memory: memory);
        memoryCopy[Int(address)] = Y;
        return memoryCopy;
    }
}
