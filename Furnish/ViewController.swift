//
//  ViewController.swift
//  Furnish
//
//  Created by Zoë Smith on 14/01/2016.
//  Copyright © 2016 Hot Beverage. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    private var tableDataSource : UITableViewDataSource?
    
    let items = [
        Squirrel(name: "American Red", habitat: "Boreal coniferous forests"),
        Squirrel(name: "Southern Flying Squirrel", habitat: "Eastern deciduous or mixed forests"),
        Squirrel(name: "Californian Ground Squirrel", habitat: "Natural rangeland, pastures, grain fields")]
    

    
       override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
        
       tableDataSource = SquirrelsDataManagerTableViewAdapter(tableView: tableView, items: items)
        tableView.dataSource = tableDataSource
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}


