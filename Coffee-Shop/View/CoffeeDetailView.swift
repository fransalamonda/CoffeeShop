//
//  CoffeeDetailView.swift
//  Coffee-Shop
//
//  Created by Frans Sala Monda on 22/11/22.
//

import SwiftUI

struct CoffeeDetailView: View {
    //
    let coffeeDetails: CoffeeshopModel
    var body: some View {
        ZStack {
            LinearGradient(colors: [.purple, .indigo], startPoint: .leading, endPoint: .trailing)
                .ignoresSafeArea()
            VStack(alignment: .center){
                Image(coffeeDetails.image)
                    .padding(.all, -30.0)
                Text(coffeeDetails.name)
                    .font(.system(size: 20))
            }
            .padding(16)
        }
    }
}

struct CoffeeDetailView_Previews: PreviewProvider {
    static var previews: some View {
        CoffeeDetailView(coffeeDetails: CoffeeshopModel(
            image: "bojaeatery",
            name: "Boja Eatery",
            location: "Jl. Sumatera No. 21, Kota Bandung",
            review: "The food is delicious, cooked just right.  Friendly service.  Cozy atmosphere with floral decorations.  There is a ~robot~ that sends the dish.  Prices are reasonable for a restaurant of its class"))
    }
}
