//
//  RecipeTableViewCell.swift
//  Frozen
//
//  Created by Zoë Smith on 13/01/2016.
//  Copyright © 2016 Hot Beverage. All rights reserved.
//

import UIKit

/** 
Cell that displays a Recipe
*/
class RecipeTableViewCell: UITableViewCell {
    /// An individual cell defines what information it needs to configure itself:
    struct RecipeViewData {
        let name: String
    }
}

/**
 Extends RecipeCell to be updatable with a specific form of ViewData - this is just a typealiased name and could be anything at all, although I am using a simple struct that is initialized with the Recipe.
 */
extension RecipeTableViewCell : Updatable {
    typealias ViewData = RecipeTableViewCell.RecipeViewData
    
    /// The cell knows how to update its views with the associated ViewData type that it defines
    func updateWithViewData(viewData: ViewData) {
        // update views
        textLabel?.text = viewData.name
    }
}

