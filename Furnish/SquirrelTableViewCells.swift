//
//  SquirrelTableViewCell.swift
//  Frozen
//
//  Created by Zoë Smith on 13/01/2016.
//  Copyright © 2016 Hot Beverage. All rights reserved.
//

import UIKit
import Table

/** 
Cell that displays a Squirrel
*/
class SquirrelBasicTableViewCell: UITableViewCell {
    /// An individual cell defines what information it needs to configure itself:
    struct SquirrelViewData {
        let name: String
        let habitat: String
    }
}

/**
 Extends SquirrelCell to be updatable with a specific form of ViewData - this is just a typealiased name and could be anything at all, although I am using a simple struct that is initialized with the Squirrel.
 */
extension SquirrelBasicTableViewCell : Updatable {
    typealias ViewData = SquirrelBasicTableViewCell.SquirrelViewData
    
    /// The cell knows how to update its views with the associated ViewData type that it defines
    func updateWithViewData(viewData: ViewData) {
        // update views
        textLabel?.text = viewData.name
        detailTextLabel?.text = viewData.habitat
    }
}

class SquirrelDetailedTableViewCell: UITableViewCell {
    struct DetailedSquirrelViewData {
        let name: String
        let description: String
        let image: UIImage
    }
}

extension SquirrelDetailedTableViewCell : Updatable {
    typealias ViewData = DetailedSquirrelViewData
    func updateWithViewData(viewData: ViewData) {
        textLabel?.text = viewData.name
        detailTextLabel?.text = viewData.description
        imageView?.image = viewData.image
        
    }
    
}

