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
    var body: some View {
        VStack{
            Text(item.name)
                .font(.custom("Georgia", size: 60, relativeTo: .headline))
            Image(item.image)
                .resizable()
                .scaledToFit()
            ZStack{
                RoundedRectangle(cornerRadius: 20)
                    .fill(.regularMaterial)
                VStack{
                    Text("Ingredients")
                        .font(.largeTitle)
                        .padding()
                    ScrollView {
                        ForEach(item.ingredients.ingredients, id: \.self){ ingredient in
                            Text(ingredient)
                                .padding()
                                .frame(width: 300)
                        }
                    }
                }
            }
            .padding()
            HStack{
                Text("Quantity: \(item.quantity)")
                    .padding()
                    .background(.blue)
                    .background(in: RoundedRectangle(cornerRadius: 10))
                    .foregroundStyle(.white)
                Stepper(String(item.quantity), value: $item.quantity)
                    .labelsHidden()
                    .padding()
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
                dismiss()
            }
            .buttonStyle(.borderedProminent)
        }
    }
}
#Preview {
    ItemView(item: Item(name: "N/A", price: 0, calories: 0, image: "", ingredients: Ingredients(ingredients: ["N/A"], item: "N/A")))
}


