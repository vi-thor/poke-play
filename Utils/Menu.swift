//
//  Menu.swift
//  poke-play
//
//  Created by Vitor Gonçalves on 13/07/2023.
//

import Foundation

class Utils {
    func drawHomeMenu() {
        
        var input:String
        repeat {
            
            print("|----------MENU----------|")
            print("| 1 - Play               |")
            print("| 2 - Pokemons           |")
            print("| 3 - Exit               |")
            print("| Selecione uma Opção:", terminator: "")
            
            input = readLine()!
            while(input == "") {
                print("Não é possível prosseguir sem escolher uma opção\npor favor tente novamente.")
                input = readLine()!
            }
            
            selectMenuOptions(input: input)
            
            
                       
        }while(input == "Exit")

    }
    
     func selectMenuOptions(input: String) {
        
        switch(input) {
            case "1":
                    drawPlayMenu()
                break
            case "2":
                    drawPokemonCreation()
                break
            default:
                break
        }
    }

    func drawPlayMenu() {
        print("Going to play")
    }
    
    func drawPokemonCreation() {
        let pokemonRepository = PokemonRepository()
        var input: String = " "
        print("|----------MENU----------|")
        print("| 1 - All Pokemons       |")
        print("| 2 - Create new Pokemon |")
        print("| 3 - Exit               |")
        print("| Selecione uma Opção:", terminator: "")
        
        input = readLine()!
        while(input == "") {
            print("Não é possível prosseguir sem escolher uma opção\npor favor tente novamente.")
            input = readLine()!
        }
        
        switch(input){
        case "1":
            let pokemonList = pokemonRepository.GetAllPokemons()
            pokemonList.forEach{ pokemon in
                print("Name: \(pokemon.Name)\nHealth: \(pokemon.Health)\nDamage:\(pokemon.Damage)\nArmour:\(pokemon.Armour)", terminator: "\n\n")
                
            }
            break
        case "2":
            break
        default:
            break
        }
    }

    
}

