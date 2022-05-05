//
//  MainMenuView.swift
//  f1-fan-app
//
//  Created by user217580 on 5/4/22.
//

import SwiftUI

struct MainMenuView: View {
    @EnvironmentObject var viewModel: AppViewModel
    var body: some View {
        NavigationView {
                VStack{
                    Text("Logged-in. Welcome to F1 Fan App")
                    Button(action: {
                    viewModel.signOut()
                    }, label: {
                        Text("Last race news")
                            .foregroundColor(Color.white)
                            .frame(width:200, height: 50)
                            .cornerRadius(8)
                            .background(Color.red)
                    })
                    Button(action: {
                    viewModel.signOut()
                    }, label: {
                        Text("Next race news")
                            .foregroundColor(Color.white)
                            .frame(width:200, height: 50)
                            .cornerRadius(8)
                            .background(Color.red)
                    })
                    Button(action: {
                        viewModel.optiune = 3
                    }, label: {
                        Text("My favourite teams")
                            .foregroundColor(Color.white)
                            .frame(width:200, height: 50)
                            .cornerRadius(8)
                            .background(Color.red)
                    })
                    Button(action: {
                    viewModel.signOut()
                    }, label: {
                        Text("My favourite drivers")
                            .foregroundColor(Color.white)
                            .frame(width:200, height: 50)
                            .cornerRadius(8)
                            .background(Color.red)
                    })
                
            }
        }
    }
}

struct MainMenuView_Previews: PreviewProvider {
    static var previews: some View {
        MainMenuView()
    }
}
