//: Playground - noun: a place where people can play

import UIKit

class Person {
    let name: String
    init(name: String) {
        self.name = name
        print("\(name) is being initialized")
    }
    deinit {
        print("\(name) is being deinitialized")
    }
}

var ref1: Person?
var ref2: Person?
var ref3: Person?

ref1 = Person(name: "John Appleaseed")
ref2 = ref1
ref3 = ref1

ref1 = nil
ref2 = nil
ref3 = nil // ref2\ref3也对Person有强引用，当ref1、ref2、ref3对Person的强引用都断开以后Person会被销毁， 打印出“John Appleaseed is being deinitialized”

class Person2 {
    let name: String
    init(name: String) {
        self.name = name
    }
    var apartment: Apartment?
    deinit {
        print("\(name) is being deinitialized")
    }
}

class Apartment {
    let number: Int
    init(number: Int) {
        self.number = number
    }
    weak var tenant: Person2?   // 循环引用还是通过使用weak来断开其中一方的强引用， apartment、tenant都是可选类型，这种情况适合用weak来解决循环应用
    deinit {
        print("Apartment #\(number) is being deinitialized")
    }
}

var john: Person2?
var number73: Apartment?

john = Person2(name: "John Appleseed")
number73 = Apartment(number: 73)

john!.apartment = number73  // ！是用来展开John变量的？？？怎么理解
number73!.tenant = john

john = nil
number73 = nil


class Customer {
    let name: String
    var card: CreditCard?
    init(name: String) {
        self.name = name
    }
    deinit {
        print("\(name) is being deinitialized")
    }
}

class CreditCard {
    let number: Int
    unowned let customer: Customer  // card 可选， customer 不可选 且会有潜在可能性产生强引用 这种情况适合用unowned来解决循环引用
    init(number: Int, customer: Customer) {
        self.number = number
        self.customer = customer
    }
    deinit {
        print("Card #\(number) is being initialized")
    }
}

print("=================================")

var joh: Customer?
joh = Customer(name: "Joh")
joh!.card = CreditCard(number: 1234_5678_9012_3456, customer: joh!)
joh = nil


//class Country {
//    let name: String
//    let capitalCity: City!
//    init(name: String, capitalName: String) {
//        self.name = name
////        self.capitalCity = City(name: capitalName, country: self)//???????
//    }
//}
//
//class City {
//    let name: String
//    unowned let country: Country
//    init(name: String, country: Country) {
//        self.name = name
//        self.country = country
//    }
//}
//
//var country = Country(name: "Canada", capitalName: "Ottawa")
//print("\(country.name)'s capital city is called \(country.capitalCity.name)")
class HTMLELement {
    let name: String
    let text: String?
    
    lazy var asHTML: () -> String = {
        [unowned self] in
        if let text = self.text {   // 闭包中使用self导致循环引用，解决办法：当self可能为nil时使用weak， 不可能为nil时使用unowned
            return "<\(self.name)>\(text)</\(self.name)>"
        } else {
            return "<\(self.name) />"
        }
    }
    
    init(name: String, text: String? = nil) {
        self.name = name
        self.text = text
    }
    
    deinit {
        print("hello : \(name) is being deinitialized")
    }
}

var paragraph: HTMLELement? = HTMLELement(name: "p", text: "Hello, world")
print(paragraph!.asHTML())

paragraph = nil
