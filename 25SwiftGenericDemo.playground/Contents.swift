//: Playground - noun: a place where people can play

import UIKit

//////////////////////////////泛型
//func swapTwoValues<T>( a: inout T, b: inout T) {
//    let temp = a
//    a = b
//    b = temp
//}
//
//var someInt = 3
//var anotherInt = 107
//swap(&someInt, &anotherInt)
//print("\(someInt) \(anotherInt)")
//
//var someString = "Hello"
//var anotherString = "world"
//swap(&someString, &anotherString)
//print("\(someString) \(anotherString)")

//struct Stack<T> {
//    var items = [T]()
//    mutating func push(item: T) {
//        items.append(item)
//    }
//    mutating func pop() -> T {
//        return items.removeLast()
//    }
//}
//
//var stackOfStrings = Stack<String>()
//stackOfStrings.push(item: "uno")
//stackOfStrings.push(item: "dos")
//stackOfStrings.push(item: "tres")
//stackOfStrings.push(item: "cuatro")

//let fromTheTop = stackOfStrings.pop()

// Swift中的字典的键类型必须是可哈希的，也就是，有一种方法使其被唯一的表示

//func findIndex<T: Equatable>(array: [T], valueToFind: T) -> Int? {
//    for (index, value) in array.enumerated() {
//        if value == valueToFind {
//            return index
//        }
//    }
//    return nil
//}
//
//let strings = ["cat", "dog", "llama", "parakeet", "terrapin"]
//if let foundIndex = findIndex(array: strings, valueToFind: "llama") {
//    print("The index of llama is \(foundIndex)")
//}
//
//let doubleIndex = findIndex(array: [3.1415926, 0.1, 0.25], valueToFind: 9.3)
//let stringIndex = findIndex(array: ["Mick", "Malcolm", "Andrea"], valueToFind: "Andrea")

protocol Container {
    associatedtype ItemType
    mutating func append(_ item: ItemType)
    var count: Int { get }
    subscript(i: Int) -> ItemType { get }
}

//struct IntStack: Container {
//    var items = [Int]()
//    mutating func push(item: Int) {
//        items.append(item)
//    }
//    mutating func pop() -> Int {
//        return items.removeLast()
//    }
//    
//    // 遵循Container协议
//    typealias ItemType = Int
//    mutating func append(item: Int) {
//        self.push(item: item)
//    }
//    var count: Int {
//        return items.count
//    }
//    subscript(i: Int) -> Int {
//        return items[i]
//    }
//}

// 使用泛型的Stack，这个的T类型可以append、subscript方法推断而来
struct Stack2<T>: Container {
    var items = [T]()
    mutating func push(item: T) {
        items.append(item)
    }
    mutating func pop() -> T {
        return items.removeLast()
    }
    
    mutating func append(_ item: T) {
        self.push(item: item)
    }
    var count: Int {
        return items.count
    }
    subscript(i: Int) -> T {
        return items[i]
    }
}

extension Array: Container {
}   // Array已经实现了append方法、count属性和通过下标来查找一个元素。这样它已经满足了Container协议是所有内容，所以这里可以通过Extension 遵循Container协议即可将Array当做一个Container来用了

// C1\C2类型 且 C1类型的元素类型和C2类型的元素类型相同，元素类型必须遵守协议Equatable
func allItemsMatch<C1: Container, C2: Container>(someCotainer: C1, anotherContainer: C2) -> Bool where C1.ItemType == C2.ItemType, C1.ItemType: Equatable {
    // 检查两个Container的元素个数是否相同
    if someCotainer.count != anotherContainer.count {
        return false
    }
    
    for i in 0..<someCotainer.count {
        if someCotainer[i] != anotherContainer[i] {
            return false
        }
    }
    
    return true
}

var stackOfStrings2 = Stack2<String>()
stackOfStrings2.push(item: "uno")
stackOfStrings2.push(item: "dos")
stackOfStrings2.push(item: "tres")

/////    为什么会报错 ？？？？？ 当extension Array: Container {} 打开了这句就报错了,后边也没法继续执行  ？？？？ 原因是：Array中实现的append 方法定义为 append(_: ) 而我的container append(_ item: ItemType) 之前的实现没有那个_ 造成append方法不一致，所以会报错 \ 所以务必保持类型一致



var arrayOfStrings = ["uno", "dos", "tres"]

print(stackOfStrings2, arrayOfStrings)

if allItemsMatch(someCotainer: stackOfStrings2, anotherContainer: arrayOfStrings) {
    print("All items match")
} else {
    print("Not all items match")
}



    