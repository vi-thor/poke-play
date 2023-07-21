//
//  PokemonRepository.swift
//  poke-play
//
//  Created by Vitor Gonçalves on 13/07/2023.
//

import Foundation


class PokemonRepository {
    let StandardAttacks = [
        poke_play.Attack(Name: "Void", Damage: 0),
        poke_play.Attack(Name: "Scratch", Damage: 10),
        poke_play.Attack(Name: "Tackle", Damage: 20),
        poke_play.Attack(Name: "Slap", Damage: 30)
    ]
    
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
        if(!name.isEmpty && pokemonList.contains(where: { $0.Name.lowercased() == name.lowercased()})) {
            return pokemonList.first(where: { $0.Name.lowercased() == name.lowercased()})!
        } else {
            return Pokemon(Name: "undefined", Health: 0, Armour: 0, Damage: 0, Nature: "not defined",Attacks: StandardAttacks)
        }
    }
    
    func standardPokemons(){
        
        //grass element
        let bulbasaur = Pokemon( Name: "Bulbasaur", Health: 45, Armour: 49, Damage: 49, Nature: "GRASS", Attacks: StandardAttacks)
        self.pokemonList.append(bulbasaur)
        
        //fire element
        let charmander = Pokemon(Name: "Charmander", Health: 39, Armour: 43, Damage: 52, Nature: "FIRE",Attacks: StandardAttacks)
        self.pokemonList.append(charmander)
        
        //water element
        let squirtle = Pokemon( Name: "Squirtle", Health: 44, Armour: 65, Damage: 48, Nature: "WATER",Attacks: StandardAttacks)
        self.pokemonList.append(squirtle)
        
        //electric element
        let pikachu = Pokemon( Name: "Pikachu", Health: 35, Armour: 40, Damage: 55, Nature: "ELECTRIC",Attacks: StandardAttacks)
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
    
    func Attack (attacker: Pokemon, defender: Pokemon, selectedMove: Attack) {
        print("\(attacker.Name) used \(selectedMove.Name)")
        defender.Health -= selectedMove.Damage
    }
    
    func Battle(playerPokemon: Pokemon){
        var _playerPokemon: Pokemon = Pokemon(pokemon: playerPokemon)
        var cpuPokemon: Pokemon = Pokemon(pokemon: GetAllPokemons().randomElement()!)
        
        print("\n")
        
        print("\(_playerPokemon.Name) [\(_playerPokemon.Health) HP] vs \(cpuPokemon.Name) [\(cpuPokemon.Health) HP]\n")
        
        while (_playerPokemon.Health > 0 && cpuPokemon.Health > 0) {
            print("|----------MOVES----------|")
            _playerPokemon.Attacks.indices.forEach{i in
                print("\(i+1). \(_playerPokemon.Attacks[i].Name) - Dano: \(_playerPokemon.Attacks[i].Damage)")
            }
            print("|-------------------------|\n")
            var input = 0
            while input == 0 {
                print("Select the move you'd like to use:")
                input = Int(readLine()!)!
                if input >= 5 || input <= 0{
                    input = 0
                }
            }
            
            let attackIndex = input - 1
            
            Attack(attacker: _playerPokemon, defender: cpuPokemon, selectedMove: _playerPokemon.Attacks[attackIndex])
            
            if(cpuPokemon.Health > 0) {
                print("\n\(cpuPokemon.Name)'s health: \(cpuPokemon.Health)\n")
                
                Attack(attacker: cpuPokemon, defender: _playerPokemon, selectedMove: cpuPokemon.Attacks[Int.random(in: 0...3)])
                
                if (_playerPokemon.Health > 0) {
                    print("\n\(_playerPokemon.Name)'s health: \(_playerPokemon.Health)\n")
                }
            }
        }
        
        if (_playerPokemon.Health <= 0 && cpuPokemon.Health <= 0) {
            print("It's a tie!")
        } else if _playerPokemon.Health <= 0 {
            print("\(_playerPokemon.Name) has fainted, you lost!")
        } else {
            print("\(cpuPokemon.Name) has fainted, you won!")
        }
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
        
        let newPokemon = Pokemon(Name: name, Health: Int(health)!, Armour: Int(armour)!, Damage: Int(damage)!, Nature: nature.uppercased(), Attacks: StandardAttacks)
        self.pokemonList.append(newPokemon)
        print("\n|-------------------------|\n")
        printPokemon(pokemon: getPokemon(name: name))
    }
}
