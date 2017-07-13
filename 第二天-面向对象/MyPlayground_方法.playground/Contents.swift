//: Playground - noun: a place where people can play

import UIKit

//方法是一个类/结构体/枚举关联的函数，分为实例方法和类型方法


//实例方法: 定义和使用与函数类似。 self属性: 引用实例自身，通常可以不写

enum 怪物经验表: Int {
    case 骷髅 = 80, 掷斧骷髅 = 100, 骷髅教主 = 300
}

struct 服务器经验倍数 {
    var 开启 = false
    var 倍数 = 1
}

class 人民币玩家 {
    var 经验值 = 0
    var 经验倍数 = 服务器经验倍数()
    
    func 挂机经验() {
        经验值 += 500
        print("挂机成功一次! 经验为\(经验值)")
    }
    
    func 打怪经验(怪物: 怪物经验表, 经验倍数: Int) {
        let 怪物经验值 = 怪物.rawValue
        
        self.经验值 += (怪物经验值 * 经验倍数)
        
        if self.经验倍数.开启 && self.经验倍数.倍数 > 1 {
            经验值 *= self.经验倍数.倍数
        }
        print("当前打怪经验值是\(self.经验值)")
    }
}

var curtis = 人民币玩家()
curtis.挂机经验()
curtis.打怪经验(怪物: 怪物经验表.骷髅教主, 经验倍数: 3)

curtis.经验倍数.开启 = true
curtis.经验倍数.倍数 = 10
curtis.打怪经验(怪物: 怪物经验表.掷斧骷髅, 经验倍数: 3)


//结构体/枚举实例默认不可改变属性值 若需要修改，须加上mutating关键字

struct 角色坐标 {
    var x = 0, y = 0
    
    mutating func 安全区坐标(x: Int, y: Int) {
        self.x = x
        self.y = y
        print("当前已回到安全区，坐标是\(self.x), \(self.y)")
    }
}

var curtis的坐标 = 角色坐标()
curtis的坐标.安全区坐标(x: 888, y: 999)

enum 猜拳 {
    case 石头, 剪刀, 布
    
    static let game = "猜拳"
    
    mutating func 开始() {
        print("我出的是\(self)")
        
        switch self {
        case .剪刀:
            self = 猜拳.石头
        case .石头:
            self = 猜拳.布
        case .布:
            self = 猜拳.剪刀
        }
    }
}

var curtis2 = 猜拳.剪刀
curtis2.开始()
print(curtis2)

/********************************************************/

//类型方法: 属性类型本身，无需实例化就可以使用
//对于类，加关键字class，可被子类重写(override)

class 玩家 {
    static var 姓名 = "curtis"
    class func 服务器名() {
        print("\(姓名),您在北京联通一区")
    }
}

class 上海服务器玩家: 玩家 {
    override class func 服务器名() {
        print("\(姓名), 您现在上海电信2区")
    }
}

let 土豪玩家1 = 上海服务器玩家()
let a: String = "a"
上海服务器玩家.服务器名()
玩家.服务器名()

/********************************************************/

//结构体和枚举，关键字static

struct 复活 {
    static var hp = 100
    static func 复活点(当前区域: String) {
        print("您在\(当前区域)复活，hp是\(hp)")
    }
}

复活.复活点(当前区域: "战后安全区")

