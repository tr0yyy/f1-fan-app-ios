//
//  FavTeamsView.swift
//  f1-fan-app
//
//  Created by user215930 on 5/5/22.
//

import SwiftUI

struct FavTeamsView: View {
    
    @FetchRequest(sortDescriptors: []) var echipe_join: FetchedResults<Email_Echipa>
    @EnvironmentObject var viewModel: AppViewModel
    
    var body: some View {
        NavigationView{
            VStack {
                List(echipe_join) { echipeJoin in /// table view
                    if echipeJoin.email == viewModel.loggedEmail {
                        Text(echipeJoin.nume_echipa ?? "idk")
                    }
                }
                
                Button(action: {
                    viewModel.optiune = 5
                }, label: {
                            Text("Add a team")
                                .foregroundColor(Color.white)
                                .frame(width:200, height: 50)
                                .cornerRadius(8)
                                .background(Color.red)
                        })
                        Button(action: {
                            viewModel.optiune = 6
                        }, label: {
                            Text("Remove a team")
                                .foregroundColor(Color.white)
                                .frame(width:200, height: 50)
                                .cornerRadius(8)
                                .background(Color.red)
                        })
                        
                Button(action: {
                    viewModel.optiune = 0
                }, label: {
                    Text("Return")
                        .foregroundColor(Color.white)
                        .frame(width:200, height: 50)
                        .cornerRadius(8)
                        .background(Color.red)
                })
            }.padding()
                
            
        }.navigationTitle("Favourite Teams")
    }
}

struct FavTeamsView_Previews: PreviewProvider {
    static var previews: some View {
        FavTeamsView()
    }
}
