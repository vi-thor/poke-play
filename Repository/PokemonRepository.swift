//
//  PokemonRepository.swift
//  poke-play
//
//  Created by Vitor Gonçalves on 13/07/2023.
//

import Foundation


class PokemonRepository {

    var PokemonSelected = Player.Pokedex.Pokemon

    let StandartAttacks = [
        Attack(Name: "Void", Damage: 0),
        Attack(Name: "Scratch", Damage: 10),
        Attack(Name: "Tackle", Damage: 20),
        Attack(Name: "Slap", Damage: 30)
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
        if(!name.isEmpty) {
            
            let pokemon = pokemonList.first(where: { $0.Name == name })
            return pokemon!
        } else {
            return Pokemon(Name: "undefined", Health: 0, Armour: 0, Damage: 0, Nature: "not defined",Attacks: StandartAttacks)
        }
    }
    
    func standardPokemons(){
        
        //grass element
        let bulbasaur = Pokemon( Name: "Bulbasaur", Health: 45, Armour: 49, Damage: 49, Nature: "GRASS", Attacks: StandartAttacks)
        self.pokemonList.append(bulbasaur)
        
        //fire element
        let charmander = Pokemon(Name: "Charmander", Health: 39, Armour: 43, Damage: 52, Nature: "FIRE",Attacks: StandartAttacks)
        self.pokemonList.append(charmander)
        
        //water element
        let squirtle = Pokemon( Name: "Squirtle", Health: 44, Armour: 65, Damage: 48, Nature: "WATER",Attacks: StandartAttacks)
        self.pokemonList.append(squirtle)
        
        //electric element
        let pikachu = Pokemon( Name: "Pikachu", Health: 35, Armour: 40, Damage: 55, Nature: "ELECTRIC",Attacks: StandartAttacks)
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
    
    func RealizarAtaque(attacker:PokemonSelected, defender:Pokemon, attackIndex:Int){
        var attack = attacker.Attacks[attackIndex]
        print("\(attacker.Name) use \(attack.Name)")
        defender.Health -= attacker.Damage
        if (defender.Health <= 0){
            print("\(defender.Name) has been defeated")
        }else{
            print("\(defender.Name) now have \(defender.Health)")
        }
    }

    func SimularBatalha(){
        while \PokemonSelected.health > 0 && Pokemon.health > 0 {
            
            print("Ataques disponíveis para (PokemonSelected.name):")
            for (index, attack) in PokemonSelected.attacks.enumerated() {
                print("\(index + 1). (attack.name) (Dano: (attack.damage))")
            }

            
            print("Escolha o número do ataque para usar:")
            if let input = readLine(), let selectedAttack = Int(input) {
                let attackIndex = selectedAttack - 1

            
                if attackIndex >= 0 && attackIndex < PokemonSelected.attacks.count {
                    RealizarAtaque(attacker: PokemonSelected, defender: &pokemon, attackIndex: attackIndex)
                    if pokemon.health > 0 {
                        
                        let pokemonAttackIndex = Int.random(in: 0..<pokemon.attacks.count)
                        RealizarAtaque(attacker: pokemon, defender: &PokemonSelected, attackIndex: pokemonAttackIndex)
                    }
                } else {
                    print("Ataque inválido. Tente novamente.")
                }
            } else {
                print("Entrada inválida. Tente novamente.")
            }
        }
    }
    if PokemonA.health <= 0 && pokemonB.health <= 0 {
    print("A batalha terminou em empate!")
} else if PokemonA.health <= 0 {
    print("Charizard foi derrotado. Blastoise venceu!")
} else {
    print("Blastoise foi derrotado. Charizard venceu!")
}
}
