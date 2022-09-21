//
//  Home.swift
//  IosTask
//
//  Created by Shivam Chawla on 20/09/22.
//

import SwiftUI

struct Home: View {
    
    @EnvironmentObject var sharedData : SharedDataModel
    @StateObject var homeData : HomeViewModel = HomeViewModel()
    var body: some View {
        ScrollView(.vertical, showsIndicators: false){
            VStack(spacing:15){
                HStack(spacing:15){
                    Image(systemName: "magnifyingglass")
                        .font(.title2)
                        .foregroundColor(.gray)
                    TextField("Search", text: .constant(""))
                        .disabled(true)
                }
                        .padding(.vertical,12)
                        .padding(.horizontal)
                        .background(
                            Capsule()
                                .strokeBorder(Color.gray,lineWidth: 0.8)
                        )
                        .frame(width: getRect().width/1.6)
                        .padding(.horizontal,25)
                  
                Text("Select Your Order")
                    .font(.largeTitle)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.top)
                    .padding(.horizontal,25)
                
                ScrollView(.horizontal, showsIndicators: false){
                  
                        
                    HStack(spacing:18){
                        ForEach(ProductType.allCases , id: \.self){ type in
                            ProductTypeView(type: type)
                            
                        }
                        
                    }
                    .padding(.horizontal,25)
                    
                }
                .padding(.top,28)
                
                ScrollView(.horizontal,showsIndicators: false){
                    HStack(spacing:10){
                        ForEach(homeData.filteredProducts){
                            product in
                            ProductCardView(product: product)
                        }
                        .padding(.horizontal,15)
                    }
                    .padding(.top,20)
                }
                
                
            }
            .padding(.vertical)
        }
        .frame(maxWidth: .infinity, maxHeight:.infinity)
        .background(.gray.opacity(0.07))
        .onChange(of: homeData.productType){
            newValue in
            homeData.filterProductByType()
        }
        
    }
    @ViewBuilder
    func ProductCardView(product : Product)->some View{
        VStack(spacing:10){
            Image(product.productImage)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: getRect().width/2.5, height: getRect().width/2.5)
            Text(product.title)
                .font(.system(size: 18,weight: .semibold))
                .padding(.top)
            Text(product.price)
                .font(.system(size: 16,weight: .bold))
                .foregroundColor(.blue)
                .padding(.top,5)
            
            
        }
        .padding(.horizontal,20)
        .padding(.bottom,22)
        .background(
            Color.white.cornerRadius(25)
        )
        .onTapGesture{
            withAnimation(.easeInOut){
                sharedData.detailProducts = product
                sharedData.showDetailProduct = true
            }
        }
    }
    
    @ViewBuilder
    func ProductTypeView(type:ProductType)->some View{
        Button{
            withAnimation{
                homeData.productType = type
            }
        }label:{
            Text(type.rawValue)
                .font(.system(size: 15,weight: .bold))
                .foregroundColor(homeData.productType == type ? Color.blue : Color.black.opacity(0.3))
                .padding(.bottom,10)
        }
        
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}


