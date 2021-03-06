//
//  ContentView.swift
//  f1-fan-app
//
//  Created by user217580 on 5/4/22.
//

import SwiftUI
import CoreData
import FirebaseAuth
import UserNotifications

class AppViewModel: ObservableObject {
    
    let auth = Auth.auth()

    @Published var optiune = 0
    @Published var notification: Bool = false
    @Published var signedIn = false
    
    var isSignedIn: Bool {
        return auth.currentUser != nil
    }
    
    var loggedEmail: String{
        guard signedIn == true else {
            return ""
        }
        return auth.currentUser?.email ?? ""
    }
    
    func signIn(email: String, password: String) {
        auth.signIn(withEmail: email, password: password) { [weak self] result, error in
            guard result != nil, error == nil else {
                print(error)
                return
            }
            
            DispatchQueue.main.async{
            self?.signedIn = true
            }
        }
    }
    
    func signUp(email: String, password: String) {
        auth.createUser(withEmail: email, password: password) { [weak self] result, error in
            guard result != nil, error == nil else {
                return
            }
            
            DispatchQueue.main.async{
            self?.signedIn = true
            }
        }
    }
    
    func signOut() {
        try? auth.signOut()
        
        self.signedIn = false
    }
}

struct ContentView: View {
    @State var email = ""
    @State var password = ""
    
    @EnvironmentObject var viewModel: AppViewModel
    
    var body: some View {
        
        NavigationView {
            if viewModel.signedIn {
                if viewModel.optiune == 0 {
                    MainMenuView()
                } else if viewModel.optiune == 3 {
                    FavTeamsView()
                } else if viewModel.optiune == 5{
                    AddFavTeamView()
                } else if viewModel.optiune == 6{
                    DelFavTeamView()
                } else if viewModel.optiune == 1{
                    LastRaceView()
                } else if viewModel.optiune == 4{
                    SettingsView()
                }
            }
            else {
                SignInView()
            }
        }
        .onAppear {
            viewModel.signedIn = viewModel.isSignedIn
        }
    }
}

struct SignInView: View {
    @State var email = ""
    @State var password = ""
    
    @EnvironmentObject var viewModel: AppViewModel
    
    var body: some View {
            VStack {
                Image("logo")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 150, height: 150)
                
                VStack{
                    TextField("Email Address", text: $email)
                        .disableAutocorrection(true)
                        .autocapitalization(.none)
                        .background(Color(.secondarySystemBackground))
                        .padding()
                    SecureField("Password", text: $password)
                        .disableAutocorrection(true)
                        .autocapitalization(.none)
                        .background(Color(.secondarySystemBackground))
                        .padding()
                    
                    Button(action: {
                        
                        guard !email.isEmpty, !password.isEmpty else {
                            return
                        }
                        
                        viewModel.signIn(email: email, password: password)
                        
                        let content = UNMutableNotificationContent()
                        content.title = "F1 Fan App"
                        content.subtitle = "Logged-in"
                        content.sound = UNNotificationSound.default

                        // show this notification five seconds from now
                        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 5, repeats: false)

                        // choose a random identifier
                        let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: trigger)

                        // add our notification request
                        UNUserNotificationCenter.current().add(request)
                        
                    }, label: {
                        Text("Sign in")
                            .foregroundColor(Color.white)
                            .frame(width:200, height: 50)
                            .cornerRadius(8)
                            .background(Color.red)
                    })
                    
                    NavigationLink("Create an account", destination: SignUpView())
                }
                .padding()
            }
            .navigationTitle("Sign In")
            
            Spacer()
    }
}

struct SignUpView: View {
    @State var email = ""
    @State var password = ""
    
    @EnvironmentObject var viewModel: AppViewModel
    
    var body: some View {
            VStack {
                Image("logo")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 150, height: 150)
                
                VStack{
                    TextField("Email Address", text: $email)
                        .disableAutocorrection(true)
                        .autocapitalization(.none)
                        .background(Color(.secondarySystemBackground))
                        .padding()
                    SecureField("Password", text: $password)
                        .disableAutocorrection(true)
                        .autocapitalization(.none)
                        .background(Color(.secondarySystemBackground))
                        .padding()
                    
                    Button(action: {
                        
                        guard !email.isEmpty, !password.isEmpty else {
                            return
                        }
                        
                        viewModel.signUp(email: email, password: password)
                        
                    }, label: {
                        Text("Create account")
                            .foregroundColor(Color.white)
                            .frame(width:200, height: 50)
                            .cornerRadius(8)
                            .background(Color.red)
                    })
                }
                .padding()
            }
            .navigationTitle("Create an account")
            
            Spacer()
    }
}
    
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}
