//: Playground - noun: a place where people can play

import UIKit

protocol FullyNamed {
    var fullName: String { get }    // {} 中提供此属性是只读还是读写
}

struct Person: FullyNamed {
    var fullName: String
}

let john = Person(fullName: "John Appleseed")
print(john.fullName)

class Starship: FullyNamed {
    var prefix: String?
    var name: String
    init(name: String, prefix: String? = nil) {
        self.name = name
        self.prefix = prefix
    }
    var fullName: String {
        return (prefix != nil ? prefix! + " " : " ") + name
    }
}

var ncc1701 = Starship(name: "Enterprise", prefix: "USS")
print(ncc1701.fullName)

protocol RandomNumberGenerator {
    func random() -> Double
}

class LinearCongruentialGenerator: RandomNumberGenerator {
    var lastRandom = 42.0
    let m = 139968.0
    let a = 3877.0
    let c = 29753.0
    func random() -> Double {
        lastRandom = ((lastRandom * a + c).truncatingRemainder(dividingBy: m))
        return lastRandom / m
    }
}
let generator = LinearCongruentialGenerator()
print("Here's a random number: \(generator.random())")
print("Here's another random number: \(generator.random())")

protocol Togglable {
    mutating func toggle()
}

enum OnOffSwitch: Togglable {
    case Off, On
    mutating func toggle() {    // 当枚举、结构体遵守协议时，协议中的方法带有mutating，此时枚举、结构体也必须带有mutating，实现协议的类可以不写mutating
        switch self {
        case .Off:
            self = .On
        case .On:
            self = .Off
        }
    }
}
var lightSwitch = OnOffSwitch.Off
lightSwitch.toggle()

// 协议中如果有构造器，遵循协议必须在类中实现，并在开头写上required ，表示子类必须实现该构造器

// 当协议中存在可失败构造器时，那么遵守该协议的类必须实现同名同参数的可失败构造器或非可失败构造器
// 当协议中存在非可失败构造器时，那么          。。。  同名同参的非可失败构造器或隐式解析类型的可失败构造器(init!)

// 强烈的既视感。。。无语。。。

/*
 * 尽管协议本身并不实现任何功能，但是协议可以当做类型来使用
 * 使用场景：
 *  * 协议作为函数、方法或构造器中的参数类型或者返回值类型
 *  * 协议类型作为常量、变量或属性的类型
 *  * 协议类型作为数组、字典或其他容器中的元素类型
 */
class Dice {
    let sides: Int
    let generator: RandomNumberGenerator
    init(sides: Int, generator: RandomNumberGenerator) {
        self.sides = sides
        self.generator = generator
    }
    func roll() -> Int {
        return Int(generator.random() * Double(sides)) + 1
    }
}

var d6 = Dice(sides: 6, generator: LinearCongruentialGenerator())
for _ in 1...5 {
    print("Random dice roll is \(d6.roll())")
}

protocol DiceGame {
    var dice: Dice { get }
    func play()
}

protocol DiceGameDelegate {
    func gameDidStart(game: DiceGame)
    func game(game: DiceGame, didStartNewTurnWithDiceRoll diceRoll: Int)
    func gameDidEnd(game: DiceGame)
}
