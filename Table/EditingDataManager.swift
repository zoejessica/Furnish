//
//  EditingDataManager.swift
//  Furnish
//
//  Created by Zoë Smith on 15/01/2016.
//  Copyright © 2016 Hot Beverage. All rights reserved.
//

import Foundation

public class EditingDataManager<T> : DataFurnisher, DataEditor {
    
    public typealias ItemType = T
    public typealias Transform = (T, NSIndexPath) -> CellFurnisherType?
    public var transform : Transform?
    public var items : [T]? 
    public var dataEditorDelegate : DataEditorDelegate?

    
    public init() { }
    
    public func numberOfItemsInSection(section: Int) -> Int {
        return items?.count ?? 0
    }
    
    public func furnisherForIndexPath(indexPath: NSIndexPath) -> CellFurnisherType? {
        if let i = items?[indexPath.row], t = transform {
            return t(i, indexPath)
        } else {
            return nil
        }
    }

    public func appendItem(item: T) {
        items?.append(item)
        if let count = items?.count {
            let indexPath = NSIndexPath(forItem: count - 1, inSection: 0)
            dataEditorDelegate?.dataManager(self, didInsertRowAtIndexPath: indexPath)
        }
    }
    

}
