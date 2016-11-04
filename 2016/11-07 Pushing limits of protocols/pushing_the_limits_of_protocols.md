theme: Letters From Sweden, 0
autoscale: true
build-lists: true
slidenumbers: false

# [fit] Pushing the limits of
# [fit] protocol-oriented
# [fit] programming
<br>
# Jesse Squires

*jessesquires.com* • *@jesse_squires* • *@swiftlybrief*

---

# [fit] The __*Swift*__ way

Every language has its own *personality* and *paradigms*

- Protocols (and extensions)
- Value types
- First-class Functions

---

# [fit] Writing __*Swifty*__ code
# [fit] means writing __*protocol-oriented*__ code

![fit](../../img/swift-logo.png)

---

# [fit] What is
# [fit] __*protocol-oriented*__
# [fit] programming?

^The hip new term that the Swift team has been boasting
- But! Not really new :)
- Old concept

---

# [fit] SOLID
# [fit] Design Principles

^Who's heard of solid?
- Set of principles for designing "good" software modules

---

# [fit] SOL__*I*__D
# [fit] __*Interface Segregation*__

---

# [fit] "Protocol-oriented"
# [fit] __*Interface Segregation*__

---

# Brief Example

![](../../img/cook-shrug.jpg)

---

```swift
struct Programmer {

    func code(task: GitHubIssue)

    func eat(food: Food)

    func drink(beverage: Beverage)

    func sleep(bed: Bed) // lol

    func 💩(🚽: 🚽)
}

```

---

```swift
struct Restaurant {

    func feed(programmer: Programmer) {
        let 🌮 = Taco()
        programmer.eat(food: 🌮)

        let 🍵 = Tea()
        programmer.drink(beverage: 🍵)

        // can call any method on programmer!
    }
}
```

---

# __*It works,*__
# __*however...*__
# `Restaurant`
# [fit] __*can call any function on*__
# `Programmer`

---

```swift
struct Restaurant {

    func feed(programmer: Programmer) {
        let 🔥 = Issue()
        programmer.code(task: 🔥) // wat? y u no

        // supposed to call programmer.feed(food:)
    }
}
```

---

# protocols

```swift
protocol Feedable {

    func eat(food: Food)

    func drink(beverage: Beverage)
}
```

---

```swift
extension Programmer: Feedable { }

struct Restaurant {

    func feed(_ feedable: Feedable) {
        let 🌮 = Taco()
        feedable.eat(food: 🌮)

        let 🍵 = Tea()
        feedable.drink(beverage: 🍵)
    }
}

// Usage:
let 🤓 = Programmer()
restaurant.feed(🤓)
```

---

Protocols restrict access through interfaces

- small
- focused
- separated

![](img/heo.jpg)

---

# [fit] __*Protocols help us*__
# [fit] __*write code that is:*__
1. *safe*
2. *dynamic*
3. *modular*
4. *testable*

![fit](../../img/freddie.png)

^- Safe: similar to generics, Type T, Protocol P
- Dynamic: can be any type
- Modular: underlying types can change, consumers don't
- Testable: easy to mock/fake

---

# [fit] What if everything
# [fit] were a `protocol`?

*(well, almost)*

![](../../img/skeptical_baby.jpg)

---

# __*Exercise:*__ Let's build
# protocol-oriented
# data sources

- `UITableViewDataSource`
- `UICollectionViewDataSource`

*Table views and collection views are fundamental components of most apps.*

^I know there are many takes on this.
- This is not an attempt to persuade you.
- This is an exercise in POP to see what we can learn.

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
2. Produce and configure cells

---

# 1. Section

```swift
protocol SectionInfoProtocol {
    associatedtype Item

    var items: [Item] { get set }

    var headerTitle: String? { get }
    var footerTitle: String? { get }
}
```

---

# 2. DataSource

```swift
protocol DataSourceProtocol {
    associatedtype Item

    func numberOfSections() -> Int
    func numberOfItems(inSection section: Int) -> Int

    func items(inSection section: Int) -> [Item]?

    func item(atRow row: Int, inSection section: Int) -> Item?

    func headerTitle(inSection section: Int) -> String?
    func footerTitle(inSection section: Int) -> String?
}

```

---

# 3. Producing cells

Need a common interface for:

- *Table cells*
- *Collection cells*
- *Collection supplementary views*

---

TODO:

- Section
- DataSource
- ReusableViewFactory
- DataSourceProvider

---

TODO:

Key points:

- without protocols/extensions we could not do most of this. would have to have table-specific and collection-specific classes
- protocols == interface segregation
- protocol *extensions* bring us dynamic interface segregation

---

# [fit] Thanks!

Me:
*jessesquires.com*
*@jesse_squires*

Swift Weekly Brief:
*swiftweekly.github.io*
*@swiftlybrief*
