//
//  SquirrelsDataManagerTableViewAdapter.swift
//  Frozen
//
//  Created by Zoë Smith on 13/01/2016.
//  Copyright © 2016 Hot Beverage. All rights reserved.
//

import UIKit
import Table

class SquirrelsDataManagerTableViewAdapter : NSObject, UITableViewDataSource {
    
    private let tableView : UITableView
    private let dataManager : SimpleDataManager<Squirrel>
    private let furnisherTypes = [CellFurnisher<SquirrelBasicTableViewCell>.self]
    
    
    init(tableView: UITableView, items: [Squirrel]) {
                
        self.tableView = tableView
        self.dataManager = SimpleDataManager<Squirrel>(transform: {
            squirrel, indexPath in
                // there could be extra logic here to return a different type of furnisher for the index path
                return squirrel.basicFurnisher
            })
        self.dataManager.items = items
        super.init()
                
        registerCells()
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataManager.numberOfItemsInSection(section)
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {        
        
        guard let furnisher = dataManager.furnisherForIndexPath(indexPath) else {
            return UITableViewCell()
        }
        
        let cell = tableView.dequeueReusableCellWithIdentifier(furnisher.dynamicType.reuseIdentifier(), forIndexPath: indexPath)
        furnisher.updateCell(cell)
        return cell
    }
    
    func registerCells() {
        
//        tableView.registerClass(SquirrelBasicTableViewCell.self, forCellReuseIdentifier: "SquirrelTableViewCell")
        
        
        for furnisherType in furnisherTypes {
            
            let id = furnisherType.reuseIdentifier()
            let c = furnisherType.cellClass()
            
            
//            tableView.registerClass(furnisherType.cellClass(), forCellReuseIdentifier: furnisherType.reuseIdentifier())
        }
    }
    
    ///////////
    
//    let items = [
//        Squirrel(name: "American Red", habitat: "Boreal coniferous forests"),
//        Squirrel(name: "Southern Flying Squirrel", habitat: "Eastern deciduous or mixed forests"),
//        Squirrel(name: "Californian Ground Squirrel", habitat: "Natural rangeland, pastures, grain fields")]
//    
//
//    
//    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
//        return 1
//    }
//    
//    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
//        
//        
//        let cell = SquirrelBasicTableViewCell()
//        cell.textLabel?.text = items[indexPath.row].name
//        cell.detailTextLabel?.text = items[indexPath.row].habitat
//        
//        return cell
//    }
//    
//    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return items.count
//    }

}

extension Squirrel {
    var basicFurnisher : CellFurnisher<SquirrelBasicTableViewCell>  {
        get {
            let viewData = SquirrelBasicTableViewCell.SquirrelViewData(name: self.name, habitat: self.habitat)
            return  CellFurnisher<SquirrelBasicTableViewCell>(viewData: viewData)
        }
    }
}



