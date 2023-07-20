//
//  PlayerRepository.swift
//  poke-play
//
//  Created by Vitor Gonçalves on 16/07/2023.
//

import Foundation


class PlayerRepository {
    let pokemonRepository = PokemonRepository()
    
    func choosePokemon(player: Player)-> Void {
        
        print("Your pokedex is empty, please choose one pokemon!")
        self.pokemonRepository.showAllPokemons()
        
        print("Write the name of the pokemon that you want to pick!")
        let pokemonName = readLine()!
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
