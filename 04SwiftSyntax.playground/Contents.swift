//: Playground - noun: a place where people can play

import UIKit

///////////////////////枚举和结构体
enum Rank: Int {
    case Ace = 1
    case Two, Three, Four, Five, Six, Seven, Eight, Nine, Ten
    case Jack, Queen, King
    func simpleDescription() -> String {  // 枚举中也可以写方法，可以通过 .变量名 来取具体的枚举值，rawValue为此处为数字索引值， 也可指定其他类型
        switch self {
        case .Ace:
            return "ace"
        case .Jack:
            return "jack"
        case .Queen:
            return "queen"
        case .King:
            return "king"
        default:        // default 分支 和默认枚举值配合使用
            return String(self.rawValue)
        }
    }
}
let ace = Rank.Ace     // enum 中给第一个case指定一个默认值，后边的枚举值依次加一
let aceRawValue = ace.rawValue
let enumValue = ace.simpleDescription()
let five = Rank.Five
let enumValue2 = five.simpleDescription()

if let convertedRank = Rank(rawValue: 3) {
    let threeDescription = convertedRank.simpleDescription()
    print("three Description : \(threeDescription)")
}

// 创建一个比较方法，比较2个Rank值
func compare(rank1: Rank, rank2: Rank) -> Bool {
    return rank1.rawValue > rank2.rawValue
}

let bigger = compare(rank1: Rank.Eight, rank2: Rank.Five)


enum Suit {
    case Spades, Hearts, Diamonds, Clubs
    func simpleDescription() -> String {
        switch self {
        case .Spades:
            return "spades"
        case .Hearts:
            return "hearts"
        case .Diamonds:
            return "diamonds"
        case .Clubs:
            return "clubs"
        }
    }
    
    func colorDescription() -> String {
        switch self {
        case .Spades, .Clubs:
            return "black"
        case .Hearts, .Diamonds:
            return "red"
        }
    }
}
let hearts = Suit.Hearts
let heartsDescription = hearts.simpleDescription()

let heartColor = hearts.colorDescription()

struct Card {
    var rank: Rank
    var suit: Suit
    func simpleDescription() -> String {
        return "The \(rank.simpleDescription()) of \(suit.simpleDescription())"
    }
}
let threeOfSpades = Card(rank: .Three, suit: .Spades)
let threeOfSpadesDescription = threeOfSpades.simpleDescription()



enum ServerReponse {
    case Result(String, String) // 枚举成员的实例也可以有实例值，相同枚举成员的实例也可以有不同的实例值，创建枚举成员实例的时候传入即可
    case Error(String)
}
// 实例值和原始值是不同的：枚举成员的原始值对于所有的实例值都是相同的，且你是在定义枚举的时候设置原始值
let success = ServerReponse.Result("6:00 am", "8:09 pm")
let error = ServerReponse.Error("Out of cheese")

switch success {
case let .Result(sunrise, sunset):
    let serverResponse = "Sunrise is at \(sunrise) and sunset is at \(sunset)"
case let .Error(error):
    let serverResponse = "Failure... \(error)"
    
}

