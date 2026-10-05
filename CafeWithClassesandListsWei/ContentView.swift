//
//  ContentView.swift
//  CafeWithClassesandListsWei
//
//  Created by ALVIN WEI on 10/1/26.
//

import SwiftUI

class AppData{
    static let shared = AppData()
    
    var userCart: [Int] = []
    
    init(){
        
    }
}

struct ContentView: View {
    
    @State var menu = [Item(name: "Coffee", price: 2, calories: 0, image: "Coffee"), Item(name: "Sandwich", price: 8, calories: 500, image: "Sandwich"), Item(name: "Apple", price: 2, calories: 80, image: "Apple"), Item(name: "Muffin", price: 3, calories: 300, image: "Muffin"), Item(name: "Bagel", price: 3, calories: 250, image: "Bagel")]
    
    var body: some View {
        NavigationView{
            VStack {
                List{
                    ForEach(menu, id: \.name){ food in
                        ZStack{
                            HStack{
                                Text("\(food.name): $\(food.price.formatted(.number))")
                                Image(food.image)
                                    .resizable()
                                    .scaledToFit()
                                    .frame(maxWidth: 150, maxHeight: 150)
                            }
                            NavigationLink("") {
                                ItemView(item: food.name, price: food.price, calories: food.calories, image: food.image)
                            }
                        }
                        .padding()
                    }
                }
                .clipShape(RoundedRectangle(cornerRadius: 20))
            }
            .padding()
        }
    }
}

#Preview {
    ContentView()
}
