//: Playground - noun: a place where people can play

import UIKit

///////////////////////////继承
class Vehicle {
    /*final*/ var currentSpeed = 0.0
    var description: String {
        return "traveling at \(currentSpeed) miles per hour"
    }
    func makeNoise() {
        // 什么也不做，因为车辆不一定有噪音
    }
}

let someVechicle = Vehicle()
print("Vehicle: \(someVechicle.description)")

class Bicycle: Vehicle {
    var hasBascket = false
}

let bicycle = Bicycle()
bicycle.hasBascket = true
bicycle.currentSpeed = 15.0
print("Bicycle: \(bicycle.description)")

class Tandem: Bicycle {
    var currentNumberOfPassengers = 0
}

let tandem = Tandem()
tandem.hasBascket = true
tandem.currentNumberOfPassengers = 2
tandem.currentSpeed = 22.0
print("Tandem: \(tandem.description)")

class Train: Vehicle {
    override func makeNoise() {
         print("Choo choo")
    }
}

let train = Train()
train.makeNoise()

class Car: Vehicle {
    var gear = 1
    override var description: String {  // 通过super.属性值 来获取父类是属性
        return super.description + " in gear \(gear)"
    }
}

let car = Car()
car.currentSpeed = 25.0
car.gear = 3
print("Car: \(car.description)")

// 重写属性观察器
class AutomaticCar: Car {
    override var currentSpeed: Double { // 当speed 属性前添加final之后，这里就会报错，final 作用就是防止属性被重写； final var、final func、final class func、final subscript
        didSet {
            gear = Int(currentSpeed / 10.0) + 1
        }
    }
}
let automaticCar = AutomaticCar()
automaticCar.currentSpeed = 35.0
print("AutomaticCar: \(automaticCar.description)")

/*
 * 在扩展中，添加到类里的方法，属性和下标脚本 可以在扩展的定义里标记为final，防止扩展中的方法被重写
 *
 * 如果final 加在类前面，那么这个类是不能被继承的
 */



