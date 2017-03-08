//: Playground - noun: a place where people can play

import UIKit

class Person {
    var residence: Residence?
}

class Residence {
    var numberOfRooms = 1
}

let john = Person()
//let roomCount = john.residence!.numberOfRooms // fatal error: unexpectedly found nil while unwrapping an Optional value 不能直接使用！解析一个？的值

//john.residence = Residence() // 这样就不会输出么没有房子了

if let roomCount = john.residence?.numberOfRooms {
    print("John's residence has \(roomCount) rooms.")
} else {
    print("Unable to retrieve the number of rooms.")
}

// 定义个复杂点的Residence2
/*
class Residence {
    var rooms = [Room]()
    var numberOfRooms: Int {
        return rooms.count
    }
    subscript(i: Int) -> Room {
        get {
            return rooms[i]
        }
        set {
            rooms[i] = newValue
        }
        
    }
    func printNubmerOfRooms() {
        print("The number of rooms is \(numberOfRooms)")
    }
    var address: Address?
}

class Room {
    let name: String
    init(name: String) {
        self.name = name
    }
}

class Address {
    var buildingName: String?
    var buildNumber: String?
    var street: String?
    func buildingIdentifier() -> String? {
        if let buildingNumber = buildNumber, let street = street {
            return "\(buildingNumber) \(street)"
        } else if buildingName != nil {
            return buildingName
        } else {
            return nil
        }
    }
}

let joe = Person()
if let roomCount = joe.residence?.numberOfRooms {
    print("John's residence has \(roomCount) rooms.")
} else {
    print("Unable to retrieve the number of rooms.")
}
 */


