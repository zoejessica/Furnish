//
//  DataManagerProtocols.swift
//  Furnish
//
//  Created by Zoë Smith on 15/01/2016.
//  Copyright © 2016 Hot Beverage. All rights reserved.
//

import Foundation

public protocol DataFurnisher {
    typealias ItemType
    var transform : ((ItemType, NSIndexPath) -> CellFurnisherType?)? { get set }
    func numberOfItemsInSection(section: Int) -> Int
    func furnisherForIndexPath(indexPath: NSIndexPath) -> CellFurnisherType?
}

public protocol DataEditor {
    var dataEditorDelegate : DataEditorDelegate? { get set }
}

public protocol DataEditorDelegate {
    var tableView : UITableView { get }
    func dataManagerWillChangeContent(dataManager: DataEditor)
    func dataManagerDidChangeContent(dataManager: DataEditor)
    func dataManager(dataManager: DataEditor, didInsertRowAtIndexPath indexPath: NSIndexPath)
    func dataManager(dataManager: DataEditor, didDeleteRowAtIndexPath indexPath: NSIndexPath)
}

extension DataEditorDelegate {
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

    
    
    
    
    
    
