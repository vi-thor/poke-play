//
//  PlayerRepository.swift
//  poke-play
//
//  Created by Vitor Gonçalves on 16/07/2023.
//

import Foundation


class PlayerRepository {
    let validation = Validation()
    func choosePokemon(player: Player, pokemonRepository: PokemonRepository)-> Void {
        
        print("Your pokedex is empty, please choose one pokemon!")
        pokemonRepository.showAllPokemons()
        
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
        
        let pokemon = pokemonRepository.getPokemon(name: pokemonName)
        player.pokedex.append(pokemon) //add to array
    }
    
    func showPokedex(player: Player, pokemonRepository: PokemonRepository) {
        print("\n\n\n\n")
        print("|------- POKEDEX - [\(player.Name)] -------|")
        player.pokedex.forEach { pokemon in
            pokemonRepository.printPokemon(pokemon: pokemon)
        }
    }

    
}
