//
//  Console.swift
//  poke-play
//
//  Created by Vitor Gonçalves on 15/07/2023.
//

import Foundation


class Console {
    
    static func Clear() -> Void{
        print("any value", terminator: Array(repeating: "\n", count: 100).joined())
    }
}
