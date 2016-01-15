//
//  SquirrelFurnishers.swift
//  Furnish
//
//  Created by Zoë Smith on 15/01/2016.
//  Copyright © 2016 Hot Beverage. All rights reserved.
//

import Foundation
import Model
import Table

extension Squirrel {
    var basicFurnisher : CellFurnisher<SquirrelBasicTableViewCell>  {
        get {
            let viewData = SquirrelBasicTableViewCell.SquirrelViewData(name: self.name, habitat: self.habitat)
            return  CellFurnisher<SquirrelBasicTableViewCell>(viewData: viewData)
        }
    }
    
    var detailedFurnisher : CellFurnisher<SquirrelDetailedTableViewCell> {
        get {
            let viewData = SquirrelDetailedTableViewCell.DetailedSquirrelViewData(name: self.name, description: self.description, image: UIImage(imageLiteral: self.imageName))
            return CellFurnisher<SquirrelDetailedTableViewCell>(viewData: viewData)
        }
    }
}