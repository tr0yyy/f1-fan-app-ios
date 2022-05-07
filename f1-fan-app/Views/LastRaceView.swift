//
//  LastRaceView.swift
//  f1-fan-app
//
//  Created by user217580 on 5/4/22.
//

import SwiftUI

struct MenuRow: View {
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
    
    var driverProvider = MetadataHandler()
    
    var body: some View {
        NavigationView{
            VStack{
                List(driverProvider.getDriverStandings(), id: \.self) { driver in
                    MenuRow(driver: driver)
                }
            }
        }.navigationTitle("Driver Standings")
    }
}

struct LastRaceView_Previews: PreviewProvider {
    static var previews: some View {
        LastRaceView()
    }
}
