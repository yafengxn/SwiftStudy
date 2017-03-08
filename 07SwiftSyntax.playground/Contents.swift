//: Playground - noun: a place where people can play

import UIKit

for i in 0 ... 5 { // i 从 0 ~ 5 的范围, 全闭区间
    print(i)
}

for i in 0 ..< 6 { // 和上边... 等价, 半开半闭区间
    print(i)
}

let names = ["Anna", "Alex", "Brian", "Jack"]
let count = names.count
for i in 0..<count {
    print("第 \(i + 1) 个人叫 \(names[i])")
}


print("hello, " + "world")

var i = 5
// print(++i)    // swift3 不允许使用 ++

var a: String? = nil
var b: String = "world"
var c = a ?? b   // 空合运算符，当a不为空时，使用 a！取值；当a为空时，输出b

// 上式等价于 a != nil ? a! : b  // 当a为非空值，那么值b将不会被估值，这就是所谓的短路求值

let wiseWords = "\"我是要成为海贼王的男人\" - 路飞"
print(wiseWords)
let dollarSign = "\u{24}"
print(dollarSign)
let blackHeat = "\u{2665}"
print(blackHeat)
let sparklingHeart = "\u{1F496}"
print(sparklingHeart)   // print方法自动换行

var variableString = "Horse"
variableString += " and carriage"
let constantString = "Highlander"
//constantString += " and another Highlander"   // constantString 不允许修改

/* 字符串是值类型 */

for chararcter in "Dog!🐩".characters {
    print(chararcter)
}

let yenSign: Character = "￥"

let unusualMenagerie = "Koala, Snail, Penguin, Dromedary"
print("unusualMenagerie has 40 characters")

let multiplier = 3
let message = "\(multiplier) 乘以 2.5 是 \(Double(multiplier) * 2.5)"

let normal = "Could you help me, please?"
let shouty = normal.localizedUppercase

let dogString = "Dog!"
for codeUnit in dogString.utf8 {
    print("\(codeUnit)")
}
print("===============1==================")
for codeUnit in dogString.utf16 {
    print("\(codeUnit)")
}
print("================2=================")
for scalar in dogString.unicodeScalars {
    print("\(scalar)")
}
