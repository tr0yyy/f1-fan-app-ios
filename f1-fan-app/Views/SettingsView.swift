//
//  SettingsView.swift
//  f1-fan-app
//
//  Created by user215930 on 5/5/22.
//

import SwiftUI

struct SettingsView: View {
    @EnvironmentObject var viewModel: AppViewModel
    var body: some View {
        NavigationView{
            Toggle("Notifications", isOn: $viewModel.notification)
                .padding()
        }.navigationTitle("Settings")
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
