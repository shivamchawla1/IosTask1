//
//  SharedDataModel.swift
//  IosTask
//
//  Created by Shivam Chawla on 20/09/22.
//

import SwiftUI

class SharedDataModel: ObservableObject {
    
    
    @Published var detailProducts : Product?
    @Published var showDetailProduct: Bool = false
    @Published var cartPRoducts: [Product] = []

    
    
}
    

