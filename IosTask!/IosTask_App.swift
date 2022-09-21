//
//  IosTask_App.swift
//  IosTask!
//
//  Created by Shivam Chawla on 21/09/22.
//

import SwiftUI
import FirebaseCore
import GoogleSignIn
import GoogleSignInSwift
@main
struct IosTask_App: App {
    
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    let viewModel = LoginPageModel()
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(viewModel)
               
        }
    }
}
class AppDelegate: NSObject, UIApplicationDelegate {
  func application(_ application: UIApplication,
                   didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
    FirebaseApp.configure()

    return true
  }
}
@available(iOS 9.0, *)
func application(_ application: UIApplication, open url: URL,
                 options: [UIApplication.OpenURLOptionsKey: Any])
  -> Bool {
  return GIDSignIn.sharedInstance.handle(url)
}
