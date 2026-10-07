//
//  ItemView.swift
//  CafeWithClassesandListsWei
//
//  Created by ALVIN WEI on 10/2/26.
//
import SwiftUI
struct ItemView: View {
    @State var item: Item
    var body: some View {
        VStack{
            Text(item.name)
                .font(.custom("Georgia", size: 60, relativeTo: .headline))
            Image(item.image)
                .resizable()
                .scaledToFit()
            HStack{
                Text("Quantity: \(item.quantity)")
                    .padding()
                    .background(.blue)
                    .background(in: RoundedRectangle(cornerRadius: 10))
//                RoundedRectangle(cornerRadius: 20)
//                    .foregroundStyle(.blue)
//                    .overlay {
//                        Text("Quantity: \(item.quantity)")
//                    }
                Stepper(String(item.quantity), value: $item.quantity)
                    .labelsHidden()
                    .padding()
            }
            .padding()
            Button("Add to cart"){
                AppData.shared.userCart[item.name] = item.quantity
                AppData.shared.userCartCost[item.name] = Double(item.quantity) * item.price
                print(AppData.shared.userCart[item.name])
                print(AppData.shared.userCartCost[item.name])
                item.quantity = 1
            }
            .buttonStyle(.borderedProminent)
        }
    }
}
#Preview {
    ItemView(item: Item(name: "N/A", price: 0, calories: 0, image: ""))//item: "N/A", price: 0, calories: 0, image:"Default")
}


