# Furnish
Configurable table view controller framework, drawing on ideas from Arkadiusz Holko (fastred) and Andy Matuschak (andymatuschak)

# Furnish

A mash up of ideas, still in progress, from Andy Matushak's talk on [Refactoring the MegaViewController](https://realm.io/news/andy-matuschak-refactor-mega-controller/) and Arkadiusz Holko's [Typed, yet Flexible Table View Controller](http://holko.pl/2016/01/05/typed-table-view-controller/?utm_campaign=iOS%2BDev%2BWeekly&utm_medium=email&utm_source=iOS_Dev_Weekly_Issue_232).

##### Cell furnishers
Arkadiusz calls them configurators, but I like the imagery of them furnishing visual data to the cells :) 

##### How the tableview cells look vs managing their view data
I liked Andy's refactoring: a `DataManager` vs a `TableViewAdapter`. 

A `DataManager` is concerned with keeping track of stuff that needs to be in the table. It deals with any changes (new items, deleted items and moved items). Traditional `UITableViewDelegate` stuff really. It can interface between true model objects (such as `NSManagedObject` in Andy's example) and value type translations of those objects that are safe to sling around in the user interface. 

The `TableViewAdapter`, on the other hand, interfaces with the data manager to actually present cells on the screen. It's the `UITableViewDataSource`, and contains the logic to get from  view code from having to deal with anything model-ly. 

##### Data manager

Sometimes you want full-blown CoreData backing, `NSFetchedResultsConstroller`, editing and all that malarkey for a table. And sometimes it's a simple list of items. It would be nice to have the ability to swap the backing in and out, as well as being able to describe what different Data Managers can do. 

So I protocoled it. Now you can conform to the simplest `DataFurnisher` protocol: 

```
public protocol DataFurnisher {
    typealias ItemType
    var transform : (ItemType, NSIndexPath) -> CellFurnisherType? { get set }
    func numberOfItemsInSection(section: Int) -> Int
    func furnisherForIndexPath(indexPath: NSIndexPath) -> CellFurnisherType?
}
```

The interesting bit is the `transform (ItemType, NSIndexPath) -> CellFurnisherType?` function variable. It's set by an implementation of the `TableViewAdapter` which knows what kind of cell it wants to use for the item, perhaps by a particular indexpath. The data manager doesn't care about that at all, it just spits back a `CellFurnisherType` for the relevant model object. And in the example I've given the DataManager is generic over the type of data it manages, `<T>`, so it just declares `typealias ItemType = T`. 

A more complex data manager could use protocol composition to offer more functionality – for example a `DataEditor` to add, delete or move items. 

##### An idea for taking it further
I think this setup could work pretty neatly by making the data sources composable. The idea, from a fantastic [Apple sample app](https://developer.apple.com/sample-code/wwdc/2015/downloads/Advanced-Collection-View.zip),  is that there's a master data source feeding a table, which itself is being fed by child data sources. So you can have an individual data source, say, for each section. It's a great way to get a heterogeneous set of data from multiple sources into the same table. 

#####Only the cell knows what it needs to update its own views
A `UITableViewCell` subclass should be the only object that knows what it needs to configure its views. Here, the `SquirrelTableViewCell` defines a struct (although it could be anything), and uses it as the associated type to conform to the `Updatable` protocol.

```
class SquirrelTableViewCell: UITableViewCell {
    struct SquirrelViewData {
        let name: String
    }
}

extension SquirrelTableViewCell : Updatable {
    typealias ViewData = SquirrelTableViewCell.SquirrelViewData
    
    func updateWithViewData(viewData: ViewData) {
        // update views
        textLabel?.text = viewData.name
    }
}
```
The view data struct is the only thing that knows how to extract view data from the model object:

```
extension SquirrelBasicTableViewCell.SquirrelViewData {
    init(squirrel: Squirrel) {
        self.name = squirrel.name
    }
}
```



##### Registering cell classes to reuse identifiers
I liked Holko's idea of embedding cell class and reuse ids in the `CellFurnisher`, but I've made them static functions on the struct, so we don't need to have an instance to pull them out. 

```
public protocol CellFurnisherType {
    static func reuseIdentifier() -> String
    static func cellClass() -> AnyClass
    func updateCell(cell: UITableViewCell)
}
```

So the `TableViewAdapter` class - which should know about what kind of cells are available to it - can hold a list of cell furnishers types which are registered with the table on initialization. 

```
let furnishers = [CellFurnisher<Basic>, CellFurnisher<Image>...]

func registerCells() {
    for furnisherType in furnisherTypes {
        tableView.registerClass(furnisherType.cellClass(), 
        forCellReuseIdentifier: furnisherType.reuseIdentifier())
    }
}
```


[More on those composable data sources from Oleb Begemann](http://oleb.net/blog/2014/06/apples-take-on-app-architecture/)




