//
//  Pokemon.swift
//  poke-play
//
//  Created by Vitor Gonçalves on 13/07/2023.
//

import Foundation


class Pokemon {
    var Id: UUID
    var Name: String
    var Health: Int
    var Armour: Int
    var Damage: Int
    var Nature: String
    var Attacks:[Attack]
    
    init(Id: UUID = UUID(), Name: String, Health: Int, Armour: Int, Damage: Int, Nature: String, Attacks: [Attack]) {
        self.Id = Id
        self.Name = Name
        self.Health = Health
        self.Armour = Armour
        self.Damage = Damage
        self.Nature = Nature
        self.Attacks = Attacks
    }
    
    init(pokemon: Pokemon) {
        self.Id = pokemon.Id
        self.Name = pokemon.Name
        self.Health = pokemon.Health
        self.Armour = pokemon.Armour
        self.Damage = pokemon.Damage
        self.Nature = pokemon.Nature
        self.Attacks = pokemon.Attacks
    }
}

struct Attack{
    var Name: String
    var Damage: Int
}
