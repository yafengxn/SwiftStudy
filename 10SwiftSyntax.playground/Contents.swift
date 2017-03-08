//: Playground - noun: a place where people can play

import UIKit
//////////////////////////////////闭包
/*
 * 闭包的三种形式：
    * 全局函数是一个有名字单不会捕获任何值的闭包
    * 嵌套函数是一个有名字并可以捕获其封闭函数域内值的闭包
    * 闭包表达式是一个利用轻量级语法所写的可以捕获其上下文中变量或常量值的匿名闭包
 */

let names = ["Chris", "Alex", "Ewa", "Barry", "Eaniella"]
func backwards(s1: String, s2: String) -> Bool {
    return s1 > s2
}
var reversed = names.sorted(by: backwards)
// 使用闭包表达式
reversed = names.sorted(by: { (s1: String, s2: String) -> Bool in
    return s1 > s2
})

// 该表达式可以简写为一行
reversed = names.sorted(by: { (s1: String, s2: String) -> Bool in return s1 > s2 })

// 根据上下文推断类型
reversed = names.sorted(by: { s1, s2 in return s1 > s2 })

// 但表达式闭包隐式返回
reversed = names.sorted(by: { s1, s2 in s1 > s2 })

// 参数名称缩写, 可以通过$0, $1 来顺序调用闭包的参数
reversed = names.sorted(by: { $0 > $1 })

// 运算符函数, swift中 定义了>的字符串实现，> 作为一个函数接受两个String类型的参数并返回Bool类型的值；这个刚好与sorted的参数类型符合，因此，可以直接传递一个 > 
reversed = names.sorted(by: > )


// 尾随闭包可以作为函数的最后一个参数，书写在函数括号之后
func someFunctionThatTakesAClosure(closure: () -> ()) {
    // 函数体部分
}

// 以下是不使用尾随闭包进行函数调用
someFunctionThatTakesAClosure(closure: {
    // 闭包主体部分
})

// 以下是使用尾随闭包进行函数调用
someFunctionThatTakesAClosure() {   // 如果函数只需要闭包表达式一个参数，可省略()
    // 闭包主体部分
}

// 上述更可简写为 -> 使用尾随闭包表达式作为函数的唯一参数，此时省略(), 直接跟闭包表达式
reversed = names.sorted { $0 > $1 }


// 将[12, 58k 510]转换为["OneSix", "FiveEight", "FiveOneZero"]
let digitNames = [
    0: "Zero", 1: "One", 2: "Two",   3: "Three", 4: "Four",
    5: "Five", 6: "Six", 7: "Seven", 8: "Eight", 9: "Nine"
]
let numbers = [16, 58, 510]
// map方法只有一个参数(函数类型)，所以可以写成尾随闭包的样子，直接省略()后跟着写一个{}即可
let strings = numbers.map { (number) -> String in   // swift3 不允许声明参数是变量加var，所以只能在尾随闭包中重新定义变量number
    var number = number
    var output = ""
    while number > 0 {
        output = digitNames[number % 10]! + output
        number /= 10
    }
    return output
}

// 闭包中捕获值
func makeIncrementor(forIncrement amount: Int) -> () -> Int {
    var runningTotal = 0
    
    func incrementor() -> Int {
        runningTotal += amount  // 这里捕获了runingTotal
        return runningTotal
    }
    
    return incrementor
}

let incremntByTen = makeIncrementor(forIncrement: 10)
incremntByTen()
incremntByTen()
incremntByTen()

let incrementBySeven = makeIncrementor(forIncrement: 7)
incrementBySeven()  // 这个方法重新捕获一个runningTotal
incremntByTen()     // 这里incremntByTen 返回40，而不是 10，因为incrementByTen 是引用类型一直指向同一个闭包





