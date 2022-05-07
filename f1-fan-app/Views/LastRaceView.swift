//
//  LastRaceView.swift
//  f1-fan-app
//
//  Created by user217580 on 5/4/22.
//

import SwiftUI

struct MenuRow: View { /// as zice ca ar fi UiCollectionView
    var driver: Driver
    var body: some View {
        HStack{
            Text(driver.name)
            Text("-")
            Text(driver.team)
            Spacer()
        }
    }
}

//it's actually driver standings
struct LastRaceView: View {
    @EnvironmentObject var viewModel: AppViewModel
    
    var driverProvider = MetadataHandler()
    
    var body: some View {
        NavigationView{
            VStack{
                List(driverProvider.getDriverStandings(), id: \.self) { driver in
                    MenuRow(driver: driver)
                }
            }
            Button(action: {
                viewModel.optiune = 0
            }, label: {
                Text("Return")
                    .foregroundColor(Color.white)
                    .frame(width:200, height: 50)
                    .cornerRadius(8)
                    .background(Color.red)
            })
        }.navigationTitle("Driver Standings")
    }
}

struct LastRaceView_Previews: PreviewProvider {
    static var previews: some View {
        LastRaceView()
    }
}
