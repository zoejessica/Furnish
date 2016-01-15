//
//  ViewData.swift
//  Frozen
//
//  Created by Zoë Smith on 13/01/2016.
//  Copyright © 2016 Hot Beverage. All rights reserved.
//

import UIKit

/** 
Links a model to its ViewData representation
*/
extension SquirrelBasicTableViewCell.SquirrelViewData {
    init(squirrel: Squirrel) {
        self.name = squirrel.name
        self.habitat = squirrel.habitat
    }
}