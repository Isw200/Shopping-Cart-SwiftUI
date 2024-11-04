//
//  MainViewModel.swift
//  MNAD23-ICT
//
//  Created by Isuru Ariyarathna on 2024-11-04.
//

import Foundation

class MainViewModel: ObservableObject {
    @Published  var shopItems = [
        ShopItem(name: "Broccoli", price: 8.00, quantity: 0),
        ShopItem(name: "Banana", price: 10.00, quantity: 0),
        ShopItem(name: "Avocado", price: 7.00, quantity: 0),
        ShopItem(name: "Chicken", price: 20.00, quantity: 0),
        ShopItem(name: "Water", price: 5.00, quantity: 0)
    ]
    @Published var showCartView = false
}
