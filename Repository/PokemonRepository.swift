//
//  PokemonRepository.swift
//  poke-play
//
//  Created by Vitor Gonçalves on 13/07/2023.
//

import Foundation


class PokemonRepository {
    
    internal var pokemonList: [Pokemon] = []
    
    init(){
        standardPokemons();
    }
    
    func GetAllPokemons() -> [Pokemon]{
        return self.pokemonList;
    }
    
    func addPokemon(pokemon: Pokemon){
        pokemonList.append(pokemon)
    }
    
    func getPokemon(name: String) -> Pokemon{
        if(!name.isEmpty && pokemonList.contains(where: { $0.Name.lowercased() == name.lowercased()})) {
            
            return pokemonList.first(where: { $0.Name.lowercased() == name || $0.Name.uppercased() == name})!
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
        print("\n|-------------------------|\n")
        self.pokemonList.forEach{ pokemon in
            printPokemon(pokemon: pokemon)
        }
    }
    
    func showAllPokemonNames() {
        print("\n|---------------------------|\n")
        self.pokemonList.forEach{ pokemon in
            print("Name: \(pokemon.Name)")
        }
        print("\n|---------------------------|\n")
    }
    
    func printPokemon(pokemon: Pokemon){
        print("Name: \(pokemon.Name) - [ \(pokemon.Nature) ] \n" +
              "Health: \(pokemon.Health) \n" +
              "Damage: \(pokemon.Damage) \n" +
              "Armour \(pokemon.Armour)")
        print("\n|-------------------------|\n")
    }
    
    func showPokemonDetails() {
        showAllPokemonNames()
        
        print("Please select a Pokemon by the name to see more details: ")
        
        var input: String = readLine()!
        while(input.isEmpty) {
            print("Please select a Pokemon by the correct name: ")
            input = readLine()!
        }
        
        print("\nSelected Pokemon: ")
        print("\n|-------------------------|\n")
        printPokemon(pokemon: getPokemon(name: input))
    }
    
    func newPokemon(){
        let validation = Validation()
        
        print("\n|  ...CREATING POKEMON...  |")
        
        print("\nInsert name: ")
        var name: String = readLine()!
        while(!validation.isText(input: name) || validation.isNil(input: name)) {
            print("\nPlease insert a valid name: ")
            name = readLine()!
        }
        
        print("\nInsert damage: ")
        var damage: String = readLine()!
        while(!validation.isNumber(input: damage)) {
            print("\nPlease insert a valid damage value number: ")
            damage = readLine()!
        }
        
        print("\nInsert armour: ")
        var armour: String = readLine()!
        while(!validation.isNumber(input: armour)) {
            print("\nPlease insert a valid armour value number: ")
            armour = readLine()!
        }
        
        print("\nInsert health: ")
        var health: String = readLine()!
        while(!validation.isNumber(input: health)) {
            print("\nPlease insert a valid health value number: ")
            health = readLine()!
        }
        
        print("\nInsert nature: ")
        var nature: String = readLine()!
        while(!validation.isValidNature(input: nature)) {
            print("\nPlease insert a valid nature (grass, fire, water, electric): ")
            nature = readLine()!
        }
        
        let newPokemon = Pokemon(Name: name, Health: Int(health)!, Armour: Int(armour)!, Damage: Int(damage)!, Nature: nature.uppercased())
        //addPokemon(pokemon: newPokemon)
        
        self.pokemonList.append(newPokemon)
        print("\n|-------------------------|\n")
        printPokemon(pokemon: getPokemon(name: name))
    }
}
