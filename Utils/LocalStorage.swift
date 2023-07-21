//
//  LocalStorage.swift
//  poke-play
//
//  Created by Vitor Gonçalves on 20/07/2023.
//

import Foundation

struct PokemonStorage {
    func writeData(pokemonList: [Pokemon]) {
        
        do {
            let fileURL = try FileManager.default
                .url(for: .applicationSupportDirectory, in: .userDomainMask, appropriateFor: nil, create: true)
                .appendingPathComponent("PokemonStorage.json")
            
            try JSONEncoder() //JSONSerialization.data(withJSONObject: dictionary)
                .encode(pokemonList)
                .write(to: fileURL)
        } catch {
            print(error)
        }
    }
}
