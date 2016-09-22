theme: Letters from Sweden, 3
autoscale: true
build-lists: true

# [fit] __*140*__ *proposals*

# [fit] *in* _**30**_ *minutes*
<br>
## __*Jesse Squires*__

jessesquires.com *•* @jesse_squires *•* @swiftlybrief

^Intro: SF, iOS team at IG, Swift Weekly, JSQMessages
This talk evolved a lot while writing.
Not discussing each prop, but stats/analysis + some most important.

---

# [fit] swift __*evolution*__

> The Swift evolution process aims to leverage the collective ideas, insights, and experience of the Swift community to improve the Swift development experience.

1. *Engage community*
2. *Maintain vision and conceptual coherence*
3. *Core team responsible for strategic direction*

^If you aren't familiar:
SE process represents/embodies openness of Swift.
Core team != App developers.
They need our feedback to make swift better.

---

In other words...

# [fit] Turn our[^*] __*ideas*__
# [fit] Into Improvements

![fit](../../img/swift-logo.png)

[^*]: *Anyone can participate!*

^We want to make Swift better!

---

# [fit] Make __*Swift*__ Great Again

![](img/drumpf.jpg)

---

# [fit] Swift
# [fit] __*1.0*__ to __*3.0*__

~2 years of Swift

^2 years!
Tons of changes.
3.0 release last week!

---

# [fit] How did we get here?

*Swift 3.0* has arrived! 😎

But *how* did that happen? 🤔

Let's *analyze* swift-evolution proposals! 🤓

^Originally, I wanted to discuss all proposals (kind of a lightning talk)
- But, as I started writing, I had a lot of questions that I couldn't answer.
- All proposals public on github, but just markdown.
- Can't query data. Ex: "give me all proposals written by chris lattner"
- So, I wrote some code to analyze!

---

```swift
// swift-proposal-analyzer.playground

final class Proposal {

    let title: String
    let seNumber: String    // SE-0001, SE-0002, etc.

    let authors: [Author]
    let status: Status      // .inReview, .accepted, etc.

    let fileName: String
    let fileContents: String
    let wordCount: Int
}
```

^How it works:
1. fetches all the proposals
2. dumps them in a playground (generates pages)
3. processes / parses them -> structured data
4. end up with an array of `Proposal`s
I'll be posting a github repo with all the code
All metadata + raw file contents

---

# [fit] Proposal
# [fit] metadata

# [fit] _**What can we learn?**_

---

# [fit] `"It's just metadata"`

# [fit] __*LOL*__

![right](img/snowden.jpg)

^Today, just doing some basics with metadata
But still, learn some interesting things!
In the future, we could do much more sophisticated analysis

---

# Proposals

# [fit] __*140*__

^Caveats: pretty small dataset

---

# [fit] __*98*__ implemented
# [fit] __*10*__ accepted[^1]
# [fit] __*10*__ deferred
# [fit] __*19*__ rejected
# [fit] __*3*__ withdrawn

[^1]: But not yet implemented

---

# Acceptance:
# [fit] __*77%*__
# Implementation:
# [fit] __*70%*__

^Pretty interesting!
over 3/4 accepted!

---

# Word Counts
# [fit] __*1191*__ `avg`
# [fit] __*7300*__ `max`
# [fit] __*769*__ `median`
# [fit] __*167*__ `min`

^This calculation is a bit naive, not extremely precise
But, gives us a general idea for length/complexity

---

# [fit] Word / Topic frequency

## [fit] __*873*__ `API`
## [fit] __*384*__ `objective-c`
## [fit] __*135*__ `bridging`
## [fit] __*6*__ `swifty`

*Searching the entire proposal corpus*

^search entire corpus
lots of talk about APIs (stblib + objc inter-op)
objc mentioned almost 3 times per proposal
will objc be mentioned this much in future? 4.0, 5.0?
surprisingly, not much "swifty" talk

---

# Authors

# [fit] __*78*__

^*unique* authors

---

# [fit] __*100*__ one author
# [fit] __*30*__ two authors
# [fit] __*9*__ three authors
# [fit] __*1*__ nine authors
# [fit] __*1.79*__ `avg per proposal`

---

# [fit] `Top Authors / Co-authors`
# [fit] __*25*__ Erica Sadun
# [fit] __*13*__ Doug Gregor
# [fit] __*12*__ Joe Groff
# [fit] __*10*__ Dave Abrahams
# [fit] __*10*__ Chris Lattner

^4 are apple, 1 non-apple!
Erica: written as many as Doug + Joe
*Not all accepted
Even rejections are influential, means idea was explored

---

# How did each release
# evolve?

![fit](img/evolve.jpg)

^Let's look at proposals per version

---

# Swift __*1.0*__ to __*2.1*__

<br><br><br><br><br><br><br>
# [fit] no proposals

*#yatusabes*

*(not open source yet)*

![](../../img/jobs_gates.jpg)

---

# Swift __*2.2*__
# [fit] __*8*__
# Proposals implemented

![fit](../../img/swift-logo.png)

^Open sourced Dec 3, 2015
Released March 21, 2016
First open-source release
**3-4 months of dev**

---

# Swift __*3.0*__
# [fit] __*89*__
# Proposals implemented

![fit](../../img/swift-logo.png)

^From March 2016 to Sept 2016
**5-6 months of dev**
8 to 89!

---

# [fit] `11x` __*more*__ 😱

---

# [fit] 1012%
# [fit] __*increase*__

![right](img/jared-confused.gif)

^1000% more swift
definitely 1000% more of something
1000% fewer typos lol

---

# [fit] Swift __*3.0*__

*1012% more swifty™*

*Proposals define and refine what "swifty" means.*

![fit](../../img/swift-logo.png)

^Joking, kind of true

---

# __*Original Goals*__

- Stable ABI (Application Binary Interface)
- Resilience (Fragile binary interface problem)
- Portability (Linux)
- Type system cleanup and docs
- Complete generics
- Focus and refine language
- API design guidelines

^ABI: Finalizes runtime data structures, calling conventions, etc. Future code can interact with older binaries
Resilience: "fragile base class". additive change to superclass should not require recompile for subclass

---

# [fit] What actually happened? 🤔

^tons of proposals!

---

<br><br><br>

*Swift 3:*
*Nothing compiles*

# [fit] lol

![](img/lattner.jpg)

---
Talking about new iPhone... or Swift 3?
`¯\_(ツ)_/¯`

![original](img/cook-change.jpg)

^Tim Cook thought he was talking about the new iPhone but he was really talking about Swift 3

---

<br><br><br><br><br><br><br>
<br><br><br><br><br><br><br>

*__Overwhelming__ community participation and feedback!*

# [fit] _Proposals **everywhere**_

![](../../img/everywhere.jpeg)

^3/4 of all proposals were accepted!

---

# [fit] __*5*__ Types of proposals

- *Syntax refinements*
- *API improvements, redesigns*
- *Bridging with Objective-C*
- *Features (new or refined)*
- *"Bug fixes"*

^We ended up with 5 main types of proposals (common themes)
ex: moving `where` clauses, func param labels, C for-loops
access control, property behaviors, collection indices
SE-37: inline comment next to an operator is parsed incorrectly

---

# New Goals

- *API design guidelines*
    - Automatic application of naming guidelines to imported Objective-C APIs
    - Adoption of naming guidelines in key APIs
    - "Swiftification" of imported Objective-C APIs
- *Focus and refine language*
- Improvements to tooling quality
- Source Stability

^Evolution process didn't contribute to all goals
It changed them!
[goals diff](https://github.com/apple/swift-evolution/commit/06b69a6e51a71a462c268da60b51a18966dba31b)
3.0 was about refinements, inter-op, and source stability
Black text == original goal

---

# [fit] __*very important proposals*__
# [fit] VIP's

---

# [SE-0005](https://github.com/apple/swift-evolution/blob/master/proposals/0005-objective-c-name-translation.md)
__Better Translation of Objective-C APIs Into Swift__
*Make Cocoa/Objective-C APIs Great Again!™*

```swift
// Example:
let text = "Hello, FrenchKit! 🇫🇷"

// Before
let content = text.stringByTrimmingCharactersInSet(
            NSCharacterSet.whitespaceAndNewlineCharacterSet())

// After
let content = text.trimming(.whitespaceAndNewlines)

```

^Refine how Cocoa/Objective-C APIs are imported
Remove redundancy. Verbosity != clarity
Basically affects all of your code

---

# [SE-0023](https://github.com/apple/swift-evolution/blob/master/proposals/0023-api-guidelines.md)
__API Design Guidelines__ ("The Great API transformation")
*Make Swift APIs Great Again!™*

```swift
// Example:
var array = [34, 79, 12, 3, 2, 56]

// sort in-place (present tense)
array.sort()

// return new, sorted array (past tense)
let sorted = array.sorted()
```

---

# [SE-0025](https://github.com/apple/swift-evolution/blob/master/proposals/0025-scoped-access-level.md)
__Scoped Access Level__
*Make Access Control Specifiers Great Again!™*

```swift
// Before
public > internal > private // (to file)

// After
public > internal > fileprivate > private // (to scope)
```

^similar to other languages
familiar, but unique to swift

---

# [SE-0117](https://github.com/apple/swift-evolution/blob/master/proposals/0117-non-public-subclassable-by-default.md)
__Allow distinguishing between public access and public overridability__
*Make Subclassing Great Again!™*

```swift
// Before
public class ViewController: UIViewController { }

// After
open class ViewController: UIViewController { }
```

^public = accessible, not subclass-able/override-able

---

# [fit] __*Access control in Swift 3*__

### `open`
### `public`
### `internal`
### `fileprivate`
### `private`

![50%](../../img/jackie.jpg)

---

#[ SE-0069](https://github.com/apple/swift-evolution/blob/master/proposals/0069-swift-mutability-for-foundation.md)
__Mutability and Foundation Value Types__
*Make Foundation Great Again!™*

```swift
// Before
let myDate = Date()
let myLaterDate = myDate.dateByAddingTimeInterval(60)

// After
var myDate = Date()
myDate.addTimeInterval(60) // OK

let myOtherDate = Date()
myOtherDate.addTimeInterval(60) // Error (let constant)

```

^More natural use of foundation (var and let)
Big performance increases (e.g., NSDate)

---

# [SE-0065](https://github.com/apple/swift-evolution/blob/master/proposals/0065-collections-move-indices.md)
__A New Model for Collections and Indices__
*Make Collections and Indices Great Again!™*

```swift
// Example:
let collection = /* some collection */
var index = collection.index(where: { /* condition */ })

// Before
index.successor()

// After
collection.index(after: index)
```

^complete rewrite
index traversal moved from index to collection
perf benefits (index doesn't have to know about collection)
big impact if you have custom collections

---

# [SE-0116](https://github.com/apple/swift-evolution/blob/master/proposals/0116-id-as-any.md)
__Import Objective-C `id` as Swift `Any` type__
*Make Polymorphic Obj-C Interfaces Great Again!™*

```objc
// Objective-C lol
- (BOOL)isEqual:(id)object;
```

```swift
// Before
func isEqual(_ object: AnyObject?) -> Bool

// After
func isEqual(_ object: Any?) -> Bool
```

^ObjC interfaces defined as `id`. This becomes `AnyObject` which doesn't work naturally with value types.
Interacting with Objective-C no longer imposes using reference types

---

# [fit] The cost of Swift Evolution

<br>

![](img/erlich-money.gif)

^Every change in software is a trade-off
The cost of the change you make now is forgoing the next best change you could have made

---

# [fit] __*Opportunity*__
# [fit] __*Cost*__
# [fit] what did we give up?

^Implicit in "what did we gain?" is "what did we give up?"
- Most of Swift 3 original goals!
- ABI not stable
- generics not finished
- First major OSS release!
- Swift had rough edges
- novelty effect
- necessary evil

---

# [fit] __*Was it worth it?*__

![fit](../../img/swift-logo.png)

^Looking back, I find some proposals distracting
"Could we be working on something more important right now?"
But overall, yes! All was worth it!

---

# [fit] Yes!

*Swift 3.0 is much better (but still work to do! 💪)*

*Source-stable (mostly? 🤔)*

*No more expensive, painful migrations (hopefully 😁)*

*Better APIs, better Objective-C inter-op 👌*

*Community learned about Swift-evolution process 🤓*

^Feels like a real 1.0
Again, always trades-offs
I think source stability is more important than ABI (at least initially)

---

# `Merci!`

![](img/millau.jpg)

---

# [fit] Resources

Me:
*@jesse_squires*
_jessesquires.com_
_github.com/jessesquires/swift-proposal-analyzer_

Swift Weekly Brief:
_swiftweekly.github.io_
_@swiftlybrief_

swift-evolution:
_github.com/apple/swift-evolution_
