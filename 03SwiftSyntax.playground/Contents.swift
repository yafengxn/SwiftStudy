//: Playground - noun: a place where people can play

import UIKit

//////////////////////////对象和类
class Shape {
    var numberOfSides = 0
    func simpleDescription() -> String {
        return "A shape with \(numberOfSides) sides"
    }
    
    let numberOfCars = 10
    func carDescription() -> String {
        return "I have \(numberOfCars) cars"
    }
}

var shape = Shape()
shape.numberOfSides = 7
var shapeDescription = shape.simpleDescription()

class NamedShape {
    var numberOfSides: Int = 0
    var name: String
    
    init(name: String) {
        self.name = name
    }
    
    func simpleDescription() ->String {
        return "A shape with \(numberOfSides) sides."
    }
}

class Square : NamedShape {
    var sideLength: Double
    
    init(sideLength: Double, name: String) {    // 构造方法  也可以写deinit的析构方法
        self.sideLength = sideLength
        super.init(name: name)
        numberOfSides = 4
    }
    
    func area() -> Double {
        return sideLength * sideLength;
    }
    
    override func simpleDescription() -> String {   // 使用override重写simpleDescription
        return "A square with sides of length \(sideLength)"
    }
}

let test = Square(sideLength: 5.2, name: "My test square")
test.area()
test.simpleDescription()

class EquilateralTriangle: NamedShape {
    var sideLength: Double = 0.0
    
    init(sideLength: Double, name: String) {
        self.sideLength = sideLength
        super.init(name: name)
        numberOfSides = 3
    }
    
    // 属性也可以有getter 和 setter
    var perimeter: Double {
        get {
            return 3.0 * sideLength
        }
        set {
            sideLength = newValue / 3.0
        }
    }
    
    override func simpleDescription() -> String {
        return "A equilateral triangle with sides of length \(sideLength)"
    }
}
var triangle = EquilateralTriangle(sideLength: 3.1, name: "a triangle")
print(triangle.perimeter)
triangle.perimeter = 9.9
print(triangle.sideLength)

class TriangleAndSquare {
    var triangle: EquilateralTriangle {
        willSet {   // willSet 方法只有当给 square 变量被赋新值的情况下调用，被赋值的新变量可以自己起名如 newValue
            square.sideLength = newValue.sideLength
        }
    }
    var square: Square {
        willSet {
            triangle.sideLength = newValue.sideLength
        }
    }
    init(size: Double, name: String) {
        square = Square(sideLength: size, name: name)
        triangle = EquilateralTriangle(sideLength: size, name: name)
    }
}

var triangleAndSquare = TriangleAndSquare(size: 10, name: "another test shape")
triangleAndSquare.square.sideLength
triangleAndSquare.triangle.sideLength
triangleAndSquare.square = Square(sideLength: 50, name: "lager square") // 到这一步才会调用willSet
triangleAndSquare.triangle.sideLength

class Counter {
    var count: Int = 0
    func incrementBy(amount: Int, numberOfTimes times: Int) {
        count += amount * times
    }
}
var counter = Counter()
counter.incrementBy(amount: 2, numberOfTimes: 7)
print(counter.count)

// 处理可选变量时，如果？之前的变量是nil，则？后边的操作短路，不会执行，并且整个表达式返回nil
let optionalSquare: Square? = Square(sideLength: 2.5, name: "optional square")
// ?之前的变量不为nil 执行？后边的语句，此处当optionalSquare不为nil是取sideLength成员变量
let sideLength = optionalSquare?.sideLength



