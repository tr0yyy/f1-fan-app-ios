//
//  DataController.swift
//  f1-fan-app
//
//  Created by user217580 on 5/5/22.
//

import Foundation
import CoreData

class DataController: ObservableObject {
    let container = NSPersistentContainer(name: "f1-fan-app")
    
    init() {
        container.loadPersistentStores { description, error in
            if let error = error {
                print("Core data failed: \(error.localizedDescription)")
            }
        }
    }
}
