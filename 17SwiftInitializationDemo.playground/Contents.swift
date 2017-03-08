//: Playground - noun: a place where people can play

import UIKit

////////////////////构造过程
struct Fahrentheit {
    var temperature: Double
    init() {
        temperature = 32.0
    }
}

var f = Fahrentheit()
print("The default temperature is \(f.temperature)° Fahrenheit")

struct Celsius {
    var temperatureInCelsius: Double = 0.0
    init(fromFahrenheit fahrenheit: Double) {   // 如果没有提供外部参数，编译器默认提供一个与内参一样的外部参数；不想提供外部参数时，可使用_来描述外部参数，这样调用时就可以什么都不写
        temperatureInCelsius = (fahrenheit - 32.0) / 1.8
    }
    init(fromKelvin kelvin: Double) {
        temperatureInCelsius  = kelvin - 273.15
    }
}

let boilingPointOfWater = Celsius(fromFahrenheit: 212.0)
let freezingPointOfWater = Celsius(fromKelvin: 273.15)

struct Color {
    let red, green, blue: Double
    init(red: Double, green: Double, blue: Double) {
        self.red = red
        self.green = green
        self.blue = blue
    }
    init(white: Double) {
        red = white
        green = white
        blue = white
    }
}

let magenta = Color(red: 1.0, green: 0.0, blue: 1.0)
let halfGray = Color(white: 0.5)

//let veryGreen = Color(0.0, 1.0, 0.0) // 当不写参数名称，编译期间报错

class SurveyQuestion {
    var text: String
    var response: String?
    init(text: String) {
        self.text = text
    }
    func ask() {
        print(text)
    }
}
let cheeseQuestion = SurveyQuestion(text: "Do you like cheese?")
cheeseQuestion.ask()
cheeseQuestion.response = "Yes, I do like cheese"

class ShoppingListItem {
    var name: String?
    var quantity = 1
    var purchased = false
}
var item = ShoppingListItem()

struct Size {
    var width = 0.0, height = 0.0
}
let twoByTwo = Size(width: 2.0, height: 2.0)

// 值类型的构造器代理
struct Point {
    var x = 0.0, y = 0.0
}
struct Rect {
    var origin = Point()
    var size = Size()
    init() {}
    init(origin: Point, size: Size) {
        self.origin = origin
        self.size = size
    }
    init(center: Point, size: Size) {
        let originX = center.x - (size.width / 2)
        let originY = center.y - (size.height / 2)
        self.init(origin: Point(x: originX, y: originY), size: size)    // 像struct、Enum这类的值类型，只能内部多提供几个构造器，之间相关调用一下； 这里就是在前边构造一个orgin-size的构造方法；后边构造一个center，size的构造方法，在内部计算出origin，然后调用前面orgin-size构造方法，这样，只要保证origin-size构造方法没问题，那么center-size多半也不会有什么问题
    }
}

/*
 * 两段式构造过程
 * * 1.第一个阶段，每个存储属性通过引入他们的类的构造器来设置初始化值
 * * 2.第二个阶段，给每个类一次机会在新实例准备使用之前进一步定制他们的存储型属性
 */
//init(parameters) {    // 指定构造器
//   //statements
//}
//
//convenience init(parameters){ // 便利构造器
//   //statements
//}
class Food {
    var name: String
    init(name: String) {
        self.name = name
    }
    convenience init() {
        self.init(name:"[Unnamed]")
    }
}
let nameMeat = Food(name: "Bacon")

class RecipeIngredient: Food {
    var quantity: Int
    init(name: String, quantity: Int) {
        self.quantity = quantity
        super.init(name: name)
    }
    override convenience init(name: String) { // 这里指定构造器参数和父类中一样，所以需要使用override标识
        self.init(name: name, quantity: 1)
    }
}

let oneMysteryItem = RecipeIngredient()
let oneBacon = RecipeIngredient(name: "Bacon")
let sixEggs = RecipeIngredient(name: "Eggs", quantity: 6)

class ShoppingListItem2: RecipeIngredient { // 新引入的属性purchased 提供了默认值，且没有定义任何构造器，所以ShoppingItem2将自动继承所有父类中的指定构造器和便利构造器
    var purchased = false
    var description: String {
        var output = "\(quantity) x \(name.localizedLowercase)"
        output += purchased ? " ✅" : " ❎"
        return output
    }
}

var breakfastList = [
    ShoppingListItem2(),
    ShoppingListItem2(name: "Bacon"),
    ShoppingListItem2(name: "Eggs", quantity: 6)
]
breakfastList[0].name = "Orange juice"
breakfastList[0].purchased = true
for item in breakfastList {
    print(item.description)
}

struct Animal {
    let species: String
    init?(species: String) {
        if species.isEmpty { return nil }
        self.species = species
    }
}

let someCreature = Animal(species: "Giraffe")
if let giraffe = someCreature {
    print("An animal was initialized with a species of \(giraffe.species)")
}

let anonymousCreature = Animal(species: "")
if anonymousCreature == nil {
    print("The anonymous creature could not be initialized")
}

//enum TemperatureUnit {
//    case Kelvin, Celsius, Fahrenheit
//    init?(symbol: Character) {  // 这里通过一个switch case来表示更多构造过程中可失败的情况
//        switch symbol {
//        case "K":
//            self = .Kelvin
//        case "C":
//            self = .Celsius
//        case "F":
//            self = .Fahrenheit
//        default:
//            return nil
//        }
//    }
//}
//let fahrenheitUnit = TemperatureUnit(symbol: "F")
//if fahrenheitUnit != nil {
//    print("fahrenheitUnit 初始化成功")
//}
//
//let unknownUnit = TemperatureUnit(symbol: "X")
//if unknownUnit == nil {
//    print("unknownUnit 初始化失败")
//}

enum TemperatureUnit: Character {  // 上面的TemperatureUnit 可改写成这样的形式
    case Kelvin = "K", Celsius = "C", Fahrenheit = "F"
}
let fahrenheitUnit = TemperatureUnit(rawValue: "F")
if fahrenheitUnit != nil {
    print("fahrenheitUnit 初始化成功")
}

let unknownUnit = TemperatureUnit(rawValue: "X")
if unknownUnit == nil {
    print("unknownUnit 初始化失败")
}

class Proudct {
    let name: String!   // name 是一个常量，一般product类构造成功，完全可以放心的使用.name,不用担心没值
    init?(name: String) {
        if name.isEmpty { return nil }
        self.name = name
    }
}
if let bowTie = Proudct(name: "bow tie") {
    print("The product's name is \(bowTie.name)")
}

class CarItem: Proudct {
    let quantity: Int!
    init?(name: String, quantity: Int) {  // 可失败构造器可以代理调用其他的可失败构造器，无论是向上代理还是横向代理，一旦触发了构造失败的行为，整个构造过程就被打断了
        if quantity < 1 { return nil }
        self.quantity = quantity
        super.init(name: name)
    }
}

if let zeroShirts = CarItem(name: "shirt", quantity: 0) { // 当数量大于0 name为空同样构造失败
    print("构造成功")
} else {
    print("数量为0，构造失败")
}


class Document {
    var name: String?
    init() {}
    init?(name: String) {
        if name.isEmpty { return nil }
        self.name = name
    }
}

class AutoNamedDocument: Document {
    override init() {
        super.init()
        self.name = "[Utitled]"
    }
    override init(name: String) {
//        super.init(name: name)    // 一个不可失败构造器不能调用一个可失败构造器
        super.init()
        if name.isEmpty {
            self.name = "[Utitled]"
        } else {
            self.name = name
        }
    }
}

/// The init! Failable Initializer ?????
/*
You typically define a failable initializer that creates an optional instance of the appropriate type by placing a question mark after the init keyword (init?). Alternatively, you can define a failable initializer that creates an implicitly unwrapped optional instance of the appropriate type. Do this by placing an exclamation mark after the init keyword (init!) instead of a question mark.

You can delegate from init? to init! and vice versa, and you can override init? with init! and vice versa. You can also delegate from init to init!, although doing so will trigger an assertion if the init! initializer causes initialization to fail.
*/
class SomeClass {
    required init() {
        // 初始化代码
    }
}
class SomeSubclass: SomeClass {
    // 如果子类继承的构造器能满足必要构造器的需求，则你无需显示的在子类中提供必要构造器的实现????
}


class SomeOtherClass {
    let someProperty: String = {
        // 在这个闭包中给somePropety 创建一个默认值
        // someValue 必须和SomeType（String）类型相同
        return ""
    }() // 这个小括号告诉编译器这个闭包需要立即执行给someProperty赋值； 注意：在闭包中是给这个属性赋值，不能调用其他属性，即使其他属性有默认值也不行；同样，又不能使用隐式的self属性，或调用其他的实例方法
}

struct Checkerboard {
    let boardColors: [Bool] = {
        var temperaryBoard = [Bool]()
        var isBlack = false
        for i in 1...10 {
            for j in 1...10 {
                temperaryBoard.append(isBlack)
                isBlack = !isBlack
            }
        }
        return temperaryBoard
    }()
    func squareIsBlackAtRow(row: Int, column: Int) -> Bool {
        return boardColors[(row * 10) + column]
    }
}

let board = Checkerboard()
print(board.squareIsBlackAtRow(row: 0, column: 1))
print(board.squareIsBlackAtRow(row: 0, column: 2))