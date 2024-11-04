//
//  CartView.swift
//  MNAD23-ICT
//
//  Created by Pubudu Mihiranga on 2023-11-12.
//

import SwiftUI

struct CartView: View {
    @AppStorage("previousDeal") var previousDeal: Double = 0.0
    @Binding var cart: [ShopItem]
    @State var total: Double = 0.0
    
    var body: some View {
        NavigationStack {
            VStack {
                if (total > 0) {
                    List {
                        Section(header: Text("Purchased Items")) {
                            ForEach(cart) { item in
                                if (item.quantity > 0) {
                                    HStack {
                                        Text(item.name)
                                        Spacer()
                                        
                                        Text("\(calculatePurchasedItems(item: item), specifier: "%.1f")")
                                    }
                                }
                            }
                        }
                        
                        Section(header: Text("Total Bill")) {
                            HStack {
                                Text("Net Amount")
                                Spacer()
                                Text("\(total, specifier: "%.1f")")
                            }
                        }
                    }
                    .listStyle(.plain)
                } else {
                    Spacer()
                    
                    VStack {
                        Text("Your Cart is Empty")
                            .font(.system(size: 24))
                            .foregroundColor(.gray)
                        
                        Image(systemName: "cart.badge.questionmark")
                            .resizable()
                            .scaledToFit()
                            .foregroundColor(.gray)
                            .frame(width: 60)
                    }
                    .padding(.top, 30)
                    
                    Spacer()
                }
                
                Text("Your Previous Deal with Us was: $\(previousDeal, specifier: "%.1f")")
                    .font(.headline)
                    .foregroundStyle(.white)
                    .padding(.horizontal, 15)
                    .padding(.vertical, 20)
                    .background(.green)
                    .clipShape(RoundedRectangle(cornerRadius: 15))
                    .padding()
            }
            .navigationTitle("Cart")
            .navigationBarTitleDisplayMode(.inline)
        }
        .onAppear {
            calculateTotal()
        }
        .onDisappear {
            UserDefaults.standard.set(total, forKey: "previousDeal")
        }
    }
    
    private func calculatePurchasedItems(item: ShopItem) -> Double {
        return Double(item.quantity) * item.price
    }
    
    private func calculateTotal() {
        let total = cart.reduce(0) { $0 + calculatePurchasedItems(item: $1) }
        self.total = total
    }
}

#Preview {
    CartView(cart: .constant(dummyCart))
}
