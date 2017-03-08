//: Playground - noun: a place where people can play

import UIKit

///////////////////////方法
class Counter {
    var count = 0
    func increment() {
        count += 1
    }
    func incrementBy(amount: Int) {
        count += amount
    }
    // _标识忽略第一个外参名字，这样调用的时候就不用写了
    // 想要内外部名称用一个外部参数出就什么都不写就好了，像 numberOfTimes
    func incrementBy(_ amount: Int, numberOfTimes: Int) {
        count += amount * numberOfTimes
    }
    func reset() {
        count = 0
    }
    
    func description() {    // 每个实例方法中都有一个隐函属性self
        print("count : \(self.count)")
        print("count : \(count)")   // 这个self也不是必须要写的，不写也可以取的到count属性
    }
}

let counter = Counter()
counter.increment()
print(counter.count)
counter.incrementBy(amount: 5)
print(counter.count)
counter.reset()
print(counter.count)

counter.incrementBy(5, numberOfTimes: 3)
print(counter.count)

counter.description()


// self 可以消除方法参数和实例属性之间的歧义
struct Point {
    var x = 0.0, y = 0.0
    func isToTheRightOfX(x: Double) -> Bool {
        return self.x > x
    }
}
let somePoint = Point(x: 4.0, y: 5.0)
if somePoint.isToTheRightOfX(x: 1.0) {
    print("This point is to the right of the line x == 1.0")
}

struct Point2{
    var x = 0.0, y = 0.0
    mutating func moveByX(deltaX: Double, deltaY: Double) {
        x += deltaX
        y += deltaY
    }
}
var somePoint2 = Point2(x: 1.0, y: 1.0)
somePoint2.moveByX(deltaX: 2.0, deltaY: 3.0)
print("The point is now at (\(somePoint2.x), \(somePoint2.y))")

let fixedPoint = Point2(x: 3.0, y: 4.0)
// fixedPoint.moveByX(deltaX: 2.0, deltaY: 3.0) // 报错，fixPoint不能修改，说明moveByX方法返回一个新的Point2实例

struct Point3 {
    var x = 0.0, y = 0.0
    mutating func moveByX(deltaX: Double, y deltaY: Double) {
        // 在mutating 方法中修改self
        self = Point3(x: x + deltaX, y: y + deltaY)
    }
}

enum TriStateSwitch {
    case Off, Low, High
    mutating func next() {
        switch self {
        case .Off:
            self = .Low
        case .Low:
            self = .High
        case .High:
            self = .Off
        }
    }
}

var ovenLight = TriStateSwitch.Low
ovenLight.next()
ovenLight.next()

class SomeClass {
    class func someTypeMethod() {
        print("someTypeMethod")
    }
}
SomeClass.someTypeMethod()

struct LevelTracker {
    static var highestUnlockedLevel = 1
    static func unlockLevel(level: Int) {
        if level > highestUnlockedLevel {
            highestUnlockedLevel = level
        }
    }
    static func levelIsUnlocked(level: Int) -> Bool {
        return level <= highestUnlockedLevel
    }
    var currentLevel = 1
    mutating func advanceToLevel(level: Int) -> Bool {
        if LevelTracker.levelIsUnlocked(level: level) {
            currentLevel = level
            return true
        } else {
            return false
        }
    }
}

class Player {
    var tracker = LevelTracker()
    let playerName: String
    func completedLevel(level: Int) {
        LevelTracker.unlockLevel(level: level + 1)
        tracker.advanceToLevel(level: level + 1)
    }
    init(name: String) {
        playerName = name
    }
}

var player = Player(name: "Argyrios")
player.completedLevel(level: 2)
print("highest unlocked level is now \(LevelTracker.highestUnlockedLevel)")

player = Player(name: "Beto")
if player.tracker.advanceToLevel(level: 4) {
    print("player is now on level 4")
} else {
    print("level 6 has not yet been unlocked")
}


