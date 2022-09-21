//
//  LoginPage.swift
//  IosTask
//
//  Created by Shivam Chawla on 20/09/22.
//

import SwiftUI

struct GetStarted: View {
    @State var showLoginPage : Bool = false
    var body: some View {
        VStack{
            
            Text("Shops")
                .font(.largeTitle.weight(.bold))
                .foregroundColor(.blue)
            Image("Shop")
                .resizable()
                .aspectRatio(contentMode: .fit)
            Button{
                withAnimation{
                    showLoginPage = true
                }
            
        }label : {
            Text("Get Sarted")
                .font(.title.weight(.semibold))
                .foregroundColor(.white)
                .padding(.vertical,18)
                .frame(maxWidth: .infinity)
                .background(Color.blue)
                .cornerRadius(10)
                .shadow(color: Color.black.opacity(0.1), radius: 5, x: 5, y: 5)
            
        }
        .padding(.horizontal,30)
        .offset(y:20)
         
        }
        .padding()
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(.white)
        .overlay(
            Group{
                if showLoginPage{
                    LoginPage()
                        .transition(.move(edge: .bottom))
                }
            }
        )
    }
}

struct Getstarted_Previews: PreviewProvider {
    static var previews: some View {
        GetStarted()
    }
}
