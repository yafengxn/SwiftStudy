//: Playground - noun: a place where people can play

import UIKit

//////////////////////////////函数和闭包
func greet(name: String, day: String) -> String {
    return "Hello \(name), today is \(day)."
}
greet(name: "Bob", day: "Tuesday")

func hello(name: String, lunch: String) -> String {
    return "Hello, \(name), I eat \(lunch) this afternoon"
}
hello(name: "Lee", lunch: "noodles")

func calculateStatistics(scores: [Int]) -> (min: Int, max:Int, sum: Int) {
    var min = scores[0]
    var max = scores[0]
    var sum = 0
    
    for score in scores {
        if score > max {
            max = score
        } else if score < min {
            min = score
        }
        sum += score
    }
    
    return (min, max, sum)
}
let statistics = calculateStatistics(scores: [2, 1, 6, 5, 3, 4])
print(statistics.sum)
print(statistics.max)
print(statistics.2)     // 可以通过.后边的索引值取得结果中的值，结果索引从0开始

func sumOf(numbers: Int...) -> Int {
    var sum = 0
    for number in numbers {
        sum += number
    }
    return sum
}
sumOf()
sumOf(numbers: 1, 2, 3)

func averOf(numbers: Int...) -> Float {
    var sum: Float = 0
    for i in 0 ..< numbers.count {
        sum += Float(numbers[i])
    }
    return sum / Float(numbers.count)
}
averOf(numbers: 1, 2, 3)

func returnFifteen() ->Int {
    var y = 10
    func add() {
        y += 5
    }
    add()
    return y
}
returnFifteen()

func makeIncremeter() -> ((Int) -> Int) {
    func addOne(number: Int) -> Int {
        return 1 + number
    }
    return addOne
}

var increment = makeIncremeter()
increment(7)

func hasAnyMatches(list: [Int], condition: (Int) -> Bool) -> Bool {
    for item in list {
        if condition(item) {
            return true
        }
    }
    return false
}
// 子func
func lessThanTen(number: Int) -> Bool {
    return number < 10
}
var numbers = [20, 19, 7, 12]
// 此处将func作为参数传入，用括号将子func的参数括起来, ->之后为 子func的返回值
hasAnyMatches(list: numbers, condition: lessThanTen)

let mappedNumbers = numbers.map({
    (number: Int) -> Int in // 这里使用{}创建一个匿名闭包，in 之前的为 参数 -> 返回值， in之后的是闭包内容
    let result =  3 * number
    return result
})
print(mappedNumbers)

// 写一个闭包，对所有奇数返回0
let oddsNumbers = numbers.map({
    (number: Int) -> Int in
    if (number % 2 == 1) {
        return 0;
    } else {
        return number;
    }
})
print(oddsNumbers)

let mappedNumbers2 = numbers.map({ number in 3 * number })
print(mappedNumbers2)

// 将一个闭包当做一个参数传给numbers.sorted方法，实现按照传入闭包的方法来排序
// 闭包直接跟在() 后边即可
let sortedNumbers = numbers.sorted() { $0 > $1 }
print(sortedNumbers)




