//
//  PokemonRepository.swift
//  poke-play
//
//  Created by Vitor Gonçalves on 13/07/2023.
//

import Foundation


class PokemonRepository {
    
    private var pokemonList: [Pokemon] = []
    
    init(){
        self.standardPokemons();
    }
    
    
    func GetAllPokemons() -> [Pokemon]{
        return self.pokemonList;
    }
    
    
    func addPokemon(pokemon: Pokemon){
        self.pokemonList.append(pokemon)
    }
    
    func getPokemon(id: Int) -> Pokemon{
        if(id != 0) {
            let pokemon = pokemonList.first(where: { $0.Id == id })
            return pokemon!
        } else {
            return Pokemon(Id: -1, Name: "undefined", Health: 0, Armour: 0, Damage: 0)
        }
    }
    
    func standardPokemons(){
        //grass element
        let bulbasaur = Pokemon(Id: 1, Name: "Bulbasaur", Health: 45, Armour: 49, Damage: 49)
        self.pokemonList.append(bulbasaur)
        
        //fire element
        let charmander = Pokemon(Id: 2, Name: "Charmander", Health: 39, Armour: 43, Damage: 52)
        self.pokemonList.append(charmander)
        
        //water element
        let squirtle = Pokemon(Id: 3, Name: "Squirtle", Health: 44, Armour: 65, Damage: 48)
        self.pokemonList.append(squirtle)
        
        //electric element
        let pikachu = Pokemon(Id: 4, Name: "Pikachu", Health: 35, Armour: 40, Damage: 55)
        self.pokemonList.append(pikachu)
    }
}
