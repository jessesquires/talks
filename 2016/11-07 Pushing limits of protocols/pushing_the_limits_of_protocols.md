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

- `Protocols`
- `Value types`

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
# [fit] Engineering Principles

^Who's heard of solid?
- Set of principles for designing "good" software modules

---

# [fit] SOL__*I*__D
# [fit] __*Interface Segregation*__

---

# [fit] "Protocol-oriented"
# [fit] __*Interface Segregation*__

---

Brief Example

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
6. *avoid* `NSObject` and `NSObjectProtocol`

---

# Responsibility

*Display data in a list or grid.*

What do we need?

1. Structured data (sections with items/rows)
2. Produce and configure cells

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
