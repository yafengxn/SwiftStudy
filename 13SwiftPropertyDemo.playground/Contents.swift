//: Playground - noun: a place where people can play

import UIKit

///////////////////////////属性
struct FixedLengthRange {
    var firstValue: Int
    let length: Int
}

var rangeOfThreeItems = FixedLengthRange(firstValue: 0, length: 3)
rangeOfThreeItems.firstValue = 6

let rangeOfFourItems = FixedLengthRange(firstValue: 0, length: 4)
// rangeOfFourItems.firstValue = 5 // rangeOfFourItems 的实例被声明为常量的时候，他的所有属性也就成了常量

class DataImporter {
    /*
     DataImporter 是一个将外部文件中的数据导入的类
     这个类的初始化会消耗不少时间
     */
    
    var fileName = "data.txt"   // 必须将延迟存储属性声明为变量， 使用var关键字，因为属性的值在实例构造完成之前可能无法得到。而常量属性在构造过程完成之前必须要有初始值，因此无法声明成延迟属性。
    // 这里提供数据导入功能
}

class DataManager {
    lazy var importer = DataImporter()
    var data = [String]()
    // 这里提供数据管理功能
}

let manager = DataManager()
manager.data.append("Some data")
manager.data.append("Some more data")
// DataImporter 实例的 importer 属性还没有被创建

print(manager.importer.fileName)    // data.txt

// 计算属性
struct Point {
    var x = 0.0, y = 0.0
}
struct Size {
    var width = 0.0, height = 0.0
}
struct Rect {
    var origin = Point()
    var size = Size()
    var center: Point { // 此处提供一个计算属性center
        get {
            let centerX = origin.x + (size.width / 2)
            let centerY = origin.y + (size.height / 2)
            return Point(x: centerX, y: centerY)
        }
        set(newCenter) { // 如果没有定义表示新值的变量newCenter，则可以使用默认的newValue变量
            origin.x = newCenter.x - (size.width / 2)
            origin.y = newCenter.y - (size.height / 2)
        }
    }
}
var square = Rect(origin: Point(x: 0.0, y: 0.0), size: Size(width: 10.0, height: 10.0))
let initialSquareCenter = square.center
square.center = Point(x: 15.0, y: 15.0)
print("square.origin is now at (\(square.origin.x), \(square.origin.y))")


struct Cuboid {
    var width = 0.0, height = 0.0, depth = 0.0
    var volume: Double {  // 只读计算属性可以省略关键字get
        return width * height * depth
    }
}
let fourByFiveByTwo = Cuboid(width: 4.0, height: 5.0, depth: 2.0)

/*
  * 可以为存储属性、计算属性添加观察器，不能为延迟存储属性添加观察器
  * 也可以通过重载的方式为继承是属性添加观察器
  * 初始化不会调用属性观察器willSet、didSet
 */

class StepCounter {
    var totalSteps: Int = 0 {
        willSet {
            print("About to set totalSteps to \(newValue)")
        }
        didSet {
            print("Added \(totalSteps - oldValue) steps")
        }
    }
}
let stepCounter = StepCounter()
stepCounter.totalSteps = 200
stepCounter.totalSteps = 360
stepCounter.totalSteps = 560

/*
    * 全局的常量和变量都是延迟计算的，跟延迟存储属性类似，不同的地方在于， 全局的常量和变量不需要标记lazy特性
    * 局部范围的常量和变量不会延迟计算
 */

/*
    * 类型属性：必须显示指定默认值，因为类型本身无法在初始化过程中使用构造器给类型属性赋值
    * 语法：在类型中使用static修饰
 */

struct SomeStructure {
    static var storedTypeProperty = "Some Value"
    static var computedTypeProperty: Int {
        return 0
    }
}

enum SomeEnum {
    static var storedTypeProperty = "Some Value"
    static var computedTypeProperty: Int {  // 枚举、结构体中类型属性前面加static，类中类型属性前面加class关键字
        return 0
    }
}

class SomeClass {
    // 类型属性前面加class关键字， 类型方法前面也得加class关键字
    class var computedTypeProperty: Int {
        return 0
    }
}

// 获取类型属性的值使用  类型.类型属性 即可
print(SomeClass.computedTypeProperty)
print(SomeEnum.computedTypeProperty)
print(SomeStructure.computedTypeProperty)
print(SomeStructure.storedTypeProperty)
print(SomeEnum.storedTypeProperty)

struct AudioChannel {
    static let thresholdLevel = 10
    static var maxInputLevelForAllChannels = 0
    var currentLevel: Int = 0 {
        didSet { // 在属性观察器中给属性赋值不会再次调用属性观察器
            if currentLevel > AudioChannel.thresholdLevel {
                currentLevel = AudioChannel.thresholdLevel
            }
            if currentLevel > AudioChannel.maxInputLevelForAllChannels {
                AudioChannel.maxInputLevelForAllChannels = currentLevel
            }
        }
    }
}

var leftChannel = AudioChannel()
var rightChannel = AudioChannel()
leftChannel.currentLevel = 7
print(leftChannel.currentLevel)
print(AudioChannel.maxInputLevelForAllChannels)

rightChannel.currentLevel = 11
print(rightChannel.currentLevel)
print(AudioChannel.maxInputLevelForAllChannels)
