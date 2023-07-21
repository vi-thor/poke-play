//
//  Menu.swift
//  poke-play
//
//  Created by Vitor Gonçalves on 13/07/2023.
//

import Foundation


public class Utils {
    let player = Player( Name: "", pokedex: [])
    let pokemonRepo = PokemonRepository()
    //let pokemonStorage = PokemonStorage()
    
    func drawHomeMenu() {
        
        var input:String
        repeat {
            print("\n")
            print("|----------MENU----------|")
            print("| 1 - Start Game         |")
            print("| 2 - Pokemons           |")
            print("| 3 - Exit               |")
            //print("| 4 - test               |")
            print("| Choose an option: ", terminator: "")
            
            input = readLine()!
            while(input == "" || input.isEmpty) {
                print("It's not possible to proceed without selecting an option! Please try again.")
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
        /*case "4":
            pokemonStorage.writeData(pokemonList: pokemonRepo.pokemonList)
            break*/
        default:
            
            break
        }
        
    }
    
    func drawPlayMenu() {
        
        let playerRepository = PlayerRepository()
        
        if(self.player.Name == "") {
            print("\n| WELCOME TO POKEPLAY |\n")
            print("Enter your username: ")
            let username = readLine()!
            
            self.player.Name = username
        }
        
        
        if(player.pokedex.isEmpty) {
            playerRepository.choosePokemon(player: player)
        }
        
        var input: String = " "
        print("\n")
        print("|----------MENU----------|")
        print("| 1 - Start Fight        |")
        print("| 2 - Pokedex            |")
        print("| 3 - Back               |")
        print("| Choose an option: ", terminator: "")
        
        input = readLine()!
        while(input == "" || input.isEmpty) {
            print("While the option is empty, it is not possible to move forwards. Please pick an option!")
            input = readLine()!
        }
        
        switch(input) {
        case "1":
            //todo add fight here
            break
        case "2":
            playerRepository.showPokedex(player: player)
            drawPokemonCreation()
            break
        case "3":
            drawHomeMenu()
            break
        default:
            break
        }
    }
    
    func drawPokemonCreation() {
        let pokemonRepository = pokemonRepo
        var input: String = " "
        print("\n")
        print("|----------MENU----------|")
        print("| 1 - All Pokemons       |")
        print("| 2 - Detail Pokemon     |")
        print("| 3 - Create new Pokemon |")
        print("| 4 - Back               |")
        print("| Choose an option: ", terminator: "")
        
        input = readLine()!
        while(input == "" || input.isEmpty || input.starts(with: " ")) {
            print("While the option is empty, it is not possible to move forwards. Please pick an option")
            input = readLine()!
        }
        
        switch(input){
        case "1":
            Console.Clear()
            pokemonRepository.showAllPokemons()
            drawPokemonCreation()
            break
        case "2":
            Console.Clear()
            pokemonRepository.showPokemonDetails()
            drawPokemonCreation()
            break
        case "3":
            Console.Clear()
            pokemonRepository.newPokemon()
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

