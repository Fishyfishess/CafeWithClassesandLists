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
    
    @State var menu = [Item(name: "Uranium", price: 4.74, calories: 20000000, image: "Uranium")]
    
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
