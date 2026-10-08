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
    
    init(){
        
    }
}
struct ContentView: View {
    
    @State var menu = [Item(name: "Coffee", price: 2, calories: 0, image: "Coffee"), Item(name: "Sandwich", price: 8, calories: 500, image: "Sandwich"), Item(name: "Apple", price: 2, calories: 80, image: "Apple"), Item(name: "Muffin", price: 3, calories: 300, image: "Muffin"), Item(name: "Bagel", price: 3, calories: 250, image: "Bagel")]
    
    var body: some View {
        NavigationView{
            VStack {
                List{
                    ForEach(menu, id: \.name){ item in
                        ZStack{
                            HStack{
                                Text("\(item.name): $\(item.price.formatted())")
                                
//                                Image(item.image)
//                                    .resizable()
//                                    .scaledToFit()
//                                    .frame(maxWidth: 150, maxHeight: 150)
                            }
                            NavigationLink("") {
                                ItemView(item: item)
                            }
                        }
                    }
                }
                .clipShape(RoundedRectangle(cornerRadius: 20))
                NavigationLink("cart hehe"){
                    CartView()
                }
                
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

