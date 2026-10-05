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
    var body: some View {
        VStack{
            Text(item)
                .font(.custom("Georgia", size: 60, relativeTo: .headline))
            Image(image)
                .resizable()
                .scaledToFit()
            
        }
    }
}

#Preview {
    ItemView(item: "N/A", price: 0, calories: 0, image:"Default")
}
