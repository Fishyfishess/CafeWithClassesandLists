//
//  Item.swift
//  CafeWithClassesandListsWei
//
//  Created by ALVIN WEI on 10/1/26.
//
import Foundation
@Observable
class Item{
    var name: String
    var price: Double
    var calories: Int
    var image: String
    var quantity = 1
    
    init(name: String, price: Double, calories: Int, image: String) {
        self.name = name
        self.price = price
        self.calories = calories
        self.image = image
    }
}
