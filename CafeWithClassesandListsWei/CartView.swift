//
//  CartView.swift
//  CafeWithClassesandListsWei
//
//  Created by ALVIN WEI on 10/7/26.
//

import SwiftUI

struct CartView: View {
    
    @State var total = 0.0
    
    var body: some View {
        VStack{
            Text("Your cart")
            List{
                ForEach(Array(AppData.shared.userCart.keys), id: \.self){item in
                    HStack{
                        Text("\(item)")
                        Text("|")
                        
                        if let x = AppData.shared.userCart[item]{
                            HStack{
                                Text("Quantity: \(x)")
                                Text("|")
                                if let y = AppData.shared.userCartCost[item]{
                                    Text("Price: \(y.formatted(.currency(code: "USD")))")
                                } else {
                                    Text("N/A")
                                }
                            }
                        } else {
                            HStack{
                                Text("Quantity: N/A")
                                Text("|")
                                Text("Price: N/A")
                            }
                        }
                    }
                }
            }
            .onAppear {
                for(_, b) in AppData.shared.userCartCost{
                    total += b
                }
            }
            .clipShape(RoundedRectangle(cornerRadius: 20))
            Text("Cart total: \(total.formatted(.currency(code: "USD")))")
        }
        .padding()
    }
}

#Preview {
    CartView()
}
