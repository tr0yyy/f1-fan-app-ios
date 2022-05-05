//
//  AddFavTeamView.swift
//  f1-fan-app
//
//  Created by user217580 on 5/5/22.
//

import SwiftUI

struct AddFavTeamView: View {
    
    @State var team = ""
    
    var body: some View {
        VStack {
            Image("logo")
                .resizable()
                .scaledToFit()
                .frame(width: 150, height: 150)
            
            VStack{
                TextField("Team", text: $team)
                    .disableAutocorrection(true)
                    .autocapitalization(.none)
                    .background(Color(.secondarySystemBackground))
                    .padding()
                
                Button(action: {
                    
                    guard !team.isEmpty else {
                        return
                    }
                    
                }, label: {
                    Text("Add the team")
                        .foregroundColor(Color.white)
                        .frame(width:200, height: 50)
                        .cornerRadius(8)
                        .background(Color.red)
                })
            }
            .padding()
        }
        .navigationTitle("Add a favourite team")
    }
}

struct AddFavTeamView_Previews: PreviewProvider {
    static var previews: some View {
        AddFavTeamView()
    }
}
