//
//  PlayerRepository.swift
//  poke-play
//
//  Created by Vitor Gonçalves on 16/07/2023.
//

import Foundation


class PlayerRepository {
    let pokemonRepository = PokemonRepository()
    let validation = Validation()
    func choosePokemon(player: Player)-> Void {
        
        print("Your pokedex is empty, please choose one pokemon!")
        self.pokemonRepository.showAllPokemons()
        
        print("Write the name of the pokemon that you want to pick!")
        var pokemonName: String = readLine()!
        
        while(validation.isStartingWithBlankSpace(input: pokemonName)) {
            print("The pokemon name can not start with empty space, please try again.")
            pokemonName = readLine()!
        }
        
        while(!validation.isText(input: pokemonName)) {
            print("The pokemon name can have numbers, please try again.")
            pokemonName = readLine()!
        }
        
        while(validation.isNil(input: pokemonName) ) {
            print("The pokemon name can not be empty, please try again.")
            pokemonName = readLine()!
        }
        
        let pokemon = self.pokemonRepository.getPokemon(name: pokemonName)
        player.pokedex.append(pokemon) //add to array
    }
    
    func showPokedex(player: Player) {
        print("\n\n\n\n")
        print("|------- POKEDEX - [\(player.Name)] -------|")
        player.pokedex.forEach { pokemon in
            self.pokemonRepository.printPokemon(pokemon: pokemon)
        }
    }

    
}
