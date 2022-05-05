//
//  AddFavTeamView.swift
//  f1-fan-app
//
//  Created by user217580 on 5/5/22.
//

import SwiftUI

struct AddFavTeamView: View {
    
    @State var team = ""
    
    @Environment(\.managedObjectContext) var moc
    @EnvironmentObject var viewModel: AppViewModel
    @FetchRequest(sortDescriptors: []) var echipe: FetchedResults<Email_Echipa>
    
    var body: some View {

        NavigationView{
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
                    
                    let teamToBeInserted = Email_Echipa(context: moc)
                    teamToBeInserted.nume_echipa = team
                    teamToBeInserted.email = viewModel.loggedEmail
                    
                    do{
                    try moc.save()
                    } catch let error as NSError {
                        print("could nto save . \(error), \(error.userInfo)")
                    }
                    
                    viewModel.optiune = 3
                    
                    
                }, label: {
                    Text("Add the team")
                        .foregroundColor(Color.white)
                        .frame(width:200, height: 50)
                        .cornerRadius(8)
                        .background(Color.red)
                })
            }.padding()
        }
        
    }
}

struct AddFavTeamView_Previews: PreviewProvider {
    static var previews: some View {
        AddFavTeamView()
    }
}
