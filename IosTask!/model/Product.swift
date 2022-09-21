//
//  Product.swift
//  IosTask
//
//  Created by Shivam Chawla on 20/09/22.
//
import SwiftUI

struct Product : Identifiable,Hashable {
    var id =  UUID().uuidString
    var type : ProductType
    var title : String
    var price :String
    var productImage : String = ""
    var quantity: Int = 1
    
}
enum ProductType :String , CaseIterable{
    case MiniBasket = "Mini Basket"
    case DesignerHub = "Designer Hub"
}
