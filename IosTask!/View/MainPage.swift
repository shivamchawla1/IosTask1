//
//  MainPage.swift
//  IosTask
//
//  Created by Shivam Chawla on 20/09/22.
//

import SwiftUI

struct MainPage: View {

    @State var currentTab : Tab = .Home
    @StateObject var sharedData: SharedDataModel = SharedDataModel()
   

    
    init(){
        UITabBar.appearance().isHidden = true
    }
    var body: some View {
        
        VStack(spacing: 0){
            TabView(selection: $currentTab){
                
                Home()
                    .environmentObject(sharedData)
                    .tag(Tab.Home)
              
                
                Text("Saved")
                    .tag(Tab.Saved)
            
          
                Text("Notification")
                    .tag(Tab.Notification)
           
         
                Text("Profile")
                    .tag(Tab.Profile)
          
         
                Cart()
                    .environmentObject(sharedData)
                    .tag(Tab.Cart)
            
            }
            HStack(spacing:0){
                ForEach(Tab.allCases,id:\.self){ tab in
                    
                    Button{
                        currentTab = tab
                        
                    }label:{
                        VStack{
                        Image(tab.rawValue)
                            .resizable()
                            .renderingMode(.template)
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 30, height: 30)
                            .frame(maxWidth: .infinity)
                            .foregroundColor(currentTab == tab ? Color.blue : Color.black.opacity(0.3))
                            Text(tab.rawValue)
                                .foregroundColor(currentTab == tab ? Color.blue : Color.black.opacity(0.3))
                                .frame(maxWidth: .infinity).fixedSize()
                        }
                    }
                    
                }
            }
            .padding([.horizontal,.bottom])
            .padding(.bottom,10)
        }
        .background(Color.gray.opacity(0.07).ignoresSafeArea())
        .overlay(
            ZStack{
                if let product = sharedData.detailProducts,sharedData.showDetailProduct{
                    ProductDetailView(product: product)
                        .environmentObject(sharedData)
                }
            }
        )
    }
}

struct MainPage_Previews: PreviewProvider {
    static var previews: some View {
        MainPage()
    }
}

enum Tab : String,CaseIterable{
    case Home = "Home"
    case Saved = "Saved"
    case Notification = "Notification"
    case Profile = "Profile"
    case Cart = "Cart"
}
