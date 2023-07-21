//
//  Validation.swift
//  poke-play
//
//  Created by Vitor Gonçalves on 19/07/2023.
//

import Foundation

class Validation {
    private let regexExpNumber: Regex = /[0-9]/
    
    public func isNil(input: String) -> Bool {
       
        if(input.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty) {
            return true
        } else {
            return false
        }
    }
    
    public func isStartingWithBlankSpace(input: String) -> Bool {
        return input.starts(with: " ")
    }
    
    public func isNumber(input: String) -> Bool {
        return input.contains(self.regexExpNumber)
    }
    
    public func isText(input:String) -> Bool {
        return input.contains(/[a-zA-Z]/)
    }
    
    public func isValidNature(input:String) -> Bool {
        let nature = Array<String>(arrayLiteral: "GRASS", "FIRE", "WATER", "ELECTRIC")        
        return nature.contains(input.uppercased())
    }
}
