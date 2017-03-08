//: Playground - noun: a place where people can play

import UIKit

///////////////////////简单值
let number : Float = 4
print(number)

let label = "The width is"
let width = 94
let widthLabel = label + String(width)
//let widthLabel = label + width  // string类型和Int类型不能使用‘+’操作符

let apples = 3
let oranges = 5
let appleSummary = "I have \(apples) apples"
let fruitSummary = "I have \(apples + oranges) fruits"

let name = "Wang"
let helloSb = "hello, \(name)"  // \(variable)可以将variable变量替换它的值

var shoppingList = ["catfish", "water", "tuplis", "bluepaint"]
shoppingList[1] = "better of watter"
print(shoppingList)

var occupations = [
    "Malcolm" : "Captain",
    "Kaylee"  : "Mechanic"
]

occupations["Jayne"] = "Public Realations"  // 字典中没有此元素，即添加新元素
occupations["Captain"] = "hello"    // 冒号前面的为key，可以通过值修改key，也可以通过key来修改值
occupations["Kaylee"] = "world"
print(occupations)
print(occupations["Kaylee"])        // 但是，只能通过key来打印值

let emptyArray = [String]() // 创建空数组
let emptyDictionary = [String: Float]() // 创建空字典

shoppingList = []
occupations = [:] // 也可以这样创建空数组、空字典，但是类型必须能被推断出来

///////////////////////控制流
let individualScores = [1, 2, 3, 4, 6]
var teamScore = 0
for score in individualScores {
    if score > 50 {         // 条件必须是布尔表达式，否则标错，不能使用类似if score{}
        teamScore += 3
    } else {
        teamScore += 1
    }
}
print(teamScore)

var optionalString: String? = "Hello"
print(optionalString == nil)    // 不等于nil，此时等于 hello

var optionalName: String? = "John Bush"
var greeting = "Hello!"
//optionalName = nil
if let sname = optionalName {   // 当optionName被赋值nil时，不会进入此分支，且sname的作用域在大括号内部，外部无法访问此变量
    greeting = "Hello, \(sname)"
    print(sname)
} else {
    greeting = "Fine, thx"
}

let vegetable = "red pepper"
switch vegetable {
    case "celery":
        let vegetableComment = "Add some raisins and make ants on log"
    case "cucumber", "watercress":
        let vegetableComment = "That would be a good sanwich"
    case let x where x.hasSuffix("pepper"):
        let vegetableComment = "Is it a spicy \(x)"
        print(vegetableComment) // 不加break，也用加大括号
    default:
        let vegetableComment = "wtf"    // switch 语句必须有default分支
}

let interestingNumbers = [
    "Prime": [2, 3, 5, 7, 11, 13],
    "Finbonacci": [1, 1, 2, 3, 5, 8],
    "Square": [1, 4, 9, 16, 25]
]
var largest = 0
for (kind, numbers) in interestingNumbers {
    for number in numbers {
        if number > largest {
            largest = number
        }
    }
}
print(largest)

var n = 2
while n < 100 {
    n *= 2
}
print(n)

var m = 50
repeat {
    m *= 2
} while m < 100
print(m)

var firstForLoop = 0
for i in 0 ..< 4 {
    firstForLoop += i
}
print(firstForLoop)

//var secForLoop = 0
//for var i = 0; i < 4; ++i {   // swift 3中没有了++，且不允许使用C类型循环，使用上面的
//    secForLoop += i
//}
//print(secForLoop)
