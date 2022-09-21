//
//  LoginPage.swift
//  IosTask
//
//  Created by Shivam Chawla on 20/09/22.
//

import SwiftUI

struct LoginPage: View {
    @StateObject var loginData :LoginPageModel = LoginPageModel()
    var body: some View {
        VStack{
            
            Text("Welcome\nBack!!")
                .font(.system(size: 55,weight: .bold))
                .foregroundColor(.white)
                .frame(maxWidth: .infinity, alignment: .leading)
                .frame( height: getRect().height/5)
                .padding()
            
            ScrollView(.vertical,showsIndicators: false){
                VStack(spacing:15){
                    Text("Login")
                        .font(.system(size: 22,weight: .bold,design: .monospaced))
                        .frame(maxWidth: .infinity, alignment: .leading)
                    
                    customTextField(icon: "envelope", title: "Email", hint: "..@gmail.com", value: $loginData.email, showPassword: $loginData.showPassword)
                       // .contain(false)
                        .padding(.top,30)
                    
                    customTextField(icon: "lock", title: "Password", hint: "123456", value: $loginData.passwaord, showPassword: $loginData.showPassword)
                        .padding(.top,10)
                    
                    if loginData.registerUser{
                        customTextField(icon: "lock", title: "Re-Enter-Password", hint: "123456", value: $loginData.re_enter_passwaord, showPassword: $loginData.showPassword)
                            .padding(.top,10)
                    }
                    Button{
                        loginData.ForgotPassword()
                    } label:{
                        Text("Fogot Password?")
                            .font(.system(size: 14))
                            .fontWeight(.semibold)
                            .foregroundColor(Color.black)
                    }
                    .padding(.top,8)
                    .frame(maxWidth: .infinity ,alignment: .leading)
                    
                    Button{
                        
                  
                        if loginData.registerUser{
                            guard !loginData.email.isEmpty , !loginData.passwaord.isEmpty else { return }
                            loginData.Register(email: loginData.email, password: loginData.passwaord)
                        }else{
                            guard !loginData.email.isEmpty , !loginData.passwaord.isEmpty else { return }

                            loginData.Login(email: loginData.email, password: loginData.passwaord)
                        }
                    } label:{
                        Text(loginData.registerUser ? "Register" : "Login")
                            .font(.system(size: 17))
                            .fontWeight(.bold)
                            .padding(.vertical,20)
                            .frame(maxWidth: .infinity)
                            .foregroundColor(Color.white)
                            .background(Color.blue)
                            .cornerRadius(15)
                            .shadow(color: Color.black.opacity(0.07), radius: 5, x: 5, y: 5)
                    }
                    .padding(.top,25)
                    .padding(.horizontal)
                    
                    Button{
                        withAnimation{
                            loginData.registerUser.toggle()
                        }
                    } label:{
                        Text(loginData.registerUser ? "Back to login" : "Create account")
                            .font(.system(size: 14))
                            .fontWeight(.semibold)
                            .foregroundColor(Color.black)
                    }
                    .padding(.top,8)
                    
                    Text("Or sign up with")
                    
                    HStack{
                        Spacer()
                        Button{
                            loginData.signUpWithGoogle()
                        }label: {
                            Image("Google")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 25, height: 25)
                        }
                        Spacer()
                        Button{
                            
                        }label: {
                            Image("Facebook")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 25, height: 25)
                        }
                        Spacer()
                        Button{
                            
                        }label: {
                            Image("AppleIcon")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 25, height: 25)
                        }
                        Spacer()
                        
                    }
                   
                }
                .padding(30)
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(
                Color.white
                    .clipShape(CustomCorners(corner: [.topLeft,.topRight], radius: 25))
                    .ignoresSafeArea()
            
            )
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(.blue)
        .onChange(of: loginData.registerUser){
            newValue in
            loginData.email = ""
            loginData.passwaord = ""
            loginData.re_enter_passwaord = ""
            loginData.showPassword = false
            loginData.showRenterPassord = false
        }
        

    }
    
    @ViewBuilder
    func customTextField(icon:String,title:String,hint:String,value:Binding<String>,showPassword:Binding<Bool>)->some View{
        VStack(alignment: .leading, spacing: 12){
            Label{
                Text(title)
                    .font(.system(size: 14,design: .monospaced))
            }icon: {
                Image(systemName: icon)
            }
            .foregroundColor(Color.black.opacity(0.8))
            
            if title.contains("Password") && !showPassword.wrappedValue{
                SecureField(hint,text: value)
                    .padding(.top,2)
                
            }else{
                TextField(hint , text: value)
                    .padding(.top,2)
            }
            Divider()
                .background(Color.black.opacity(0.5))
            
        }
        .overlay(
            Group{
                if title.contains("Password"){
                    Button(action: {
                        showPassword.wrappedValue.toggle()
                    }, label: {
                        Text(showPassword.wrappedValue ? "Hide" : "Show" )
                            .font(.system(size: 14,design: .monospaced))
                            .foregroundColor(Color.black)
                    })
                    .offset(y:8)
                }
            }
            ,alignment: .trailing
        )
    }
}

struct LoginPage_Previews: PreviewProvider {
    static var previews: some View {
        LoginPage()
    }
}

extension View{
    func getRect()->CGRect{
        return UIScreen.main.bounds
    }
}
