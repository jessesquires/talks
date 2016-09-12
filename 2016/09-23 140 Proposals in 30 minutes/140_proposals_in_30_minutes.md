theme: Letters from Sweden, 3
autoscale: true
build-lists: true

# [fit] __*140*__ *proposals*

# [fit] *in* _**30**_ *minutes*
<br>
## __*Jesse Squires*__

jessesquires.com *•* @jesse_squires *•* @swiftlybrief

---

# [fit] swift __*evolution*__

> The Swift evolution process aims to leverage the collective ideas, insights, and experience of the Swift community to improve the Swift development experience.

1. *Engage community*
2. *Maintain vision and conceptual coherence*
3. *Core team responsible for strategic direction*

---
In other words...

# [fit] Turn our[^*] __*ideas*__
# [fit] Into Improvements

![fit](../../img/swift-logo.png)

[^*]: *Anyone can participate!*

---

# [fit] Make __*Swift*__ Great Again

![](img/drumpf.jpg)

---

# [fit] Swift
# [fit] __*1.0*__ to __*3.0*__

~2 years of Swift

---

# [fit] How did we get here?

Finally, *Swift 3.0* has arrived! 😎

But *how* did that happen? 🤔

Let's *analyze* swift-evolution proposals! 🤓

^I wrote a bunch of scripts!

---

# [fit] Proposal
# [fit] metadata

# [fit] _**What can we learn?**_

---

# [fit] `"It's just metadata"`

# [fit] __*LOL*__

![right](img/snowden.jpg)

---

# Proposals

# [fit] __*140*__

---

# [fit] __*98*__ implemented
# [fit] __*7*__ accepted[^1]
# [fit] __*10*__ deferred
# [fit] __*19*__ Rejected
# [fit] __*3*__ Withdrawn
# [fit] 3 __*in review*__

[^1]: But not yet implemented

---

# Acceptance:
# [fit] __*75%*__
# Implementation:
# [fit] __*70%*__

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
^Released March 21, 2016
^3-4 months of dev

---

# Swift __*3.0*__
# [fit] __*89*__
# Proposals implemented

![fit](../../img/swift-logo.png)

^From March 2016 to Sept 2016
^5-6 months of dev

---

# [fit] `11x` __*more*__ 😱

---

# [fit] 1012%
# [fit] __*increase*__

![right](img/jared-confused.gif)

^1000% more swift
^definitely 1000% more of something
^1000% fewer typos lol

---

# [fit] Swift __*3.0*__

*1012% more swifty™*

![fit](../../img/swift-logo.png)

---

# __*Goals*__

- Stable ABI (Application Binary Interface)
- Resilience
- Portability
- Type system cleanup and docs
- Complete generics
- Focus and refine language
- API design guidelines

---

# [fit] What actually happened?

---

<br><br><br>

*Swift 3:*
*Nothing compiles*

# [fit] lol

![](img/lattner.jpg)

---

Swift 3:
Even Tim Cook was like `¯\_(ツ)_/¯`

![original](img/cook-change.jpg)

^Tim Cook thought he was talking about the new iPhone but he was really talking about Swift 3

---

<br><br><br><br><br><br><br>
<br><br><br><br><br><br><br>

*__Overwhelming__ community participation!*

# [fit] _Proposals **everywhere**_

![](../../img/everywhere.jpeg)

^75% of all proposals were accepted for Swift 3

---

# New Goals

- *API design guidelines*
    - Automatic application of naming guidelines to imported Objective-C APIs
    - Adoption of naming guidelines in key APIs
    - Swiftification of imported Objective-C APIs
- *Focus and refine language*
- Improvements to tooling quality

*(a.k.a Source Stability)*

^[goals diff](https://github.com/apple/swift-evolution/commit/06b69a6e51a71a462c268da60b51a18966dba31b)

---

# [fit] VIP's

# [fit] __*very important proposals*__

---

# [SE-0005](https://github.com/apple/swift-evolution/blob/master/proposals/0005-objective-c-name-translation.md)
Better Translation of Objective-C APIs Into Swift

---

# [SE-0025](https://github.com/apple/swift-evolution/blob/master/proposals/0025-scoped-access-level.md)
Scoped Access Level

---

# [SE-0117](https://github.com/apple/swift-evolution/blob/master/proposals/0117-non-public-subclassable-by-default.md)
Allow distinguishing between public access and public overridability

---

Definitely:
- SE-0065, A New Model for Collections and Indices
- SE-0069, Mutability and Foundation Value Types
- SE-0072, Fully eliminate implicit bridging conversions from Swift

Maybe:
- SE-0060, Enforcing order of defaulted parameters
- SE-0062, Referencing Objective-C key-paths
- SE-0064, Referencing the Objective-C selector of property getters and setters
- SE-0086, Drop NS Prefix in Swift Foundation

---

# [fit] The cost of Swift Evolution

<br>

![](img/erlich-money.gif)

---

# [fit] __*Opportunity*__
# [fit] __*Cost*__
# [fit] what did we give up?

^Most of Swift 3's original goals!
^Novelty effect
^Necessary evil
^But source stability is extremely important

---

# [fit] __*What is worth it?*__

# [fit] `Source stability >> ABI stability`

---

# Finally...
# Behind every
# proposal
# is an __*author*__ 💪

^It is a lot of work to push a proposal forward
^Write formal proposal, discuss on mailing list

---

# Authors

# [fit] __*78*__

---

# Proposal per Author
# [fit] __*1.78*__
# `avg`

---

# Other Stats?

- avg time for review, longest, shortest

- avg # authors per proposal

- core team vs community proposals

- avg # proposals per author, top influencers?

- types of proposals: bug, syntax refinement, feature refinement, new feature

---

# `Merci!`

![](img/millau.jpg)

---

# [fit] Resources

Swift Weekly Brief:
_swiftweekly.github.io_
_@swiftlybrief_

Apple:
_swift.org_
_github.com/apple/swift-evolution_

Me:
_jessesquires.com_
_github.com/jessesquires/swift-proposal-analyzer_
