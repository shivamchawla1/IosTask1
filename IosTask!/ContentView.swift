import SwiftUI

struct ContentView: View {
   
    @EnvironmentObject var loginData : LoginPageModel
   
    var body: some View {
        Group{
            if loginData.log_status{
                MainPage()
            }else{
                GetStarted()
            }
        }
        .onAppear{
            loginData.log_status = loginData.isSingnedin
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
