//
//  ProductDetailView.swift
//  IosTask
//
//  Created by Shivam Chawla on 20/09/22.
//

import SwiftUI

struct ProductDetailView: View {
    var product : Product
    
    @EnvironmentObject var sharedData : SharedDataModel
    @EnvironmentObject var homeData : HomeViewModel
    
    var body: some View {
        
        VStack{
            VStack{
                HStack{
                    Button{
                        sharedData.showDetailProduct = false
                    }label:{
                        Image(systemName: "arrow.left")
                            .font(.title2)
                            .foregroundColor(Color.black.opacity(0.7))
                    }
                    Spacer()
                    
                }
                .padding()
                Image(product.productImage)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .padding(.horizontal)
                    .offset(y:-12)
                    .frame(maxHeight:.infinity)
            }
            .frame(height: getRect().height/2.7)
            ScrollView(.vertical, showsIndicators: false){
                VStack{
                    Text(product.title)
                        .font(.largeTitle.bold())
                    
                    HStack{
                        Text("Total")
                            .font(.title2)
                        Spacer()
                        Text("\(product.price)")
                            .font(.title2.bold())
                            .foregroundColor(.blue)
                    }
                    .padding([.vertical,.horizontal])
                
                Button{
                    addtoCart()
                    
                }label:{
                    Text("Add to basket")
                        .font(.title.bold())
                        .foregroundColor(.white)
                        .padding(.vertical,20)
                        .frame(maxWidth: .infinity)
                        .background(
                            Color.blue.cornerRadius(15)
                                .shadow(color: Color.black.opacity(0.06), radius: 5, x: 5, y: 5)
                        )
                }
                .padding()
                }
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(.white)
        }
        .background(
            Color.white.ignoresSafeArea()
        )
    }
    func addtoCart(){
        if let index = sharedData.cartPRoducts.firstIndex(where: { product in
            return self .product.id == product.id
        }){
            sharedData.cartPRoducts.remove(at: index)
        }else{
            sharedData.cartPRoducts.append(product)
        }
    }
}

struct ProductDetailView_Previews: PreviewProvider {
    static var previews: some View {
        MainPage()
    }
}
