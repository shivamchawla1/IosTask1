//
//  Cart.swift
//  IosTask
//
//  Created by Shivam Chawla on 20/09/22.
//

import SwiftUI

struct Cart: View {
    @EnvironmentObject var sharedData : SharedDataModel
 
    @State var showDeleteOption : Bool = false
    var body: some View {
        NavigationView{
            VStack{
                ScrollView(.vertical, showsIndicators: false){
                    VStack{
                        HStack{
                            Text("Cart")
                                .font(.largeTitle.bold())
                            Spacer()
                            Button{
                                showDeleteOption.toggle()
                            }label:{
                                Image("Delete")
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: 25, height: 25)
                            }
                            
                        }
                        if sharedData.cartPRoducts.isEmpty{
                            Group{
                                Image("CartEmpty")
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .padding()
                                    .padding(.top,35)
                                
                            }
                                
                        }else{
                            
                            VStack(spacing:15){
                                ForEach(sharedData.cartPRoducts){ product in
                                    HStack(spacing :0 ){
                                        if showDeleteOption{
                                            Button{
                                                DeleteParameter(product: product)
                                            }label: {
                                                Image(systemName: "minus.circle.fill")
                                                    .font(.title2)
                                                    .foregroundColor(.red)
                                            }
                                            padding(.trailing)
                                        }
                                        CardView(product : product)
                                    }
                                    
                                }
                            }
                            .padding(.top,25)
                            .padding(.horizontal)
                        }
                        
                    }
                    .padding()
                    
                    if(!sharedData.cartPRoducts.isEmpty){
                        Group{
                            HStack{
                                Text("Total")
                                    .font(.title2.bold())
                                Spacer()
                                
                                Text("Rs 140")
                                    .font(.title.bold())
                            }
                            Button{
                                
                            }label: {
                                Text("Checkout")
                                    .font(.title.bold())
                                    .foregroundColor(.white)
                                    .padding()
                                    .frame(maxWidth : .infinity)
                                    .background(Color.blue.cornerRadius(15))
                                
                            }
                            .padding()
                        }
                    }
                
            }
    
            }
            .navigationBarHidden(true)
            .frame(maxWidth : .infinity, maxHeight: .infinity)
            .background(Color.gray.opacity(0.07).ignoresSafeArea())
        }
    }
    @ViewBuilder
    func CardView(product : Product)->some View{
        
        HStack(spacing:15){
            Image(product.productImage)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 100, height: 100)
            VStack{
                Text(product.title)
                    .font(.system(size: 18,weight: .bold))
                Text(product.type.rawValue)
                    .font(.system(size: 18))
                
            }
            
        }
        .padding(.horizontal)
        .padding(.vertical,10)
        .frame(maxWidth:.infinity,alignment: .leading)
        .background(Color.white.cornerRadius(10))
        
    }
    func DeleteParameter(product : Product){
        if let index = sharedData.cartPRoducts.firstIndex(where: {
            currentProduct in
            return product.id == currentProduct.id
        }){
           let _ = withAnimation{
                sharedData.cartPRoducts.remove(at: index)
            }
        }
    }
}

struct Cart_Previews: PreviewProvider {
    static var previews: some View {
        Cart()
            .environmentObject(SharedDataModel())
    }
}
