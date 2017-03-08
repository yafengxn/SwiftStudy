//: Playground - noun: a place where people can play

import UIKit

//////////////////////函数
func sayHello(personName: String) -> String {
    let greeting = "Hello, " + personName + "!"
    return greeting
}

func sayHello2(personName: String) -> String {
    return "Hello again, " + personName + "!"
}

print(sayHello2(personName: "Anna"))

func halfOpenRangeLength(start: Int, end: Int) -> Int {
    return end - start
}

print(halfOpenRangeLength(start: 1, end: 10))

// 无参函数
func sayHelloWorld() -> String {
    return "Hello world"
}
print(sayHelloWorld())

// 无返回值函数
func sayGoodbye(personName: String) {
    print("Goodbye, \(personName)")
}
print(sayGoodbye(personName: "Dave"))   // 打印 () ,其实返回值是一个空的元组

// 多重返回值函数（即返回元组的函数）
func count(string: String) -> (vowels: Int, consonants: Int, others: Int) {
    var vowels = 0, consonants = 0, others = 0
    for character in string.characters {
        switch character {
        case "a", "e", "i", "o", "u":
            vowels += 1
        case "b", "c", "d", "f", "g", "h", "j", "k", "l", "m", "n", "p", "q", "r", "s", "t", "v", "w", "x", "y", "z":
            consonants += 1
        default:
            others += 1
        }
    }
    return (vowels, consonants, others)
}

let total = count(string: "some arbitrary string! ")
print("\(total.0) vowels and \(total.1) consonants")

// func join(外参 内参: 类型, ...)
func join(string s1: String, toString s2: String, withJoiner joiner: String) -> String {
    return s1 + joiner + s2
}
join(string: "Hello", toString: "world", withJoiner: ", ")

func containsCharacter(_ string: String, _ characterToFind: Character) -> Bool {
    for character in string.characters {
        if character == characterToFind {
            return true
        }
    }
    return false
}

let containsAVee = containsCharacter("aardvark", "v")

func join2(string s1: String, toString s2: String, withJoiner joiner: String = " ") -> String {
    return s1 + joiner + s2
}
join2(string: "hello", toString: "world") // 不写入参时 默认使用 “ ”
join2(string: "hello", toString: "world", withJoiner: "-")

// 当未给带默认值的参数提供外部参数名时，swift 会自动提供外部名字，此时和局部名字是一样的
func join3(s1: String, s2: String, joiner: String = " ") -> String {
    return s1 + joiner + s2
}

join3(s1: "hello", s2: "world", joiner: "-")

func arithmeticMean(numbers: Double...) -> Double { // 一个函数至多有一个可变参数，且必须是参数的最后一个
    var total: Double = 0
    for number in numbers {
        total += number
    }
    return total / Double(numbers.count)
}
arithmeticMean(numbers: 1, 2, 3)

// 什么意思？？？？string在函数内可修改，外部传入参数还是不变，说明这里传的是值不是引用
//func alignRaight(var string: String, totalLength: Int, pad: Character) -> String {
//    let amoutToPad = totalLength - string.characters.count
//    if amoutToPad < 1 {
//        return string
//    }
//    let padString = String(pad)
//    for _ in 1...amoutToPad {
//        string = padString + string
//    }
//
//    return string
//}
//var originalString = "hello"
//let paddedString = alignRaight(string: originalString, totalLength: 10, pad: "-")

// 输入输出参数不能有默认值，而且可变参数不能用inout修饰，如果用inout修饰一个参数，这个参数不能被var 或 let标记
func swapTwoInts( a: inout Int, b: inout Int) {
    let temp = a
    a = b
    b = temp
}
var someInt = 3
var anotherInt = 107
swapTwoInts(a: &someInt, b: &anotherInt)
print("someInt is now \(someInt), and anotherInt is \(anotherInt)")


func addTwoInts(oneInt: Int, anotherInt: Int) -> Int {
    return oneInt + anotherInt
}
func mathResult(mathFunction: (Int, Int) -> Int, a: Int, b: Int) {
    print("Result: \(mathFunction(a, b))")
}

mathResult(mathFunction: addTwoInts, a: 2, b: 3)

func stepForward(input: Int) -> Int {
    return input + 1
}
func stepBackward(input: Int) -> Int {
    return input - 1
}
func chooseStepFunction(backwards: Bool) -> (Int) -> Int {
    return backwards ? stepBackward : stepForward
}

var currentValue = 3
let moveNearToZero = chooseStepFunction(backwards: currentValue > 0)
print("Counting to zero")
while currentValue != 0 {
    print("\(currentValue)")
    currentValue = moveNearToZero(currentValue)
}
print("zero!")

print("============================")
// 嵌套函数
func chooseStepFunction2(backwards: Bool) -> (Int) -> Int {
    func stepForward(input: Int) -> Int { return input + 1 }
    func stepBack(input: Int) -> Int { return input - 1 }
    return backwards ? stepBackward : stepForward
}
var currentValue2 = -4
let moveNearToZero2 = chooseStepFunction(backwards: currentValue2 > 0)
while currentValue2 != 0 {
    print("\(currentValue2)")
    currentValue2 = moveNearToZero2(currentValue2)
}
print("zero!")



