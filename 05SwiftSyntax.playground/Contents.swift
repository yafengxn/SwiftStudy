//: Playground - noun: a place where people can play

import UIKit

//////////////////////////协议和扩展
protocol ExampleProtocol {
    var simpleDescription: String { get }
    mutating func adjust()
}

// 类、枚举和结构体都可以实现协议
class SimpleClass: ExampleProtocol {
    var simpleDescription: String = "A very simple class"
    var anotherProperty: Int = 69105
    func adjust() {
        simpleDescription += " Now 100% adjusted."
    }
    func hello() {
        print("------- simpleClass ->  hello ------ ")
    }
}
var a = SimpleClass()
a.adjust()
let aDescription = a.simpleDescription

struct simpleStructure: ExampleProtocol {
    var simpleDescription: String = "A simple structure"
    mutating func adjust() {  // mutating用来标记一个会修改结构体的方法，Class中不需要标记任何方法因为类中的方法经常会修改类
        simpleDescription += " (adjusted)"
    }
}
var b = simpleStructure()
b.adjust()
let bDescription = b.simpleDescription

// 枚举实现协议怎么写
//enum SimpleEnum: ExampleProtocol {
//    case simpleDescription: String = "A simple enum"
//    mutating func adjust() {
//        simpleDescription  += " had adjusted"
//    }
//}

// 使用extension来为现有的类型添加功能，如新的方法和参数；
// 可以使用扩展在别处修改定义，甚至从外部库或者框架引入的一个类型，似的这个类型遵循某个协议
extension Int: ExampleProtocol {
    var simpleDescription: String {
        return "The number \(self)"
    }
    mutating func adjust() {
        self += 42
    }
}
var numInt: Int = 10
numInt.adjust()
numInt.simpleDescription


// 练习： 给Double类型写一个扩展，添加absoluteValue功能。
protocol ValueProtocol {
    var simpleDescription: String { get }
    mutating func absoluteValue()
}
extension Double: ValueProtocol {
    var simpleDescription: String {
        return "The number \(self)"
    }
    
    mutating func absoluteValue() {
        self = fabs(self)
    }
}
var doubleVar: Double = -10.0
doubleVar.absoluteValue()
doubleVar.simpleDescription

let protocolValue: ExampleProtocol = a  // 此处ExampleProtocol就是一个类型，变量protocolValue运行时执行simpleClass，类似于父类变量  --> 子类实例
protocolValue.simpleDescription
// protocolValue.hello() 此时protocolValue变量只能调用protocol中的方法，不能调用SimpleClass中的方法
//let value: SimpleClass = SimpleClass(protocolValue)   // 貌似不能进行强转，然后调用hello方法
//value.hello()


/////////////////////////////泛型
//func repeat<ItemType>(item: ItemType, times: Int) -> [ItemType] {
//    var result = [ItemType]()
//    for i in 0 ..<times {
//        result.append(item)
//    }
//    return result
//}
//repeat("knock", 4)

enum OptionalValue<T> {
    case None
    case Some(T)
}
var possibleInteger: OptionalValue<Int> = .None
possibleInteger = .Some(100)


// 这里不是很懂？？？？
//func anyCommonElements <T, U where T: SequenceType, U: SequenceType, T.Generator.Element: Equatable, T.Generator.Element == U.Generator.Element> (lhs: T, rhs: U) -> Bool {
//    for lhsItem in lhs {
//        for rhsItem in rhs {
//            if lhsItem == rhsItem {
//                return true
//            }
//        }
//    }
//    return false
//}
//anyCommonElements([1, 2, 3], [3])
