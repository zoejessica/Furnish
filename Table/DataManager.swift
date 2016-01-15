//
//  SquirrelsDataManager.swift
//  Frozen
//
//  Created by Zoë Smith on 13/01/2016.
//  Copyright © 2016 Hot Beverage. All rights reserved.
//

import UIKit

public class SimpleDataManager<T> : DataFurnisher {
    public typealias ItemType = T
    public var transform : (T, NSIndexPath) -> CellFurnisherType?
    
    public var items : [T]?
    
    public init(transform: (T, NSIndexPath) -> CellFurnisherType?) {
        self.transform = transform
    }
  public   
    func numberOfItemsInSection(section: Int) -> Int {
        return items?.count ?? 0
    }
  public   
    func furnisherForIndexPath(indexPath: NSIndexPath) -> CellFurnisherType? {
        if let i = items?[indexPath.row] {
            return transform(i, indexPath)
        } else {
            return nil
        }
    }
}

public protocol DataFurnisher {
    typealias ItemType
    var transform : (ItemType, NSIndexPath) -> CellFurnisherType? { get set }
    func numberOfItemsInSection(section: Int) -> Int
    func furnisherForIndexPath(indexPath: NSIndexPath) -> CellFurnisherType?
}
















































/*

In Andy's implementation this is a fetched results controller.

- It handles creating Tasks from their NSManagedObject equivalents in Core Data

private func managedTaskForTask(task: Task) -> NSManagedObject {
// uses the id property in a predicate to retrieve the task
}

For example, you can create a Task from a ManagedTask:
extension Task {
    init(managedTask: NSManagedObject) {
        self.id = managedTask.valueForKey("id") as! String
        self.title = managedTask.valueForKey("title") as! String
        self.dueDate = managedTask.valueForKey("dueDate") as! NSDate
    }
}


The question here is whether to use the Squirrel model as the [items] or whether to use another struct that knows how to configure a cell
*/
