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
    
    @State var menu = [Item(name: "Coffee", price: 2, calories: 0, image: "Coffee", ingredients: Ingredients(ingredients: ["water", "coffee bean", "milk", "sugar"], item: "Coffee")), Item(name: "Sandwich", price: 8, calories: 500, image: "Sandwich", ingredients: Ingredients(ingredients: ["Bread", "ham", "cheese", "mayo", "tomato", "lettuce"], item: "Sandwich")), Item(name: "Apple", price: 2, calories: 80, image: "Apple", ingredients: Ingredients(ingredients: ["apple"], item: "Apple")), Item(name: "Muffin", price: 3, calories: 300, image: "Muffin", ingredients: Ingredients(ingredients: ["flour", "sugar", "baking powder", "salt", "butter", "egg", "milk", "chocolate chips"], item: "Muffin")), Item(name: "Bagel", price: 3, calories: 250, image: "Bagel", ingredients: Ingredients(ingredients: ["sugar", "flour", "yeast", "salt", "seasoning"], item: "Bagel"))]
    
    var body: some View {
        NavigationView{
            VStack {
                Text("Cafe")
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
                            .frame(width: 50, height: 50)
                        Text("\(AppData.shared.totalItems)")
                    }
                    .frame(width: 100, height: 60)
                }
            }
        }
    }
}
#Preview {
    ContentView()
}

