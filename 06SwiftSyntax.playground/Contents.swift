//: Playground - noun: a place where people can play

import UIKit

let languageName = "Swift"
// languageName = "Swift++"  // languageName 为常量， 不允许更改

/********************
    /* 可以且套注释了*/
 ********************/
print("hello", "world")

let minValue = UInt8.min   // 0
let maxValue = UInt8.max   // 255

// 没有特殊情况 不要使用UInt，
let intMinValue = Int32.min  // -2147483648    // Mac 为64位平台，最大值
let intMaxValue = Int32.max  // 2147483647

let floatValue = 3.1415926  // 类型推断 浮点数 总会选择 Double 而不是 Float
let anotherPi = 3 + 0.1415926   // anotherPi 会被推测为 Double 类型

let decimalInteger = 17     // 十进制
let binaryInteger = 0b10001 // 二进制17
let octalInteger  = 0o21    // 八进制17
let hexadecimalInteger = 0x11  // 十六进制17

let decimalDouble = 12.1875 // 十进制
let exponentDouble = 1.21875e1    // 科学计数法
let hexadecimalDouble = 0xC.3p0

let paddedDouble = 000123.456   // 可以添加额外的0
let oneMillion = 1_000_000  // 可以添加额外的_, 不影响数值
let justOverOneMillion = 1_000_000.000_000_1    // 可以添加额外的_

//let cannotBeNegative: UInt8 = -1  // UInt 类型不能存储 负数， 会报错
//let tooBig: Int8 = Int8.max + 1 // Int8 溢出

let twoThousand: UInt16 = 2_000
let one: UInt8 = 1
let twoThousandAndOne = twoThousand + UInt16(one)  // UInt8 和 UInt16 类型不同，所以此处需要UInt16将one转换为UInt16类型的数字

typealias AudioSample = UInt16  // swift 可以给类型起别名
var maxaAmplitudeFound = AudioSample.min    // 0

let http404Error = (404, "Not Found") // 元组， 可以 http404Error.0 访问第一个元素
print(http404Error.0)

let (statusCode, statusMesage) = http404Error   // 可以通过这样的方法取出http404Eroor信息
print(".0:\(statusCode)  .1:\(statusMesage)")

let (justTheStatusCode, _) = http404Error   // 使用_忽略后边的参数
print("statusCode : \(justTheStatusCode)")

let http200Status = (statusCode: 200, description: "OK")
print("The status code is \(http200Status.statusCode)") // 可以通过参数名statusCode来取值

let possibleNubmer = "123"
let convertedNubmer = Int(possibleNubmer)

// 此时convertedNumber 为Int？或者optional Int类型
let convertedNumber2 = Int("hello") // 此时convertedNumber2为optional类型 不能将"hello" 转换为 Int类型，此时convertedNumber2 就会变为nil

var serverResponseCode: Int = 404
//serverResponseCode = nil  // nil 不能用于非可选的常量和变量

// nil 在Objective-C 中是一个指向不存在对象的指针
var surveyAnswer: String?   // nil在Swift中 表示 一个确定的值， 用来表示 值缺失
print("surveyAnswer : \(surveyAnswer)")

let possibleString: String? = "An optional string."
//print(possibleString)  // Optional("An optional string.")
print(possibleString!)  // An optional string. 对于String？类型，使用！来取possibleString的值

var possibleString2: String?
// print(possibleString2!)   // String? 类型possibleString2 没值时使用 possibleString2！取值会报运行时错误

// 使用 String! 来声明一个 隐式可选类型
let assumedString: String! = "An implicitly unwrapped optional string."
print(assumedString) // 对于String！类型，使用assumedString 即可取得值

/*
 如果一个变量之后可能变成nil的话不要使用隐式可选类型
 如果你需要在变量的生命周期中国判断是否是nil的话，请使用普通可选类型
 */

var age = -3

age = 5

assert(age >= 0)    // age在后边的代码中必须 >= 0 才能继续否则报错
