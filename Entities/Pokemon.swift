//
//  Pokemon.swift
//  poke-play
//
//  Created by Vitor Gonçalves on 13/07/2023.
//

import Foundation


class Pokemon: Codable {
    var Id: UUID
    
    var Name: String
    var Health: Int
    var Armour: Int
    var Damage: Int
    var Nature: String
    init(Id: UUID = UUID(), Name: String, Health: Int, Armour: Int, Damage: Int, Nature: String) {
        self.Id = Id
        self.Name = Name
        self.Health = Health
        self.Armour = Armour
        self.Damage = Damage
        self.Nature = Nature
    }
}
