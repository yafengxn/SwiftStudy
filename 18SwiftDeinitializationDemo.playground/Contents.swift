//: Playground - noun: a place where people can play

import UIKit

struct Bank {
    static var coninsInBank = 10_000
    static func vendCoins(numberOfCoinsToVend: Int) -> Int {
        let numberOfCoinsToVend = min(numberOfCoinsToVend, coninsInBank)
        coninsInBank -= numberOfCoinsToVend
        return numberOfCoinsToVend
    }
    static func receiveCoins(coins: Int) {
        coninsInBank += coins
    }
}

class Player {
    var coinsInPurse:Int
    init(coins: Int) {
        coinsInPurse = Bank.vendCoins(numberOfCoinsToVend: coins)
    }
    func winCoins(coins: Int) {
        coinsInPurse += Bank.vendCoins(numberOfCoinsToVend: coins)
    }
    deinit {
        Bank.receiveCoins(coins: coinsInPurse)
    }
}

var playerOne: Player? = Player(coins: 100)
print("A new player has joined the game with \(playerOne!.coinsInPurse) coins")
print("There are now \(Bank.coninsInBank) coins left in the bank")

playerOne!.winCoins(coins: 2_000)
print("PlayerOne won 2000 coins & now has \(playerOne!.coinsInPurse) coins")
print("The bank now only has \(Bank.coninsInBank) coins left")

playerOne = nil
print("PlayerOne has left the game")
print("The bank now has \(Bank.coninsInBank) coins")

