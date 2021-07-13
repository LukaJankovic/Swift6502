//
//  sta.swift
//  Swift6502
//
//  Created by Luka Jankovic on 2021-07-08.
//

import Foundation

extension cpu {
    func STA_ZP(memory: [UInt8]) -> [UInt8] {
        var memoryCopy = memory;
        let address = zeroPageAddress(memory: memory);
        memoryCopy[Int(address)] = A;
        return memoryCopy;
    }
    
    func STA_ZP_X(memory: [UInt8]) -> [UInt8] {
        var memoryCopy = memory;
        let address = zeroPageAddressX(memory: memory);
        memoryCopy[Int(address)] = A;
        return memoryCopy;
    }
    
    func STA_AB(memory: [UInt8]) -> [UInt8] {
        var memoryCopy = memory;
        let address = absolute(memory: memory);
        memoryCopy[Int(address)] = A;
        return memoryCopy;
    }
    
    func STA_AB_X(memory: [UInt8]) -> [UInt8] {
        var memoryCopy = memory;
        let address = absoluteX(memory: memory);
        memoryCopy[Int(address)] = A;
        return memoryCopy;
    }
    
    func STA_AB_Y(memory: [UInt8]) -> [UInt8] {
        var memoryCopy = memory;
        let address = absoluteY(memory: memory);
        memoryCopy[Int(address)] = A;
        return memoryCopy;
    }
}
