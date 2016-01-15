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
    public typealias Transform = (T, NSIndexPath) -> CellFurnisherType?
    public var transform : Transform?
    public var items : [T]?
    public init() {}
    
  public   
    func numberOfItemsInSection(section: Int) -> Int {
        return items?.count ?? 0
    }
  public   
    func furnisherForIndexPath(indexPath: NSIndexPath) -> CellFurnisherType? {
        if let i = items?[indexPath.row], t = transform {
            return t(i, indexPath)
        } else {
            return nil
        }
    }
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
