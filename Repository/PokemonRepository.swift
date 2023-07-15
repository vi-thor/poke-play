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
    
    func getPokemon(name: String) -> Pokemon{
        if(!name.isEmpty) {
            
            let pokemon = pokemonList.first(where: { $0.Name == name })
            return pokemon!
        } else {
            return Pokemon(Name: "undefined", Health: 0, Armour: 0, Damage: 0, Nature: "not defined")
        }
    }
    
    func standardPokemons(){
        //grass element
        let bulbasaur = Pokemon( Name: "Bulbasaur", Health: 45, Armour: 49, Damage: 49, Nature: "GRASS")
        self.pokemonList.append(bulbasaur)
        
        //fire element
        let charmander = Pokemon(Name: "Charmander", Health: 39, Armour: 43, Damage: 52, Nature: "FIRE")
        self.pokemonList.append(charmander)
        
        //water element
        let squirtle = Pokemon( Name: "Squirtle", Health: 44, Armour: 65, Damage: 48, Nature: "WATER")
        self.pokemonList.append(squirtle)
        
        //electric element
        let pikachu = Pokemon( Name: "Pikachu", Health: 35, Armour: 40, Damage: 55, Nature: "ELECTRIC")
        self.pokemonList.append(pikachu)
    }
    
    func showAllPokemons() {
        
        self.pokemonList.forEach{ pokemon in
            printPokemon(pokemon: pokemon)
        }
    }
    
    func printPokemon(pokemon: Pokemon){
      
         print("Name: \(pokemon.Name) - [ \(pokemon.Nature) ] \n" +
        "Health: \(pokemon.Health) \n" +
        "Damage: \(pokemon.Damage) \n" +
        "Armour \(pokemon.Armour)")
        print("\n\n|-------------------------|\n")
    }
    
    func showPokemonDetails() {
        
        showAllPokemons()
        
        print("\n\n")
        print("Selecione um Pokemon pelo nome para ver mais detalhes")
        
        let input: String = readLine()!
        while(input.isEmpty) {
            print("Por favor, selecione um pokemon pelo nome")
        }
        
        print("Pokemon Selecionado foi:")
        printPokemon(pokemon: getPokemon(name: input))
    }
}
