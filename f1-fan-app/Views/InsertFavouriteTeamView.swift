//
//  InsertFavouriteTeamView.swift
//  f1-fan-app
//
//  Created by user217580 on 5/5/22.
//

import UIKit
import CoreData

class InsertFavouriteTeamView: UIViewController {

    func btnAdd(_ sender: Any) {
            //1
            guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
                return
            }
            let managedContext = appDelegate.persistentContainer.viewContext
            //2
            let entity = NSEntityDescription.entity(forEntityName: "Details", in : managedContext) !
            do {
                try managedContext.save()
                print("Record Added!")
                //To display an alert box
                let alertController = UIAlertController(title: "Message", message: "Record Added!", preferredStyle: .alert)
                let OKAction = UIAlertAction(title: "OK", style: .default) {
                    (action: UIAlertAction!) in
                }
                alertController.addAction(OKAction)
                self.present(alertController, animated: true, completion: nil)
            } catch
            let error as NSError {
                print("Could not save. \(error),\(error.userInfo)")
            }
        }
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
