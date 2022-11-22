//
//  CoffeeListView.swift
//  Coffee-Shop
//
//  Created by Frans Sala Monda on 22/11/22.
//

import SwiftUI

struct CoffeeListView: View {
    // MARK: - PROPERTIES
    @State private var searchText: String = ""
    
    private var coffeSearchResults: [CoffeeshopModel]{
        //return CoffeeshopProvider.all()
        
        let results = CoffeeshopProvider.all()
        
        if searchText.isEmpty {
            return results
        } else {
            return results.filter {
                $0.name.lowercased().contains(searchText.lowercased()) || $0.location.contains(searchText)
            }
        }
    }
    
    private var suggestedResult: [CoffeeshopModel] {
        if searchText.isEmpty {
            return []
        } else {
            return coffeSearchResults
        }
    }
    
    
    
    var body: some View {
        //Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
        NavigationView {
            List(coffeSearchResults) { result in
                NavigationLink(destination: {
                    CoffeeDetailView(coffeeDetails: result)
                }){
                    Image("\(result.image)")
                        .frame(width: 1, height: 3)
                    Text("\(result.name)")
                        .font(.title2)
                       // .multilineTextAlignment(.leading)
                        .padding(6)
                }
                .navigationTitle("Coffe Shop")
                .searchable(
                    text: $searchText,
                    placement: .navigationBarDrawer(displayMode: .always),
                    prompt: "Search Coffeeshop"
                ) {
                    ForEach(suggestedResult) { result in
                        Text("Looking for \(result.location) - \(result.name)?")
                            .searchCompletion(result.name)
                    }
                }
                
                
                
                
//                NavigationLink(destination: {
//                    CoffeeDetailView(coffeeDetails: result)
//                }){
//                    Image("\(result.image)")
//                        .frame(width: 3, height: 3)
//                    Text("\(result.name)")
//                        .font(.title2)
//                        .multilineTextAlignment(.leading)
//                        .padding(6)
//                }
            }
        }
    }
}

struct CoffeeListView_Previews: PreviewProvider {
    static var previews: some View {
        CoffeeListView()
    }
}
