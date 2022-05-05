//
//  f1_fan_appApp.swift
//  f1-fan-app
//
//  Created by user217580 on 5/4/22.
//

import SwiftUI
import Firebase

@main
struct f1_fan_appApp: App {
    //et persistenceController = PersistenceController.shared
    @StateObject private var dataController = DataController()
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate

    
    var body: some Scene {
        WindowGroup {
            let viewModel = AppViewModel()
            ContentView()
                .environmentObject(viewModel)
                .environment(\.managedObjectContext, dataController.container.viewContext)
        }
    }
}

class AppDelegate: NSObject, UIApplicationDelegate {
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        FirebaseApp.configure()
        return true
    }
}
