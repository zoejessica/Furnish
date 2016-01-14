//
//  RecipesDataManager.swift
//  Frozen
//
//  Created by Zoë Smith on 13/01/2016.
//  Copyright © 2016 Hot Beverage. All rights reserved.
//

import UIKit

/** 
Takes an array of Recipes and transforms them into CellFurnisher objects that know how to display themselves in a particular type of table view cell
 
 I think this should actually be in the table view adapter - here you should manage the data. There you should manage what kind of cell should be shown. 
*/
class DataManager<T> {
    
    private(set) var items : [T]
    
    init(items: [T]) {
        self.items = items
    }
    
    func numberOfItems() -> Int {
        return items.count ?? 0
    }
    
    func itemAtIndexPath(indexPath: NSIndexPath) -> T? {
        return items[indexPath.row]
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


The question here is whether to use the Recipe model as the [items] or whether to use another struct that knows how to configure a cell
*/
