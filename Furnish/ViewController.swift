//
//  ViewController.swift
//  Furnish
//
//  Created by Zoë Smith on 14/01/2016.
//  Copyright © 2016 Hot Beverage. All rights reserved.
//

import UIKit
import Model // just here for the sample squirrels

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    private var tableDataSource : UITableViewDataSource?
    
       override func viewDidLoad() {
        super.viewDidLoad()
        
       tableDataSource = SquirrelsDataManagerTableViewAdapter(tableView: tableView, items: sampleSquirrels)
        tableView.dataSource = tableDataSource
        tableView.rowHeight = UITableViewAutomaticDimension        
    }

    private let sampleSquirrels : [Squirrel] = [
            Squirrel(name: "American Red", habitat: "Boreal coniferous forests", description: "", imageName: "redsquirrel.jpg"),
            Squirrel(name: "Southern Flying Squirrel", habitat: "Eastern deciduous or mixed forests", description: "", imageName: "flyingsquirrel.jpg"),
            Squirrel(name: "Californian Ground Squirrel", habitat: "Natural rangeland, pastures, grain fields", description: "", imageName: "groundsquirrel.jpg")]

}





