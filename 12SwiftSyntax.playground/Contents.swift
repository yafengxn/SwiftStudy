//: Playground - noun: a place where people can play

import UIKit

/////////////////////////////类和结构体
struct Resolution {
    var width = 0
    var height = 0
}

class ViewMode  {
    var resolution = Resolution()
    var interlaced = false
    var frameRate = 0.0
    var name: String?
}

var someReolution = Resolution()
var someViedeoMode = ViewMode()

print("The width of someResolution is \(someReolution.width)")

someReolution.width = 1440  // Swift中可直接修改结构体中属性

print("The width of someResolution is \(someReolution.width)")

let vga = Resolution(width: 640, height: 480)

let hd = Resolution(width: 1920, height: 1080)
var cinema = hd
cinema.width = 2048
print(cinema, hd)   // cinema只是hd的拷贝，结构体和枚举是值类型

enum CompassPoint {
    case North, South, East, West
}
var currentDirection = CompassPoint.North
let remeberedDirection = currentDirection
currentDirection = .West
print("remeberedDirecion is still \(remeberedDirection)")   // 枚举也是值类型，remeberedDirection只是currentDirection的拷贝

let tenEighty = ViewMode()
tenEighty.resolution = hd
tenEighty.interlaced = true
tenEighty.name = "1080i"
tenEighty.frameRate = 25.0

let alsoTenEighty = tenEighty
alsoTenEighty.frameRate = 30.0  // alsoTenEighty 被声明为常量， 其属性  仍然可以被修改，alsoTenEighty、tenEighty是没有改变的

print(tenEighty.frameRate) // 30 类是引用类型，alsoTenEighty即为tenEighty实例本身，所以tenEighty的值也会被修改


if tenEighty === alsoTenEighty { // 判断两个常量或变量是否引用同一个实例使用 ===， == 只比较地址，=== 比较地址指向的实例，引用类型的实例和OC中指针类似
    print("tenEighty、 alsoTenEighty指向同一个实例")
}

// 下面情况请使用结构体
    // * 结构体的主要目的是用来封装商量相关简单的数据值
    // * 有理由预计一个结构体实例在赋值和传递时，封装的数据将会被拷贝而不是被引用
    // * 任何在结构体中储存的值类型属性，也将会被拷贝，而不是被引用
    // * 结构体不需要继承另一个已存在类型的属性或者行为

/*
 Swift 中 字符串(String)、数组(Array)、字典(Dictionary)类型均以结构体的方式实现 ---> 值传递
 
 Objective-C 中，字符串(NSString)、数组(NSArray)、字典(NSDictionary)类型均以类的形式实现 ---> 引用传递
 */


