theme: Letters From Sweden, 5
autoscale: true
build-lists: true
slidenumbers: false

# [fit] Pushing the limits of
# [fit] protocol-oriented
# [fit] programming
<br>
# Jesse Squires

*jessesquires.com* • *@jesse_squires* • *@swiftlybrief*

^Today, talking about the power of protocols

---

# [fit] The __*Swift*__ way

Every language has its own *personality* and *paradigms*

- Protocols (and extensions)
- Value types
- First-class Functions

^Swift has it's own feel and personality
Swift expresses it's personality in a few ways

---

# [fit] Writing __*"Swifty"*__ code
# [fit] means writing __*protocol-oriented*__ code

![fit](../../img/swift-logo.png)

---

# [fit] What is
# [fit] __*protocol-oriented*__
# [fit] programming?

^The hip new term that the Swift team has been saying
- Not a new idea!
- Old concept!

---

# [fit] SOLID
# [fit] Design Principles

^Who's heard of solid?
- Acronym
- Set of principles for designing "good" software modules
- Guidelines to make code modular and easy to change

---

# [fit] SOL__*I*__D
# [fit] __*Interface Segregation*__

---

# [fit] "Protocol-oriented"
# [fit] Programming is the
# [fit] __*Interface Segregation Principle*__

^POP embodies this principle
Writing protocol-oriented code means implementing the interface segregation principle

---

# Wat?

What do we mean by
"interface segregation"?

![](../../img/cook-shrug.jpg)

---

# Protocols

The "I" in SOLID:
*No client should depend on (or know about) methods it does not use. You should split very large interfaces into smaller, more specific ones.*

- Separate interfaces provide a more focused API
- Restrict access, limit visibility
- Unify disjoint types (no common ancestor)
- Hide concrete type information

^- think breaking up tableViewDelegate
- only access what's in the protocol
- treat different types the same way
- encapsulate the actual type

---

# Why?

Why do we want to use protocols?

![](img/heo.jpg)

^Protocols introduce more complexity (seemingly)
- More abstract
- What the motivation?

---

# [fit] __*Protocols help us*__
# [fit] __*write code that is:*__
1. modular
2. dynamic
3. testable
4. safe

![fit](../../img/freddie.png)

^- Modular: underlying types can change, consumers don't
- Dynamic: any type, resolved at runtime, extensions with constraints
- Testable: easy to mock/fake
- Safe: similar to generics, Type T, Protocol P

---

# [fit] What if everything
# [fit] were a `protocol`?

*(well, almost)*

Let's find out!

![](../../img/skeptical_baby.jpg)

---

# __*Exercise:*__
# Let's build
# protocol-oriented
# data sources

— `UITableViewDataSource`
— `UICollectionViewDataSource`

*Table views and collection views are fundamental components of most apps.*

^- An exercise to see what we can learn!
- Lot's of code
- Very brief snippets
- Omitting details to focus on ideas
- Keep slides readable/understandable

---

# Goals

1. *protocol-based*
2. *type-safe* / generic
3. *use value types* (where possible)
4. *remove UIKit boilerplate*
5. __*unify*__ `UITableView` and `UICollectionView`
6. *avoid* `NSObject` and `NSObjectProtocol` ("pure" Swift)

---

# Responsibilities

*Display data in a list or grid.*

What do we need?

1. Structured data (sections with items/rows)
2. Create and configure cells
3. Conform to UITableViewDataSource
4. Conform to UICollectionViewDataSource

---

![50% left](img/tableview.jpg)
![50% right](img/collectionview.jpg)

---

# Section __*Protocol*__

```swift
protocol SectionInfoProtocol {
    associatedtype Item

    var items: [Item] { get set }

    var headerTitle: String? { get }

    var footerTitle: String? { get }
}
```

---

# Section __*Type*__

```swift
struct Section<Item>: SectionInfoProtocol {

    var items: [Item]

    let headerTitle: String?

    let footerTitle: String?
}
```

---

# DataSource __*Protocol*__

```swift
protocol DataSourceProtocol {
    associatedtype Item

    func numberOfSections() -> Int

    func numberOfItems(inSection section: Int) -> Int

    func item(atRow row: Int, inSection section: Int) -> Item?

    func headerTitle(inSection section: Int) -> String?

    func footerTitle(inSection section: Int) -> String?
}
```

^Note: this is basically what UICollectionView and UITableView data sources ask for

---

# DataSource __*Type*__

```swift
struct DataSource<S: SectionInfoProtocol>: DataSourceProtocol {

    var sections: [S]

    // MARK: DataSourceProtocol

    func numberOfSections() -> Int {
        return sections.count
    }

    // other protocol methods...
}
```

---

# Responsibilities

✅ Structured data
2. Create and configure cells
3. Conform to UITableViewDataSource
4. Conform to UICollectionViewDataSource

---

# Create + configure cells

1) We need a common interface (protocol) for:

— *Tables & collections*
— *Table cells*
— *Collection cells*
— *Collection supplementary views*

2) We need a __unified__ way to create and configure them

---

# Unify tables + collections

```swift
// UITableView
// UICollectionView

protocol CellParentViewProtocol {
    associatedtype CellType: UIView

    func dequeueReusableCellFor(identifier: String,
                                indexPath: IndexPath) -> CellType

    func dequeueReusableSupplementaryViewFor(kind: String,
                                             identifier: String,
                                             indexPath: IndexPath) -> CellType?
}
```

^Both need to dequeue cells

---

# Unify tables + collections

```swift
// Conform collection view to protocol (table view is similar)

extension UICollectionView: CellParentViewProtocol {
    typealias CellType = UICollectionReusableView

    func dequeueReusableCellFor(identifier: String,
                                indexPath: IndexPath) -> CellType {
        return dequeueReusableCell(withReuseIdentifier: identifier,
                                   for: indexPath)
    }

    func dequeueReusableSupplementaryViewFor(kind: String,
                                             identifier: String,
                                             indexPath: IndexPath) -> CellType? {
        return dequeueReusableSupplementaryView(ofKind: kind,
                                                withReuseIdentifier: identifier,
                                                for: indexPath)
    }
}
```

^Tables will return `nil` for suppl. views

---

# Unify cells

```swift
// UITableViewCell
// UICollectionViewCell

protocol ReusableViewProtocol {
    associatedtype ParentView: UIView, CellParentViewProtocol

    var reuseIdentifier: String? { get }

    func prepareForReuse()
}
```

---

# Unify cells

```swift
// Conform collection cells
extension UICollectionReusableView: ReusableViewProtocol {
    typealias ParentView = UICollectionView
}

// Conform table cells
extension UITableViewCell: ReusableViewProtocol {
    typealias ParentView = UITableView
}
```

---

# Unify supplementary views

```swift
enum ReusableViewType {
    case cell
    case supplementaryView(kind: String)
}
```

^We'll need to introduce this type to handle suppl. views

---

# [fit] __*Sharing a common interface*__

<br>

__CellParentViewProtocol__

- UITableView and UICollectionView

<br>

__ReusableViewProtocol__

- Table cells, collection cells, supplementary views

![](../../img/success-kid.png)

---

# Create + configure cells

✅ A common interface
2. A __unified__ way to create and configure

---

# [fit] Create + configure cells __*Protocol*__

```swift
// Configure a cell with a model

protocol ReusableViewFactoryProtocol {
    associatedtype Item
    associatedtype View: ReusableViewProtocol

    func reuseIdentiferFor(item: Item?,
                           type: ReusableViewType,
                           indexPath: IndexPath) -> String

    func configure(view: View,
                   item: Item?,
                   type: ReusableViewType,
                   parentView: View.ParentView,
                   indexPath: IndexPath) -> View
}
```

---

# Protocol extension for tables

```swift
extension ReusableViewFactoryProtocol where View: UITableViewCell {

    func tableCellFor(item: Item,
                      tableView: UITableView,
                      indexPath: IndexPath) -> View {

        let cellId = reuseIdentiferFor(item: item, type: .cell, indexPath: indexPath)

        // CellParentViewProtocol
        let cell = tableView.dequeueReusableCellFor(identifier: cellId,
                                                    indexPath: indexPath) as! View

        return configure(view: cell,
                         item: item,
                         type: .cell,
                         parentView: tableView,
                         indexPath: indexPath)
    }
}

```

^- Extension only available for table view/cells

---

# [fit] Protocol extension for collections

```swift
extension ReusableViewFactoryProtocol where View: UICollectionViewCell {

    func collectionCellFor(item: Item,
                           collectionView: UICollectionView,
                           indexPath: IndexPath) -> View {
        let cellId = reuseIdentiferFor(item: item, type: .cell, indexPath: indexPath)

        // CellParentViewProtocol
        let cell = collectionView.dequeueReusableCellFor(identifier: cellId,
                                                         indexPath: indexPath) as! View

        return configure(view: cell,
                         item: item,
                         type: .cell,
                         parentView: collectionView,
                         indexPath: indexPath)
    }
}
```

^- Extension only available for collection view/cells

---

# Create + configure cells __*Type*__

```swift
struct ViewFactory<Item, Cell: ReusableViewProtocol>: ReusableViewFactoryProtocol  {

    init(reuseIdentifier: String,
         type: ReusableViewType,
         viewConfigClosure: @escaping ViewConfigClosure)

    // Conform to ReusableViewFactoryProtocol

    func reuseIdentiferFor(item: Item?,
                           type: ReusableViewType,
                           indexPath: IndexPath) -> String

    func configure(view: View,
                   item: Item?,
                   type: ReusableViewType,
                   parentView: View.ParentView,
                   indexPath: IndexPath) -> View
}
```

^-Specific type in create cells
- 1st function just returns reuse id
- 2nd function returns result of the closure

---

# Responsibilities

✅ Structured data
✅ Create and configure cells
3. Conform to UITableViewDataSource
4. Conform to UICollectionViewDataSource

![](https://images.lowesforpros.com/img/i/articles/0BCsRs_61E-wMmyz9M6ORQ.png)

---

# Data source protocols

```swift
class BridgedDataSource: NSObject,
                         UICollectionViewDataSource,
                         UITableViewDataSource {

    // Init with closures for each data source method

    // Implement UICollectionViewDataSource

    // Implement UITableViewDataSource
}
```

---

# [fit] Data source protocols __*Brief Example*__

```swift
class BridgedDataSource: NSObject {

    let numberOfSections: () -> Int

    // other closure properties...
}

extension BridgedDataSource: UICollectionViewDataSource {

    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return self.numberOfSections()
    }

    // other data source methods...
}
```

---

# [fit] Responsibilities

✅ Structured data
✅ Create and configure cells
✅ UITableViewDataSource
✅ UICollectionViewDataSource

![fit right](../../img/freddie.png)

---

# [fit] Everything we need

```swift
protocol SectionInfoProtocol { } // sections of items

protocol DataSourceProtocol { } // full data source

protocol CellParentViewProtocol { } // tables + collections

protocol ReusableViewProtocol { } // cells

protocol ReusableViewFactoryProtocol { } // create cells

class BridgedDataSource { } // UIKit data sources
```

---

# Connecting the pieces

```swift
class DataSourceProvider<D: DataSourceProtocol,
                         C: ReusableViewFactoryProtocol,
                         S: ReusableViewFactoryProtocol>
      where C.Item == D.Item,
            S.Item == D.Item {

    var dataSource: D
    let cellFactory: C
    let supplementaryFactory: S

    private var bridgedDataSource: BridgedDataSource?

    init(dataSource: D, cellFactory: C, supplementaryFactory: S)
}
```

---

# Usage

```swift
let dataSource = DataSource(sections: /* sections of models */)

let config: ConfigClosure = { (cell, model, type, view, indexPath) -> MyCell in
    // configure cell with model
    return cell
}

let cellFactory = ViewFactory(reuseId: "cellId", viewConfig: config)

let provider = DataSourceProvider(dataSource: dataSource, cellFactory: cellFactory)

// Collections
collectionView.dataSource = provider.collectionViewDataSource

// Tables
tableView.dataSource = provider.tableViewDataSource
```

^- cell factory will use the extension methods that we wrote to create table/collection cells

---

# [fit] How does that work?

![right](../../img/jackie.jpg)

```swift
// Collections
provider.collectionViewDataSource

// Tables
provider.tableViewDataSource
```

---

# Generating specific data sources

```swift
// class DataSourceProvider<D,C,S>

extension DataSourceProvider where C.View: UITableViewCell {

    public var tableViewDataSource: UITableViewDataSource {
        if bridgedDataSource == nil {
            bridgedDataSource = createTableViewDataSource()
        }
        return bridgedDataSource!
    }

    private func createTableViewDataSource() -> BridgedDataSource {
        // create and return new BridgedDataSource
        // using: self.dataSource and self.cellFactory
    }
}
```

---

# Generating specific data sources

```swift
// extension DataSourceProvider where C.View: UITableViewCell

func createTableViewDataSource() -> BridgedDataSource {
    let source = BridgedDataSource()

    source.numberOfSections = { () -> Int in
        return self.dataSource.numberOfSections()
    }

    source.numberOfItemsInSection = { (section) -> Int in
        return self.dataSource.numberOfItems(inSection: section)
    }

    source.tableCellForRowAtIndexPath = { (tableView, indexPath) -> UITableViewCell in
        let item = self.dataSource.item(at: indexPath)

        // extension method on ReusableViewFactoryProtocol
        return self.cellFactory.tableCellFor(item: item,
                                             tableView: tableView,
                                             indexPath: indexPath)
    }

    // continued...
}
```

^- Collection view follows similarly

---

# Summary

![](../../img/mind-blown-cat.jpg)

---

# __*Protocols*__
# Restrict access / limit visibility

```swift
var tableViewDataSource: UITableViewDataSource
```

Returns __BridgedDataSource__ but clients don't know!

(It also conforms to UICollectionViewDataSource)

![](https://thewellhousecircle.files.wordpress.com/2013/03/tip-of-the-iceberg1.jpg)

---

# __*Protocol Extensions*__
# Dynamic interface segregation

```swift
// Creates + configures table cells
extension DataSourceProvider where C.View: UITableViewCell {
    var tableViewDataSource: UITableViewDataSource
}

// Creates + configures collection cells
extension DataSourceProvider where C.View: UICollectionViewCell {
    var collectionViewDataSource: UICollectionViewDataSource
}
```

You __cannot__ access *tableViewDataSource* if you are creating *UICollectionViewCells*!

^- Mutually exclusive
- Enforced by compiler

---

# __*Protocols*__
# Unify disjoint types
# Hide type information

```swift
protocol CellParentViewProtocol { }

protocol ReusableViewProtocol { }
```

We can treat tables, collections and their cells the same way — speaking to the same interface.

![](http://kids.nationalgeographic.com/content/dam/kids/photos/animals/Mammals/Q-Z/sloth-beach-upside-down.jpg.adapt.945.1.jpg)

---

#__*Protocols*__
# Modular

```swift
protocol SectionInfoProtocol { }

protocol DataSourceProtocol { }

protocol ReusableViewFactoryProtocol { }
```

*Anything can be a data source*
*Anything can create cells*

![right](http://platformer.cdn.appadvice.com/wp-content/appadvice-v2-media/2016/10/apple-dongle_449239a271f77e68047049fe5cf64735-m.jpg)

---

# __*Protocols*__
# Type safe

*Using constraints and associated types*

```swift
class DataSourceProvider<D: DataSourceProtocol,
                         C: ReusableViewFactoryProtocol,
                         S: ReusableViewFactoryProtocol>
      where C.Item == D.Item,
            S.Item == D.Item {
}
```

^Let the compiler do a lot of work for us

---

# __*Protocols*__
# Testable

It's very easy to "mock" or fake
a __protocol__ in a unit test.

![](https://www.howitworksdaily.com/wp-content/uploads/2015/05/6938210-space-shuttle-photos.jpg)

---

# [fit] Thanks!

*Me:*
jessesquires.com
@jesse_squires

*Swift Weekly Brief:*
swiftweekly.github.io
@swiftlybrief
