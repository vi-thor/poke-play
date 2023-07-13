//
//  Pokemon.swift
//  poke-play
//
//  Created by Vitor Gonçalves on 13/07/2023.
//

import Foundation


class Pokemon {
    var Id: Int
    var Name: String
    var Health: Int
    var Armour: Int
    var Damage: Int
    
    init(Id: Int, Name: String, Health: Int, Armour: Int, Damage: Int) {
        self.Id = Id
        self.Name = Name
        self.Health = Health
        self.Armour = Armour
        self.Damage = Damage
    }
    
}
