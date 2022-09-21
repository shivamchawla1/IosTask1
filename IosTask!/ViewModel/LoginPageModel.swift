//
//  LoginPageModel.swift
//  IosTask
//
//  Created by Shivam Chawla on 20/09/22.
//

import SwiftUI
import FirebaseCore
import GoogleSignIn
import FirebaseAuth

class LoginPageModel: ObservableObject {
    @Published var email: String = ""
    @Published var passwaord: String = ""
    @Published var showPassword: Bool = false
    
    @Published var registerUser : Bool = false
    @Published var re_enter_passwaord:String = ""
    @Published var showRenterPassord: Bool = false
    
    @Published var log_status: Bool = false
    
    var isSingnedin : Bool {
        return Auth.auth().currentUser != nil
    }
    func Login(email : String , password : String){
        Auth.auth().signIn(withEmail: email, password: password){ result , err in
            guard result != nil , err == nil else { return }
            
            self.log_status = true
        }
    }
    
    func Register(email : String , password : String){
        Auth.auth().createUser(withEmail: email, password: password){result , err in
            guard result != nil , err == nil else { return }
           
            self.log_status = true
        }
        
    }
    
    func ForgotPassword(){
        
    }
    func signUpWithGoogle(){
        guard let clientId = FirebaseApp.app()?.options.clientID else { return  }
        
        let config = GIDConfiguration(clientID: clientId)
        
        
          
        
        GIDSignIn.sharedInstance.signIn(with: config, presenting: ApplicationUtility.rootViewController) {
            [self] user,err in
            if let error = err {
                print(error.localizedDescription)
                return
            }
            guard let authentication = user?.authentication,
                  let idToken = authentication.idToken
            else { return }

            let credential = GoogleAuthProvider.credential(withIDToken:idToken , accessToken : authentication.accessToken)

            Auth.auth().signIn(with : credential){ result , error in

                if let error = err {
                    print(error.localizedDescription)
                    return
                }
                guard let user = result?.user else { return }
                print(user.displayName)
            }


        }
    }

}
