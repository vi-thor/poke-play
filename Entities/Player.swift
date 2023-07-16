//
//  Player.swift
//  poke-play
//
//  Created by Vitor Gonçalves on 15/07/2023.
//

import Foundation


class Player {
    
    var Id: UUID
    var Name: String
    var Wins:Int?
    var pokedex: [Pokemon]
    
    init(Id: UUID = UUID(), Name: String, pokedex: [Pokemon]) {
        self.Id = Id
        self.Name = Name
        self.pokedex = pokedex
    }
}
