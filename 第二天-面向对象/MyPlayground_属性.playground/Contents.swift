//: Playground - noun: a place where people can play

import UIKit

//属性: 是一个类/结构体/枚举关联的变量
//实例属性: 实例化后才能使用
//存储属性: 保存单个类型的变量

class 角色 {
    var id = ""
    var money = 0
}

let cai = 角色()

cai.id = "才"
cai.money = 5000

//计算属性: 由其他属性计算得出的，由getter和setter组成
//getter: 获取器:描述属性如何计算及返回语句  形式: get{语句和返回}
//setter: 设置器:有新值后(newValue)如何影响其他属性，形式:set{语句}

struct 坐标 {
    var x = 0, y = 0
}

enum 移动方式 {
    case 走
    case 跑
    case 骑
    case 传送
}

class 法师 : 角色 {
    var 人物坐标 = 坐标()
    var 人物移动方式 = 移动方式.走
    
    var 当前坐标 : 坐标 {
        get {
            switch 人物移动方式 {
            case .走:
                人物坐标.x += 1
                人物坐标.y += 1
            case .跑:
                人物坐标.x += 3
                人物坐标.y += 3
            case .骑:
                人物坐标.x += 10
                人物坐标.y += 10
            case .传送:
                人物坐标.x += 1000
                人物坐标.y += 1000
            }
            return 人物坐标
        }
        set {
            人物坐标 = newValue
        }
    }
    
}

var 法师1 = 法师()

法师1.当前坐标

法师1.人物移动方式 = .跑

法师1.当前坐标

法师1.人物移动方式 = .传送

法师1.当前坐标


//计算属性的setter方法 影响其他属性
法师1.当前坐标 = 坐标(x: 2000, y: 90)

法师1.人物坐标



//属性监视器: 对属性值的变化进行响应

//willSet: 事前响应， 新值newValue
//didSet: 事后响应， 旧值oldValue

class 经验 {
    var 总经验 = 0 {
        willSet {
            print("当前总经验是:\(newValue)!")
        }
        didSet {
            print("增加了\(总经验 - oldValue)点经验!")
        }
    }
}

var 经验1 = 经验()
经验1.总经验 = 1000
经验1.总经验 = 3000
经验1.总经验 = 8000

/********************************************************/

//类型属性: 属于类型固有的，实例不能调用
//对于类，计算型的类型属性，前面加关键字class 可被子类重写(override)

class 生命体 {
    class var 遗传方式: String {
        return "RNA"
    }
}

生命体.遗传方式

class Human: 生命体 {
    override class var 遗传方式 : String {
        return "DNA"
    }
}

Human.遗传方式

//结构体和枚举，关键字static
struct 逛街 {
    static let 试衣间 = "UNICIO"
    static let 网站 = "http://www.taobao.com?cate="
    var cate = ""
    
    var shareUrl : String {
        return 逛街.网站 + cate
    }
}

逛街.试衣间

let 逛淘宝 = 逛街(cate: "seafood")

逛淘宝.shareUrl

