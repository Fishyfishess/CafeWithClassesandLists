//
//  Ingredients.swift
//  CafeWithClassesandListsWei
//
//  Created by ALVIN WEI on 10/8/26.
//

import Foundation
class Ingredients{
    var ingredient: String
    var allergen: Bool
    
    init(ingredient: String, allergen: Bool) {
        self.ingredient = ingredient
        self.allergen = allergen
    }
}
