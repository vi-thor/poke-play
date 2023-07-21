//
//  Menu.swift
//  poke-play
//
//  Created by Vitor Gonçalves on 13/07/2023.
//

import Foundation


class Utils {
    let player = Player( Name: "", pokedex: [])
    
    let playerRepository = PlayerRepository()
    let pokemonRepository = PokemonRepository()
    
    func drawHomeMenu() {
        
        var input:String
        repeat {
            
            print("|----------MENU----------|")
            print("| 1 - Start Game         |")
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
        
        if(self.player.Name == "") {
            print("WELCOME TO POKEPLAY\n")
            print("Enter your username")
            let username = readLine()!
            
            self.player.Name = username
        }
      
        
        if(player.pokedex.isEmpty) {
            playerRepository.choosePokemon(player: player, pokemonRepository: pokemonRepository)
        }
        
        var input: String = " "
        print("|----------MENU----------|")
        print("| 1 - Start Fight        |")
        print("| 2 - Pokedex            |")
        print("| 3 - Back               |")
        print("| Selecione uma Opção:", terminator: "")
       
        input = readLine()!
        while(input == "") {
            print("While the option is empty, it is not possible to move forwards. Please pick an option")
            input = readLine()!
        }
        
        switch(input) {
        case "1":
            pokemonRepository.Battle(playerPokemon: player.pokedex.first!)
            player.pokedex[player.pokedex.indices.first!].Health = pokemonRepository.getPokemon(name: player.pokedex[player.pokedex.indices.first!].Name).Health
            drawPlayMenu()
            break
        case "2":
            playerRepository.showPokedex(player: player, pokemonRepository: pokemonRepository)
            drawPlayMenu()
            break
        case "3":
            drawHomeMenu()
            break
        default:
            break
        }
    }
    
    func drawPokemonCreation() {
        var input: String = " "
        print("|----------MENU----------|")
        print("| 1 - All Pokemons       |")
        print("| 2 - Detail Pokemon     |")
        print("| 3 - Create new Pokemon |")
        print("| 4 - Back               |")
        print("| Choose an option", terminator: "")
        
        input = readLine()!
        while(input == "") {
            print("While the option is empty, it is not possible to move forwards. Please pick an option")
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
        case "3":
            pokemonRepository.newPokemon()
            print("\n\n\n")
            drawPokemonCreation()
            break
        case "4":
            drawHomeMenu()
            Console.Clear()
            break
        default:
            print("No options was selected, please try again.")
            drawPokemonCreation()
            break
        }
    }

    
}
