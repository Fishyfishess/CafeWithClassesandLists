//
//  ContentView.swift
//  CafeWithClassesandListsWei
//
//  Created by ALVIN WEI on 10/1/26.
//
import SwiftUI
@Observable
class AppData{
    static let shared = AppData()
    
    var userCart: [String:Int] = [:]
    var userCartCost: [String:Double] = [:]
    var totalItems = 0
    
    init(){
        
    }
}
struct ContentView: View {
    
    @State var menu = [Item(name: "Coffee", price: 2, calories: 0, image: "Coffee", ingredients: [Ingredients(ingredient: "water", allergen: false), Ingredients(ingredient: "coffee bean", allergen: false), Ingredients(ingredient: "milk", allergen: true), Ingredients(ingredient: "sugar", allergen: false)]), Item(name: "Sandwich", price: 8, calories: 500, image: "Sandwich", ingredients: [Ingredients(ingredient: "bread", allergen: true), Ingredients(ingredient: "ham", allergen: false), Ingredients(ingredient: "cheese", allergen: true), Ingredients(ingredient: "mayo", allergen: false), Ingredients(ingredient: "tomato", allergen: false), Ingredients(ingredient: "lettuce", allergen: false)]), Item(name: "Apple", price: 2, calories: 80, image: "Apple", ingredients: [Ingredients(ingredient: "apple", allergen: false)]), Item(name: "Muffin", price: 3, calories: 300, image: "Muffin", ingredients: [Ingredients(ingredient: "flour", allergen: false), Ingredients(ingredient: "sugar", allergen: false), Ingredients(ingredient: "baking powder", allergen: false), Ingredients(ingredient: "salt", allergen: false), Ingredients(ingredient: "butter", allergen: true), Ingredients(ingredient: "egg", allergen: false), Ingredients(ingredient: "milk", allergen: true), Ingredients(ingredient: "chocolate chips", allergen: true)]), Item(name: "Bagel", price: 3, calories: 250, image: "Bagel", ingredients: [Ingredients(ingredient: "sugar", allergen: false), Ingredients(ingredient: "flour", allergen: false), Ingredients(ingredient: "yeast", allergen: false), Ingredients(ingredient: "salt", allergen: false), Ingredients(ingredient: "seasoning", allergen: false)])]
    
    var body: some View {
        NavigationView{
            VStack {
                Text("Normal Cafe")
                    .font(.largeTitle)
                List{
                    ForEach(menu, id: \.name){ item in
                        ZStack{
                            HStack{
                                Text("\(item.name): $\(item.price.formatted())")
                                Spacer()
                                Image(item.image)
                                    .resizable()
                                    .scaledToFit()
                                    .frame(maxWidth: 75, maxHeight: 75)
                                Spacer()
                            }
                            NavigationLink("") {
                                ItemView(item: item)
                            }
                        }
                    }
                }
                .clipShape(RoundedRectangle(cornerRadius: 20))
                
            }
            .padding()
            .toolbar {
                ToolbarItem(placement: .bottomBar) {
                    NavigationLink {
                        CartView()
                    } label: {
                        Image(systemName: "cart.fill")
                            .resizable()
                            .frame(width: 40, height: 40)
                        Text("\(AppData.shared.totalItems)")
                    }
                    .frame(width: 80, height: 100)
                    .buttonStyle(.plain)
                }
            }
        }
    }
}
#Preview {
    ContentView()
}

