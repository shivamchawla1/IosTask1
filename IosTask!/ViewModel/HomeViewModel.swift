//
//  HomeViewModel.swift
//  IosTask
//
//  Created by Shivam Chawla on 20/09/22.
//

import SwiftUI

class HomeViewModel: ObservableObject {
    @Published var productType: ProductType = .MiniBasket
    
    @Published var products : [Product] = [
        
        Product(type : .MiniBasket , title : "Kinnaur Apple", price: "Rs 159" , productImage : "Apple"),
        Product(type : .MiniBasket , title : "Pumpkin", price: "Rs 40" , productImage : "Pumpkin"),
        Product(type : .MiniBasket , title : "Small Tindey", price: "Rs 110" , productImage : "Smalltindey"),
        Product(type : .MiniBasket , title : "Kiwi", price: "Rs 45" , productImage : "Kiwi"),
        
        Product(type : .DesignerHub , title : "Kurtis", price: "Rs 400" , productImage : "Kurtis")
        
    ]
    
    
    @Published var filteredProducts : [Product] = []
    init(){
        filterProductByType()
    }
    func filterProductByType (){
        DispatchQueue.global(qos: .userInteractive).async {
            let result = self.products
                .lazy
                .filter{
                    product in
                    return product.type == self.productType
                }
            DispatchQueue.main.async {
                self.filteredProducts = result.compactMap({ product in
                    return product
                })
            }
        }
    }
    
}
