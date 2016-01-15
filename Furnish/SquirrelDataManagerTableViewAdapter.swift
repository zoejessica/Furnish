//
//  SquirrelsDataManagerTableViewAdapter.swift
//  Frozen
//
//  Created by Zoë Smith on 13/01/2016.
//  Copyright © 2016 Hot Beverage. All rights reserved.
//

import UIKit
import Table
import Model

class SquirrelsDataManagerTableViewAdapter : NSObject, UITableViewDataSource, DataEditorDelegate {
    
    let dataManager : EditingDataManager<Squirrel>
    internal let tableView : UITableView
    private let furnisherTypes = [CellFurnisher<SquirrelDetailedTableViewCell>.self]
    
    init(tableView: UITableView, items: [Squirrel], dataManager: EditingDataManager<Squirrel>) {
                
        self.tableView = tableView
        self.dataManager = dataManager
        self.dataManager.transform = {
            squirrel, indexPath in
                // there could be extra logic here to return a different type of furnisher for the index path
                        
            if indexPath.row % 2 == 0 {
                return squirrel.detailedFurnisher
            }
                return squirrel.basicFurnisher
            }        
        self.dataManager.items = items
        super.init()
                
        registerCells()
        self.dataManager.dataEditorDelegate = self
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
        /*
        // Here cell classes/reuse ids are registered directly in the storyboard, but this works for cells with custom views or nibs
        for furnisherType in furnisherTypes {
            tableView.registerClass(furnisherType.cellClass(), forCellReuseIdentifier: furnisherType.reuseIdentifier())
        }
        */
    }
    
    func dataManagerWillChangeContent(dataManager: DataEditor) {
        tableView.beginUpdates()
    }
    
    func dataManagerDidChangeContent(dataManager: DataEditor) {
        tableView.endUpdates()
        //        didChangeHandler()
    }
    
    func dataManager(dataManager: DataEditor, didInsertRowAtIndexPath indexPath: NSIndexPath) {
        tableView.insertRowsAtIndexPaths([indexPath], withRowAnimation: .Automatic)
    }
    
    func dataManager(dataManager: DataEditor, didDeleteRowAtIndexPath indexPath: NSIndexPath) {
        tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Automatic)
    }
}



