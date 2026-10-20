//
//  ItemView.swift
//  CafeWithClassesandListsWei
//
//  Created by ALVIN WEI on 10/2/26.
//
import SwiftUI
struct ItemView: View {
    @Environment(\.dismiss) private var dismiss
    @State var item: Item
    @State var ingredients:[String] = []
    @State var counter = 0
    @State var remove:[Bool] = [false]
    @State var greenBlue = 1.0
    @State var rotationDegree = 0.0
    var body: some View {
        VStack{
            Text(item.name)
                .font(.custom("Georgia", size: 60, relativeTo: .headline))
            Image(item.image)
                .resizable()
                .scaledToFit()
                .onTapGesture {
                    withAnimation(.smooth.repeatForever(autoreverses: true)) {
                        rotationDegree = 20
                    }
//                    withAnimation(.default.delay(0.5)){
//                        rotationDegree -= 90
//                    }
                }
                .rotationEffect(.degrees(rotationDegree))
            ZStack{
                RoundedRectangle(cornerRadius: 20)
                    .fill(.regularMaterial)
                VStack{
                    Text("Ingredients")
                        .font(.largeTitle)
                        .padding()
                    ScrollView {
                        ForEach(ingredients, id: \.self){ ingredient in
                            HStack{
                                let y = ingredients.firstIndex(of: ingredient) ?? 0
                                Text(ingredient)
                                    .padding()
                                    .frame(width: 250)
                                Button(remove[y] ? "are you sure?" : "remove"){
                                    if let x = ingredients.firstIndex(of: ingredient){
                                        if remove[y] {
                                            ingredients.remove(at: x)
                                        }
                                    }
                                    remove[y].toggle()
                                    DispatchQueue.main.asyncAfter(deadline: .now() + 2){
                                        remove[y] = false
                                    }
                                }
                                .foregroundStyle(remove[y] ? .red : .blue)
                                .animation(.easeIn, value: remove[y])
                                    
                            }
                        }
                    }
                }
                .onAppear {
                    for ingredient in item.ingredients {
                        ingredients.append(ingredient.ingredient)
                    }
                }
            }
            .padding()
            HStack{
                Text("Quantity: \(item.quantity)")
                    .padding()
                    .background(.blue)
                    .background(in: RoundedRectangle(cornerRadius: 10))
                    .foregroundStyle(Color(red: 1, green: greenBlue, blue: greenBlue))
                    .animation(.default, value: greenBlue)
//                Stepper(String(item.quantity), value: $item.quantity)
//                    .labelsHidden()
//                    .padding()
                Stepper {
                } onIncrement: {
                    item.quantity += 1
                    if greenBlue <= 1 {
                        greenBlue = 1 - (0.01 * Double(item.quantity))
                    }
                } onDecrement: {
                    item.quantity -= 1
                    if greenBlue <= 1 {
                        greenBlue = 1 - (0.01 * Double(item.quantity))
                    }
                }
                .padding()
                .labelsHidden()

            }
            .padding()
            Button("Add to cart"){
                AppData.shared.userCart[item.name] = item.quantity
                AppData.shared.userCartCost[item.name] = Double(item.quantity) * item.price
                item.quantity = 1
                AppData.shared.totalItems = 0
                for(_,b) in AppData.shared.userCart{
                    AppData.shared.totalItems += b
                }
                UserDefaults.standard.set(AppData.shared.userCart, forKey: "userCart")
                UserDefaults.standard.set(AppData.shared.userCartCost, forKey: "userCartCost")
                UserDefaults.standard.set(AppData.shared.totalItems, forKey: "totalItems")
                dismiss()
            }
        }
        .onAppear {
            for _ in ingredients {
                remove.append(false)
            }
        }
    }
}
#Preview {
    ItemView(item: Item(name: "N/A", price: 0, calories: 0, image: "", ingredients: [Ingredients(ingredient: "N/A", allergen: false)]))
}


