//
//  ViewData.swift
//  Frozen
//
//  Created by Zoë Smith on 13/01/2016.
//  Copyright © 2016 Hot Beverage. All rights reserved.
//

import UIKit
import Model

/** 
Links a model to its ViewData representation
*/
extension RecipeTableViewCell.RecipeViewData {
    init(recipe: Recipe) {
        self.name = recipe.name
    }
}