//: Playground - noun: a place where people can play

import UIKit

//继承: class之间的"父子"关系的提现。
//子类可以继承父类的属性和方法

class Vehicle {
    var speed = 0
    var desc: String {
        return "时速是\(speed)km/h"
    }
    func makeNoise() {
        
    }
}

class Bike: Vehicle {
    var hasBasket = false
}

let aBike = Bike()
aBike.speed = 30

aBike.desc
aBike.hasBasket
aBike.makeNoise()

//子类可以根据需要，修改继承来的属性和方法(多态)

class CRH: Vehicle {
    override func makeNoise() {
        print("嘟-嘟-嘟")
    }
}

let acrh = CRH()
acrh.makeNoise()

final class loverBike: Bike {
    var rides = 2
}