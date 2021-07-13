//
//  cpu.swift
//  Swift6502
//
//  Created by Luka Jankovic on 2021-06-10.
//

import Foundation

class cpu {
    var PC: UInt16  = 0x0000;   // Program Counter (In reality 0xFFFC)
    var SP: UInt16  = 0x0100;   // Stack Pointer (In reality only 8 bits, holds lower nibble so 0x0100 to 0x01FF)
    
    // General purpose registers
    var A: UInt8    = 0; // Accumulator
    var X: UInt8    = 0;
    var Y: UInt8    = 0;
    
    var C: Bool     = false; // Carry
    var Z: Bool     = false; // Zero
    var I: Bool     = false; // Interrupt disable
    var D: Bool     = false; // Decimal mode
    var B: Bool     = false; // Break
    var V: Bool     = false; // Overflow
    var N: Bool     = false; // Negative
    
    var cycles: Int = 0;
    
    var opcodes: [UInt8: ([UInt8]) -> [UInt8]] = [:];

    init() {
        opcodes = [
            0xA9: LDA_IM,
            0xA5: LDA_ZP,
            0xB5: LDA_ZP_X,
            0xAD: LDA_AB,
            0xBD: LDA_AB_X,
            0xB9: LDA_AB_Y,
            
            0xA2: LDX_IM,
            0xA6: LDX_ZP,
            0xB6: LDX_ZP_Y,
            0xAE: LDX_AB,
            0xBE: LDX_AB_Y,
            
            0xA0: LDY_IM,
            0xA4: LDY_ZP,
            0xB4: LDY_ZP_X,
            0xAC: LDY_AB,
            0xBC: LDY_AB_X,
            
            0x85: STA_ZP,
            0x95: STA_ZP_X,
            0x8D: STA_AB,
            0x9D: STA_AB_X,
            0x99: STA_AB_Y,
            
            0x86: STX_ZP,
            0x96: STX_ZP_Y,
            0x8E: STX_AB,
            
            0x84: STY_ZP,
            0x94: STY_ZP_X,
            0x8C: STY_AB,
            
            0x69: ADC_IM,
            0x65: ADC_ZP,
            0x75: ADC_ZP_X,
            0x6D: ADC_AB,
            0x7D: ADC_AB_X,
            0x79: ADC_AB_Y,
            
            0xE9: SBC_IM,
            0xE5: SBC_ZP,
            0xF5: SBC_ZP_X,
            0xED: SBC_AB,
            0xFD: SBC_AB_X,
            0xF9: SBC_AB_Y,
            
            0xC9: CMP_IM,
            0xC5: CMP_ZP,
            0xD5: CMP_ZP_X,
            0xCD: CMP_AB,
            0xDD: CMP_AB_X,
            0xD9: CMP_AB_Y,
            
            0xE0: CPX_IM,
            0xE4: CPX_ZP,
            0xEC: CPX_AB,
            
            0xC0: CPY_IM,
            0xC4: CPY_ZP,
            0xCC: CPY_AB,
            
            0x29: AND_IM,
            0x25: AND_ZP,
            0x35: AND_ZP_X,
            0x2D: AND_AB,
            0x3D: AND_AB_X,
            0x39: AND_AB_Y,
            
            0x49: EOR_IM,
            0x45: EOR_ZP,
            0x55: EOR_ZP_X,
            0x4D: EOR_AB,
            0x5D: EOR_AB_X,
            0x59: EOR_AB_Y,
            
            0x09: ORA_IM,
            0x05: ORA_ZP,
            0x15: ORA_ZP_X,
            0x0D: ORA_AB,
            0x1D: ORA_AB_X,
            0x19: ORA_AB_Y,
            
            0x0A: ASL_AC,
            0x06: ASL_ZP,
            0x16: ASL_ZP_X,
            0x0E: ASL_AB,
            0x1E: ASL_AB_X,
            
            0xAA: TAX,
            0xA8: TAY,
            0x8A: TXA,
            0x9A: TYA,
            
            0x90: BCC,
            0xB0: BCS,
            0xF0: BEQ,
            0x30: BMI,
            0xD0: BNE,
            0x10: BPL,
            0x50: BVC,
            0x70: BVS,
            
            0x18: CLC,
            0xD8: CLD,
            0x58: CLI,
            0xB8: CLV,
            0x38: SEC,
            0xF8: SED,
            0x78: SEI,
            
            0x24: BIT_ZP,
            0x2C: BIT_AB,
            
            0x4C: JMP_AB
        ]
    }
    
    func reset() {
        //PC = 0xFFFC;
        SP = 0x0100;
        
        A = 0;
        X = 0;
        Y = 0;
        
        C = false;
        Z = false;
        I = false;
        D = false;
        B = false;
        V = false;
        N = false;
    }
    
    func readByte(memory: [UInt8], address: Int) -> UInt8 {
        cycles += 1;
        return memory[address];
    }
    
    func fetchByte(memory: [UInt8]) -> UInt8 {
        if PC > memory.count {
            PC = 0;
        }
        let data = readByte(memory: memory, address: Int(PC));
        PC += 1;
        return data;
    }
    
    func execute(memory: [UInt8]) -> [UInt8] {
        let instruction = fetchByte(memory: memory);
        var memoryNew: [UInt8] = [];
        if let operation = opcodes[instruction] {
            memoryNew = operation(memory);
        };
        return memoryNew;
    }
    
    func updateZNFlags(registry: UInt8) {
        Z = (registry == 0);
        N = (registry >> 7) != 0;
    }
    
    /// Adressing modes
    
    /// Returns content
    func immediate(memory: [UInt8]) -> UInt8 {
        return fetchByte(memory: memory);
    }
    
    func zeroPageAddress(memory: [UInt8]) -> UInt8 {
        return fetchByte(memory: memory);
    }
    
    func zeroPageAddressX(memory: [UInt8]) -> UInt8 {
        let address = readByte(memory: memory, address: Int(PC) + Int(X));
        PC += 1;
        return address;
    }
    
    func zeroPageAddressY(memory: [UInt8]) -> UInt8 {
        let address = readByte(memory: memory, address: Int(PC) + Int(Y));
        PC += 1;
        return address;
    }
    
    func zeroPageRead(memory: [UInt8]) -> UInt8 {
        return readByte(memory: memory, address: Int(zeroPageAddress(memory: memory)));
    }
    
    func zeroPageX(memory: [UInt8]) -> UInt8 {
        return readByte(memory: memory, address: Int(zeroPageAddress(memory: memory) + X));
    }
    
    func zeroPageY(memory: [UInt8]) -> UInt8 {
        return readByte(memory: memory, address: Int(zeroPageAddress(memory: memory) + Y));
    }
    
    /// Returns address
    func absolute(memory: [UInt8]) -> UInt16 {
        // Little endian
        return UInt16(fetchByte(memory: memory) | (fetchByte(memory: memory) << 8));
    }
    
    func absoluteX(memory: [UInt8]) -> UInt16 {
        let AL = fetchByte(memory: memory);
        let AH = fetchByte(memory: memory);
        
        if var address = UInt16("\(AL)\(AH)") {
            address += UInt16(X);
            return address;
        }
        
        return 0;
    }
    
    func absoluteY(memory: [UInt8]) -> UInt16 {
        let AL = fetchByte(memory: memory);
        let AH = fetchByte(memory: memory);
        
        if var address = UInt16("\(AL)\(AH)") {
            address += UInt16(Y);
            return address;
        }
        
        return 0;
    }
}
