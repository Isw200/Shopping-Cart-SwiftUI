//
//  ContentView.swift
//  MNAD23-ICT
//
//  Created by Pubudu Mihiranga on 2023-11-12.
//

import SwiftUI

struct MainView: View {
    @StateObject var viewModel: MainViewModel = MainViewModel()
    
    var body: some View {
        NavigationStack {
            VStack(spacing: 10) {
                List (viewModel.shopItems.indices, id: \.self) { index in
                    HStack {
                        Image(viewModel.shopItems[index].name.lowercased())
                            .resizable()
                            .scaledToFit()
                            .frame(width: 70, height: 70)
                       
                        VStack(alignment: .leading) {
                            Text(viewModel.shopItems[index].name)
                                .font(.system(size: 20))
                            
                            Text("$ \(viewModel.shopItems[index].price, specifier: "%.2f")")
                                .font(.system(size: 16, weight: .bold))
                                .padding(.top, 5)
                        }
                        Spacer()
                        
                        HStack {
                            Stepper("", value: $viewModel.shopItems[index].quantity, in: 0...10)
                            
                            Text("\(viewModel.shopItems[index].quantity)")
                                .font(.headline)
                        }
                            
                    }
                    .padding(.vertical, 5)
                }
                .listStyle(.plain)
                
                Button {
                    viewModel.showCartView = true
                } label: {
                    HStack {
                        Text("Checkout")
                            .font(.headline)
                        Spacer()
                        Image(systemName: "cart")
                    }
                }
                .frame(width: 110, height: 50)
                .foregroundStyle(.white)
                .padding(.horizontal, 20)
                .background(.green)
                .clipShape(RoundedRectangle(cornerRadius: 10))
            }
            .padding()
            .navigationDestination(isPresented: $viewModel.showCartView) {
                CartView(cart: $viewModel.shopItems)
            }
            .navigationTitle("Supper Market")
        }
    }
}

#Preview {
    MainView()
}
