//
//  SettingsView.swift
//  f1-fan-app
//
//  Created by user215930 on 5/5/22.
//

import UserNotifications
import SwiftUI

struct SettingsView: View {
    @EnvironmentObject var viewModel: AppViewModel
    var body: some View {
        VStack {
            Button("Request Permission for Notifications") {
                UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .badge, .sound]) { success, error in
                    if success {
                        print("All set!")
                    } else if let error = error {
                        print(error.localizedDescription)
                    }
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
        }
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
