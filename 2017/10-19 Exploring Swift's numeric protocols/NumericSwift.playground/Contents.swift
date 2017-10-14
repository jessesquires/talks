import Foundation

/*:
 # Exploring Swift's numeric types and protocols
 ## Talk at iOS Singapore Conference
 */

//: ## Printing maximum floating-point digits
extension FloatingPoint {
    var preciseString: String {
        let mirror = Mirror(reflecting: self)
        let type = mirror.subjectType

        var format: String = ""
        if type == Float.self {
            format = String(format: "%.23f", self as! CVarArg)
        } else if type == Double.self {
            format = String(format: "%.53f", self as! CVarArg)
        } else if type == Float80.self {
            // Float80 doesn't conform to CVarArg!
            format = "\(self)"
        }

        return format
    }
}

func printFloatingPoint<T: FloatingPoint> (_ value: T) {
    print(value.preciseString)
}

//: ## New constants
Float.ulpOfOne // FLT_EPSILON
Float.leastNormalMagnitude // FLT_MIN
Float.greatestFiniteMagnitude // FLT_MAX
Float.leastNonzeroMagnitude

Double.ulpOfOne // DBL_EPSILON
Float80.ulpOfOne // LDBL_EPSILON

//: ## Precision

let f = Float(1_000.01)
let expected = f * Float(10.0)
var sum = Float(0.0)
for _ in 0..<10 {
    sum += f
}

sum
sum.preciseString
sum.ulp.preciseString
(sum + sum.ulp).preciseString

(sum + expected.ulp).preciseString

expected
expected.preciseString
expected.ulp.preciseString
(expected + expected.ulp).preciseString


func printUlps() {
    for i in 0..<100 {
        let n = Float(i)
        print("\(n)")
        printFloatingPoint(n.ulp)
        printFloatingPoint(n.nextUp)
        print()
    }
}

//: ## Computing ulp

let value = Float(3.1415)
//value = 0.000_000_000_000_000_000_000_000_000_000_000_000_01
//value = 1_000.0
//value = 1_000_000_000.0
//value = 23098234.23829323
"value"
value.preciseString

value.sign
value.exponent
value.significand

Float.exponentBitCount
value.exponentBitPattern

Float.significandBitCount
value.significandBitPattern

// significand * radix ** exponent
"computing ulp"
let computedUlp = Float.ulpOfOne * powf(Float(Float.radix), Float(value.exponent))
computedUlp.preciseString
value.ulp.preciseString

"next up"
let computedNextUp = value + computedUlp
computedUlp.preciseString
value.nextUp.preciseString

//: ## Breaking down implementation from std lib
var theUlp: Float = 0

if value.exponentBitPattern > UInt(Float.significandBitCount) {
    // self is large enough that self.ulp is normal, so we just compute its
    // exponent and construct it with a significand of zero.
    let ulpExponent = value.exponentBitPattern - UInt(Float.significandBitCount)
    theUlp = Float(sign: .plus,
                   exponentBitPattern: ulpExponent,
                   significandBitPattern: 0)
}
else if value.exponentBitPattern >= 1 {
    // self is normal but ulp is subnormal.
    let ulpShift = UInt32(value.exponentBitPattern - 1)
    theUlp = Float(sign: .plus,
                   exponentBitPattern: 0,
                   significandBitPattern: 1 &<< ulpShift)
}

// var ulp: Float {
//     if exponentBitPattern > UInt(Float.significandBitCount) {

let ulpSign = FloatingPointSign.plus
let ulpExponent = value.exponentBitPattern - UInt(Float.significandBitCount)
let ulpSignificandBitPattern = UInt32(0)

// init(sign: FloatingPointSign,
//      exponentBitPattern: UInt,
//      significandBitPattern: UInt32) {

let signShift = Float.significandBitCount + Float.exponentBitCount
let sign = UInt32(ulpSign == .minus ? 1 : 0)

let _infinityExponent = 1 &<< UInt(Float.exponentBitCount) - 1
let exponent = UInt32(ulpExponent & _infinityExponent)

let _significandMask = 1 &<< UInt32(Float.significandBitCount) - 1
let significand = UInt32(ulpSignificandBitPattern & _significandMask)

let signMaskLeftShift = sign &<< UInt32(signShift)
let exponentMaskLeftShift = exponent &<< UInt32(Float.significandBitCount)

let bitPattern = signMaskLeftShift | exponentMaskLeftShift | significand

let finalUlp = Float(bitPattern: bitPattern)
finalUlp.preciseString


//: ## Examples
//: ### SignedNumeric

extension Sequence where Element: SignedNumeric & Comparable {
    func filterNegatives() -> [Element] {
        return filter { $0 > 0 }
    }
}

let allPositive = [1, 2, 3, -4, -5].filterNegatives()

//: ### FloatingPoint

func hypotenuse<T: FloatingPoint>(_ a: T, _ b: T) -> T {
    return (a * a + b * b).squareRoot()
}

let (dx, dy) = (3.0, 4.0)
let dist = hypotenuse(dx, dy)

//: ### FixedWidthInteger

extension FixedWidthInteger {
    var binaryString: String {
        var result: [String] = []
        for i in 0..<(Self.bitWidth / 8) {
            let byte = UInt8(truncatingIfNeeded: self >> (i * 8))
            let byteString = String(byte, radix: 2)
            let padding = String(repeating: "0",
                                 count: 8 - byteString.count)
            result.append(padding + byteString)
        }
        return "0b" + result.reversed().joined(separator: "_")
    }
}

let x = Int16(4323)
x.binaryString
x.littleEndian
x.littleEndian.binaryString
x.bigEndian
x.bigEndian.binaryString
x.byteSwapped
x.byteSwapped.binaryString

Int16.bitWidth
Int16.min
Int16.max

//: ## Comparisons

extension Float {
    var asInt32: Int32 {
        return Int32(bitPattern: bitPattern)
    }
}

let f1 = Float(1.0)
let f2 = f1 + (f1.ulp * 5.0)

f1.ulp
f2.ulp

f1.asInt32
f2.asInt32

abs(f1.asInt32 - f2.asInt32) // 5 ulps difference

fabs(f1.ulp - f2.ulp)

let f3 = Float(1_000_000.0)
let f4 = f3 + (f3.ulp * 5)

f3.preciseString
f4.preciseString

f3.asInt32
f4.asInt32
abs(f3.asInt32 - f4.asInt32)

