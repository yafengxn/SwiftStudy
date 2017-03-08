//: Playground - noun: a place where people can play

import UIKit

////////////////////枚举
enum CompassPoint { // North, South, East, West 有各自的值，没有像其他语言赋默认值0，1，2，3
    case North
    case South
    case East
    case West
}

let directionToHead: CompassPoint = .North  // 当变量显示指定类型时，可使用 .case属性 简写

switch directionToHead {    // 当没有考虑到每种情况时，需要加default分支
case .North:
    print("North")
case .South:
    print("South")
case .East:
    print("East")
case .West:
    print("West")
}

switch directionToHead {
case .South:
    print("South")
default:
    print("Not South")
}


enum ASCIIIControlCharacter: Character {
    case Tab = "\t" // 原始值， 定义枚举的时候被预先填充； 相关值，在第一次创建一个枚举变量的时候才会被设置，类似于初始化填入的值
    case LineFeed = "\n"
    case CarriageReturn = "\r"
}

enum Planet: Int { // 枚举类型可以是整数，字符串、后者任何整形或浮点数，当类型为整形并且有定某个枚举的值时，后边的枚举依次递增；枚举元素的值可使用rawValue来获取
case Mercy = 1, Venus, Earth, Mars, Jupiter, Saturn
}

let positionToFind = 9
if let somePlanet = Planet(rawValue: positionToFind) {
    switch somePlanet {
    case .Earth:
        print("Mostly harmless")
    default:
        print("Not a safe place for humans")
    }
} else {
    print("There isn't a planet at position \(positionToFind)")
}


