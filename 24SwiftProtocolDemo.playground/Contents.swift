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

class SnakesAndLadders: DiceGame {
    let finalSquare = 25
    let dice = Dice(sides: 6, generator: LinearCongruentialGenerator())
    var square = 0
    var board: [Int]
    init() {
        board = [Int](repeating: 0, count: finalSquare + 1)
        board[03] = +08; board[06] = +11; board[09] = +09; board[10] = +02;
        board[14] = -10; board[19] = -11; board[22] = -02; board[24] = -08;
    }
    var delegate: DiceGameDelegate?
    func play() {
        square = 0
        delegate?.gameDidStart(game: self)
        gameLoop: while square != finalSquare {
            let diceRoll = dice.roll()
            delegate?.game(game: self, didStartNewTurnWithDiceRoll: diceRoll)
            switch square + diceRoll {
            case finalSquare:
                break gameLoop
            case let newSquare where newSquare > finalSquare:
                continue gameLoop
            default:
                square += diceRoll
                square += board[square]
            }
        }
        delegate?.gameDidEnd(game: self)
    }
}

class DiceGameTracker: DiceGameDelegate {
    var numberOfTurns = 0
    func gameDidStart(game: DiceGame) {
        numberOfTurns = 0
        if game is SnakesAndLadders {
            print("Started a new game of Snakes and Ladders")
        }
        print("The game is using a \(game.dice.sides) - sided dice")
    }
    func game(game: DiceGame, didStartNewTurnWithDiceRoll diceRoll: Int) {
        numberOfTurns += 1
        print("Rolled a \(diceRoll)")
    }
    func gameDidEnd(game: DiceGame) {
        print("The game lasted for \(numberOfTurns) turns")
    }
}
let tracker = DiceGameTracker()
let game = SnakesAndLadders()
game.delegate = tracker
game.play()



protocol TextRepresentable {
    func asText() -> String
}
struct Hamster {
    var name: String
    func asText() -> String {
        return "A hamster named \(name)"
    }
}
extension Hamster: TextRepresentable { } // Hamster内部实现了asText方法，但是忘了声明TextRepresentable协议，，可以通过extension补充协议声明

let simonTheHamster = Hamster(name: "Simon")
let someThingTextRespresenttable: TextRepresentable = simonTheHamster  // 虽然满足了协议，但是还要显示的制定协议声明给变量
print(someThingTextRespresenttable.asText())

let things: [TextRepresentable] = [simonTheHamster] // 数组遵循协议，可以把协议看做一种类型放到【】中
for thing in things {
    print(thing.asText())
}

protocol PrettyTextRepresentable: TextRepresentable {
    func asPrettyText() -> String
}

extension SnakesAndLadders: TextRepresentable {
    func asText() -> String {
        return "SnakesAndLadders"
    }
}

extension SnakesAndLadders: PrettyTextRepresentable {
    func asPrettyText() -> String {
        var output = asText() + ":\n"
        for index in 1...finalSquare {
            switch board[index] {
            case let ladder where ladder > 0:
                output += "⏫ "
            case let snake where snake < 0:
                output += "⏬ "
            default:
                output += "o "
            }
        }
        return output
    }
}

print(game.asPrettyText())

protocol Named {
    var name: String { get }
}
protocol Aged {
    var age: Int { get }
}
struct Human: Named, Aged {
    var name: String
    var age: Int
}
func wishHappyBirthday(celebrator: Named & Aged) {
    print("Happy birthday \(celebrator.name) - you're \(celebrator.age)")
}
let birthdayPerson = Human(name: "Malcolm", age: 21)
wishHappyBirthday(celebrator: birthdayPerson)

@objc protocol HasArea {    // @objc表示协议可选，也可用来表示暴露给Objective-C的代码，@objc只对类有效，因此只能在勒种检查协议的一致性
    var area: Double { get }
}
class Circle: HasArea {
    let pi = 3.1415926
    var radius: Double
    var area: Double { return pi * radius * radius }
    init(radius: Double) {
        self.radius = radius
    }
}
class Country: HasArea {
    var area: Double
    init(area: Double) {
        self.area = area
    }
}
class Animal {
    var legs: Int
    init(legs: Int) {
        self.legs = legs
    }
}
let objects: [AnyObject] = [
    Circle(radius: 2.0),
    Country(area: 243_610),
    Animal(legs: 4)
]
for object in objects {
    if let objectWithArea = object as? HasArea {    // 检查是否实现某个协议
        print("Area is \(objectWithArea.area)")
    } else {
        print("Sth that doesn't have an area")
    }
}

@objc protocol CounterDataSource {
    @objc optional func incrementForCount(count: Int) -> Int
    @objc optional var fiexedIncrement: Int { get }
}

class Counter {
    var count = 0
    var dataSource: CounterDataSource?
    func increment() {
        if let amount = dataSource?.incrementForCount?(count: count) {
            count += amount
        } else if let amount = dataSource?.fiexedIncrement {
            count += amount
        }
    }
}
class ThreeSource: CounterDataSource {
    let fiexedIncrement: Int = 3
}
var counter = Counter()
counter.dataSource = ThreeSource()
for _ in 1...4 {
    counter.increment()
    print(counter.count)
}

class TowardsZeroSource: CounterDataSource {
    func incrementForCount(count: Int) -> Int {
        if count == 0 {
            return 0
        } else if count < 0 {
            return 1
        } else {
            return -1
        }
    }
}
counter.count = -4
counter.dataSource = TowardsZeroSource()
for _ in 1...5 {
    counter.increment()
    print(counter.count)
}


