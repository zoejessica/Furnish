//
//  TableViewCells.swift
//  Frozen
//
//  Created by Zoë Smith on 13/01/2016.
//  Copyright © 2016 Hot Beverage. All rights reserved.
//

import UIKit

/** 
Describes a class that updates itself using a ViewData associated type thing, for example a `UITableViewCell`
*/
public protocol Updatable: class {
    typealias ViewData
    func updateWithViewData(viewData: ViewData)
}

/**
An object used by a particular kind of UITableViewCell to configure itself with a ViewData object and a reuse identifier based on its class.
*/
public struct CellFurnisher<Cell where Cell : Updatable, Cell : UITableViewCell> {
    // TODO: research
    // what is the difference here between <Cell where Cell : Updatable, Cell : UITableViewCell> (compiles) 
    // and <Cell : Updatable, UITableViewCell>
    
    public let viewData: Cell.ViewData
    
    public static func reuseIdentifier() -> String {
        return NSStringFromClass(Cell)
    }
    
    
    public static func cellClass() -> AnyClass {
        return Cell.self
    }
    
    public func updateCell(cell: UITableViewCell) {
        if let cell = cell as? Cell {
            cell.updateWithViewData(viewData)
        }
    }
    
    public init(viewData: Cell.ViewData) {
        self.viewData = viewData
    }

}


/**
Protocol that hides the associated type of a CellFurnisher struct.
 
This means that we can have an `[items]` array of `CellFurnisher`s but with heterogeneous associated subclasses of `UITableViewCell`s - useful if a table view is to contain more than one type of cell. 
 
 */
public protocol CellFurnisherType {
    static func reuseIdentifier() -> String
    static func cellClass() -> AnyClass
    func updateCell(cell: UITableViewCell)
}

 extension CellFurnisher : CellFurnisherType { }



