//
//  GenUtils.swift
//  poke-play
//
//  Created by Vitor Gonçalves on 20/07/2023.
//

import Foundation


struct CheckEmpty{
    func stringEmpty(str:String) -> Bool {
        if str.isEmpty || str.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty || str == ""  {
            return true
        } else {
            return false
        }
    }
}
