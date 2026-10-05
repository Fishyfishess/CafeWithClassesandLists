//
//  ItemView.swift
//  CafeWithClassesandListsWei
//
//  Created by ALVIN WEI on 10/2/26.
//

import SwiftUI

struct ItemView: View {
    var item: String
    var price: Double
    var calories: Int
    var image: String
    var quantity = 0
    var body: some View {
        VStack{
            Text(item)
                .font(.custom("Georgia", size: 60, relativeTo: .headline))
            Image(image)
                .resizable()
                .scaledToFit()
            HStack{
                RoundedRectangle(cornerRadius: 20)
                    .overlay {
                        Text(String(quantity))
                    }
                    .frame(width: 100, height: 50)
                    .foregroundStyle(.blue)
                Button("Add to cart"){
                    
                }
                .buttonStyle(.borderedProminent)
            }
        }
    }
}

#Preview {
    ItemView(item: "N/A", price: 0, calories: 0, image:"Default")
}
