//: Playground - noun: a place where people can play

import UIKit

///////////////////////////集合类型
var shoppingList: [String] = ["Eggs", "Milk"]
print("The shopping list contains \(shoppingList.count) items.")

if shoppingList.isEmpty {
    print("The shopping list is empty")
} else {
    print("The shopping list is not empty")
}

shoppingList.append("Flour")

shoppingList += ["Baking Rowder"]
shoppingList += ["Chocolate Spread", "Cheese", "Butter"]

print(shoppingList)

var firstItem = shoppingList[0]
print(firstItem)

shoppingList[0] = "Six eggs"

shoppingList[4...6] = ["Bananas", "Apples"]
shoppingList.insert("Maple Syrup", at: 0)
print(shoppingList)
let mapleSyrup = shoppingList.remove(at: 0)
print(shoppingList)
print(shoppingList[0])

print("=================================")
for item in shoppingList {
    print(item)
}
print("=================================")
for (index, value) in shoppingList.enumerated() {
    print("Item \(String(index+1)): \(value)")
}

var someInts = [Int]()
print("someInts is of type [Int] with \(someInts.count) items.")

someInts.append(3)

someInts = []

var threeDoubles = Array(repeating: 0.0, count: 3)

var anotherThreeDoubles = Array(repeating: 2.5, count: 3)

var sixDoubles = threeDoubles + anotherThreeDoubles

///////////////////////////结合类型
var letters = Set<Character>()
print("letter is of type Set<Character> with 0 items.")

letters.insert("a")

letters = []

var favouriteGenres: Set<String> = ["Rock", "Classical", "Hip hop"]

print("I have \(favouriteGenres.count) favourite music genres. ")

if favouriteGenres.isEmpty {
    print("As far as music goes, I'm not picky.")
} else {
    print("I have particular music perferences.")
}

favouriteGenres.insert("Jazz")

print(favouriteGenres)

if let removeGenre = favouriteGenres.remove("Rock") {
    print("\(removeGenre)? I'm over it. ")
} else {
    print("I never much cared for that. ")
}

if favouriteGenres.contains("Funk") {
    print("I get up on the good foot. ")
} else {
    print("It's too funky in here. ")
}

for genre in favouriteGenres {
    print("\(genre)")
}

for genre in favouriteGenres.sorted() {
    print("\(genre)")
}

// 集合操作
var oddDigits: Set = [1, 3, 5, 7, 9]
let evenDigits: Set = [0, 2, 4, 6, 8]
let singleDigitPrimeNumbers: Set = [2, 3, 5, 7]
oddDigits.union(evenDigits).sorted()
oddDigits.intersection(evenDigits).sorted()
oddDigits.subtracting(singleDigitPrimeNumbers).sorted()
oddDigits.symmetricDifference(singleDigitPrimeNumbers).sorted()


let houseAnimals: Set = ["🐶", "🐱"]
let farmAnimals: Set = ["🐮", "🐔", "🐑", "🐶", "🐱"]
let cityAnimals: Set = ["🐦", "🐭"]
houseAnimals.isSubset(of: farmAnimals)
farmAnimals.isSuperset(of: houseAnimals)
farmAnimals.isDisjoint(with: cityAnimals)


var airports: [String:String] = ["TYO": "Tokyo", "DUB": "Dublin"]
airports["LHR"] = "London"
airports["LHR"] = "London Heathrow" // 修改值

if let oldValue = airports.updateValue("Dublin Internal", forKey: "DUB") {
    print("The old value for DUB was \(oldValue)")
}

airports["APL"] = "Apple Interation"
print(airports)
airports["APL"] = nil   // 当一个元素被赋值nil，就会移除这个key
print(airports)

for (airportCode, airportName) in airports {
    print("\(airportCode): \(airportName)")
}

for airportCode in airports.keys {
    print("Airport code: \(airportCode)")
}

for airportValue in airports.values {
    print("Airport value: \(airportValue)")
}

let airportCodes = Array(airports.keys)
let airportValues = Array(airports.values)

var namesOfIntegers = Dictionary<Int, String>()

// 给常量赋值一个数组、集合或者字典，那它就是不可变的，大小和内容都不能改变.

for index in 1...5 {
    print("\(index) times 5 is \(index * 5)")
}

let base = 3
let power = 10
var answer = 1
for _ in 1...power {
    answer *= base
}
print("\(base) to the power of \(power) is \(answer). ")

let numberOfLegs = ["spider": 8, "ant": 6, "cat": 4]
for (animalName, legCount) in numberOfLegs {
    print("\(animalName)s have \(legCount) legs")
}

for character in "hello".characters {
    print(character)
}

//for var i=0; i<3; ++i {
//    print("i is \(i)")
//}

let anotherCharacter: Character = "a"
switch anotherCharacter {
//case "a": // 不允许这样的写法
case "A":
    print("The letter A")
case "b", "B":    // 一个case可以包含多个模式，用逗号分开
    print("The letter B")
default:
    print("Not the letter A")
}

// 区间匹配
let count = 10
switch count {
case 0:
    print("0")
case 1...9:
    print("1 <= x <=9 ")
case 10...20:
    print("10 <= x <=20 ")
default:
    print("default")
}

let somePoint = (1, 1)
switch somePoint {
case (0, 0):
    print("(0, 0) is at the origin")
case (_, 0):
    print("(\(somePoint.0), 0) is on the x-axis")
case (0, _):
    print("(0, \(somePoint.1)) is on the y-axis")
case (-2...2, -2...2):
    print("(\(somePoint.0), \(somePoint.1)) is inside the box")
default:
    print("(\(somePoint.0), \(somePoint.1)) is outside the box")
}

let yetAnotherPoint = (1, -1)
switch yetAnotherPoint {
case let (x, y) where x == y:
    print("(\(x), \(y)) is on the line x == y")
case let (x, y) where x == -y:
    print("(\(x), \(y)) is on the line x == -y")
case let (x, y):
    print("(\(x), \(y)) is just some arbitrary point")
}

let puzzleInput = "great minds think alike"
var puzzleOutput = ""
for character in puzzleInput.characters {
    switch character {
    case "a", "e", "i", "o", "u", " ":
        continue
    default:
        puzzleOutput.append(character)
    }
}
print(puzzleOutput)

let integerToDescribe = 5
var description = "The number \(integerToDescribe) is"
switch integerToDescribe {
case 2, 3, 5, 7:
    description += " a prime number, and also"
    fallthrough // 使用fallthrough来实现穿透
default:
    description += " an integer. "
}
print(description)

// 可以通过 break label：或者 continue label：实现跳转到label处继续执行语句


