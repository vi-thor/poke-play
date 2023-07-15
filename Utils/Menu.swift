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
            print("| Selecione uma Opção:", terminator: "\n")
            
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
        case "3":
            exit(0)
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
        print("| 2 - Detail Pokemon     |")
        print("| 3 - Create new Pokemon |")
        print("| 4 - Back               |")
        print("| Selecione uma Opção:", terminator: "")
        
        input = readLine()!
        while(input == "") {
            print("Não é possível prosseguir sem escolher uma opção\npor favor tente novamente.")
            input = readLine()!
        }
        
        switch(input){
        case "1":
            pokemonRepository.showAllPokemons()
            print("\n\n\n")
            drawPokemonCreation()
            break
        case "2":
            pokemonRepository.showPokemonDetails()
            print("\n\n\n")
            drawPokemonCreation()
            break
        case "4":
            drawHomeMenu()
            Console.Clear()
            break
        default:
            print("Nenhuma opção foi selecionada, tente novamente")
            drawPokemonCreation()
            break
        }
    }

    
}

