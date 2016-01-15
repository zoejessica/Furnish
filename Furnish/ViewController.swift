//
//  ViewController.swift
//  Furnish
//
//  Created by Zoë Smith on 14/01/2016.
//  Copyright © 2016 Hot Beverage. All rights reserved.
//

import UIKit
import Model // just here for the sample squirrels
import Table

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    private var dataManager : EditingDataManager<Squirrel>?
    private var tableDataSource : UITableViewDataSource?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
//      let dataManager = SimpleDataManager<Squirrel>()
        dataManager = EditingDataManager<Squirrel>()
        tableDataSource = SquirrelsDataManagerTableViewAdapter(tableView: tableView, items: sampleSquirrels, dataManager: dataManager!)
        tableView.dataSource = tableDataSource
    }

    @IBAction func addItem(sender: UIBarButtonItem) {
        dataManager?.appendItem(Squirrel(name: "Alien Squirrel", habitat: "Mars", description: "", imageName: "hamster.jpg"))
    }
   
    private let sampleSquirrels : [Squirrel] = [
            Squirrel(name: "American Red", habitat: "Boreal coniferous forests", description: "", imageName: "redsquirrel.jpg"),
            Squirrel(name: "Southern Flying Squirrel", habitat: "Eastern deciduous or mixed forests", description: "", imageName: "flyingsquirrel.jpg"),
            Squirrel(name: "Californian Ground Squirrel", habitat: "Natural rangeland, pastures, grain fields", description: "", imageName: "groundsquirrel.jpg")]

}





