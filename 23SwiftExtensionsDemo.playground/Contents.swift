//: Playground - noun: a place where people can play

import UIKit

/*
 * Swift中扩展可以：
    * 添加计算性属性和计算静态属性
    * 定义实例方法和类型方法
    * 提供新的构造器
    * 定义下标
    * 定义和使用新的嵌套类型
    * 使一个已有类型符合某个协议
 */

extension Double {
    var km: Double { return self * 1_000.0 }
    var m : Double { return self }
    var cm: Double { return self / 100.0 }
    var mm: Double { return self / 1_000.0 }
    var ft: Double { return self / 3.28084 }
}
let oneInch = 25.4.mm
print("One inch is \(oneInch) meters")

let threeFeet = 3.ft
print("Three feet is \(threeFeet) meters")

let aMarathon = 42.km + 195.m
print("A marathon is \(aMarathon) meters long")

struct Size {
    var width = 0.0, height = 0.0
}

struct Point {
    var x = 0.0, y = 0.0
}

struct Rect {
    var origin = Point()
    var size = Size()
}

let defaultRect = Rect()
let memberwiseRect = Rect(origin: Point(x: 2.0, y: 2.0),
                          size: Size(width: 5.0, height: 5.0))
extension Rect {    // 使用Extension 为Rect类添加一个构造器
    init(center: Point, size: Size) {
        let originX = center.x - (size.width / 2)
        let originY = center.y - (size.height / 2)
        self.init(origin: Point(x: originX, y: originY), size: size)
    }
}

let centerRect = Rect(center: Point(x: 4.0, y: 4.0),
                      size: Size(width: 3.0, height: 3.0))


extension Int { // 还可以使用Extension给已有类型添加实例方法，这个实例方法就是多次执行task操作
    func repetitions(task: () -> ()) {
        for _ in 0..<self {
            task()
        }
    }
}

3.repetitions(task: { print("Hello") }) // 这里将返回类型省略

3.repetitions { print("world") }    // 使用尾随闭包使得代码更简洁

extension Int { // 这里使用extension给Int类型添加一个可以修改self的实例方法，要修改self必须给方法前加mutating
    mutating func square() {
        self = self * self
    }
}
var someInt = 3
someInt.square()

extension Int { // 这里给Int类型添加subscript方法用来返回每个数字
    subscript(digitIndex: Int) -> Int {
        var digitIndex = digitIndex
        var decimalBase = 1
        while digitIndex > 0 {
            decimalBase *= 10
            digitIndex -= 1
        }
        return (self / decimalBase) % 10
    }
}

123456789[0]
123456789[1]
123456789[2]
123456789[10]   // 如果没有足够的位数，返回0

extension Character {
    enum  Kind {    // 给Character类型添加枚举区分当前字母是否为辅音
        case Vowel, Consonant, Other
    }
    var kind: Kind {
        switch String(self).localizedLowercase {
        case "a", "o", "e", "i", "u":
            return .Vowel
        case "b", "c", "d", "f", "g", "h", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "v", "w", "x", "y", "z":
            return .Consonant
        default:
            return .Other
        }
    }
}
func printLetterKinds(word: String) {
    print("\(word) is made up of the following kinds of letters:")
    for character in word.characters {
        switch character.kind {
        case .Vowel:
            print("vowel")
        case .Consonant:
            print("consonant")
        case .Other:
            print("other")
            
        }
    }
}
printLetterKinds(word: "hello")



