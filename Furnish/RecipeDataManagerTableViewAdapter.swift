//
//  RecipesDataManagerTableViewAdapter.swift
//  Frozen
//
//  Created by Zoë Smith on 13/01/2016.
//  Copyright © 2016 Hot Beverage. All rights reserved.
//

import UIKit
import Model

class RecipesDataManagerTableViewAdapter : NSObject, UITableViewDataSource {
    
    private let tableView : UITableView
    private let dataManager : DataManager<Recipe>
    
    init(   tableView: UITableView,
            dataManager: DataManager<Recipe>) {
                
        self.tableView = tableView
        self.dataManager = dataManager
        
        super.init()
                
        registerCells()
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataManager.numberOfItems()
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {        
        guard let recipe = dataManager.itemAtIndexPath(indexPath) else {
            return UITableViewCell()
        }
        
        let recipeTVCFurnisher = recipe.recipeTVCFurnisher
        
        let cell = tableView.dequeueReusableCellWithIdentifier(recipeTVCFurnisher.reuseIdentifier, forIndexPath: indexPath)
        recipeTVCFurnisher.updateCell(cell)
        return cell
    }
    
    func registerCells() {
        let cellFurnishers = dataManager.items.map { $0.recipeTVCFurnisher }
        for cellFurnisher in cellFurnishers {
            tableView.registerClass(cellFurnisher.cellClass, forCellReuseIdentifier: cellFurnisher.reuseIdentifier)
        }
    }
   
}

extension Recipe {
    var recipeTVCFurnisher : CellFurnisher<RecipeTableViewCell>  {
        get {
            return  CellFurnisher<RecipeTableViewCell>(viewData: RecipeTableViewCell.RecipeViewData(recipe: self))
        }
    }
}

