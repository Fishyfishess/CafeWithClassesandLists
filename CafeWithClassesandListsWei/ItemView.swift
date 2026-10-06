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
                    .overlay {
                        RoundedRectangle(cornerRadius: 20)
                            .foregroundStyle(.blue)
                    }
                RoundedRectangle(cornerRadius: 20)
                    .foregroundStyle(.blue)
                    .overlay {
                        <#code#>
                    }
                Stepper(String(item.quantity), value: $item.quantity)
                    .labelsHidden()
                Button("Add to cart"){
                    AppData().userCart[item.name] = item.quantity
                    item.quantity = 1
                }
                .buttonStyle(.borderedProminent)
            }
            .padding()
        }
    }
}

#Preview {
    ItemView(item: Item(name: "N/A", price: 0, calories: 0, image: ""))//item: "N/A", price: 0, calories: 0, image:"Default")
}
