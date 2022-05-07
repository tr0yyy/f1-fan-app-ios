//
//  MetadataHandler.swift
//  f1-fan-app
//
//  Created by user217570 on 5/7/22.
//

import Foundation

struct Driver: Codable, Hashable{
  var name: String
  var team: String
}

class MetadataHandler : ObservableObject{
    
    func getDriverStandings() -> [Driver] {
        var result:[Driver] = []
        guard let driverStandings = URL(string: "https://ergast.com/api/f1/current/last/driverStandings.json") else { return result}
        let sem = DispatchSemaphore.init(value: 0)
        let task = URLSession.shared.dataTask(with: driverStandings) { data, response, error in
            defer { sem.signal() }
            guard let data = data, error == nil else { return }
            do {
                     if let json = try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any] {
                         if let data = json["MRData"] as? [String:Any] {
                             if let standingsTable = data["StandingsTable"] as? [String:Any] {
                                 if let standingsList = standingsTable["StandingsLists"] as? [[String:Any]] {
                                    if let drivers = standingsList[0]["DriverStandings"] as? [[String: Any]] {
                                         for driver in drivers {
                                             var fullName = ""
                                             var team = ""
                                             if let driverData = driver["Driver"] as? [String: Any] {
                                                 let firstName = driverData["givenName"] as! String
                                                 let lastName = driverData["familyName"] as! String
                                                 fullName = firstName + " " + lastName
                                             }
                                             if let constructorData = driver["Constructors"] as? [[String: Any]] {
                                                 let firstName = constructorData[0]["name"] as! String
                                                 team = firstName
                                             }
                                             let driver = Driver(name: fullName, team: team)
                                             result.append(driver)
                                         }
                                     }
                                 }
                             }
                         }
                     }
                 } catch let error as NSError {
                     print("Failed to load: \(error.localizedDescription)")
                 }
             }
        task.resume()
        sem.wait()
            return result
    }
    
    func getConstructorStandings() -> [String]? {
        guard let constructorStandings = URL(string: "http://ergast.com/api/f1/current/last/constructorStandings.json") else { return nil }
        var result:[String] = []
        let task = URLSession.shared.dataTask(with: constructorStandings) { data, response, error in
            guard let data = data, error == nil else { return }
            do {
                     if let json = try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any] {
                         if let data = json["MRData"] as? [String:Any] {
                             if let standingsTable = data["StandingsTable"] as? [String:Any] {
                                 if let standingsList = standingsTable["StandingsList"] as? [String:Any] {
                                     if let constructors = standingsList["ConstructorStandings"] as? [[String: Any]] {
                                         for constructor in constructors {
                                             if let constructorData = constructor["Constructor"] as? [String: Any] {
                                                 let name = constructorData["name"] as! String
                                                 result.append(name)
                                             }
                                         }
                                     }
                                 }
                             }
                         }
                     }
                 } catch let error as NSError {
                     print("Failed to load: \(error.localizedDescription)")
                 }
             }
            task.resume()
            return result
    }}
    
    
