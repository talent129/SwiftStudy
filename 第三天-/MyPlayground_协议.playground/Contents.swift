//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

// 协议: 方法、属性或一段功能的蓝本
// 协议可被类、结构体和枚举"领养"从而"长大成人"
// 任何满足协议的"需求"的类型，被称为"遵从"该协议

protocol 某协议 {
    
}

protocol 另一个协议 {
    
}

// "领养/遵从"若干个协议，用逗号分隔
struct 某个结构体: 某协议, 另一个协议 {
    
}

//超类在协议之前
class 父类 {
    
}

class 子类: 父类, 某协议, 另一个协议 {
    
}

/************************************************************/

// 属性协议: 顾名思义，要求遵从者实现以指定的名称实现属性，但具体实现是实例属性或类型属性并不关心
// 可以指定要求实现getter或getter + setter。属性必须定义为变量，var。

// 实例属性协议
protocol 文件权限 {
    var 读写: Int {get set}
    var 只读: Int {get}
}

//类型属性协议
protocol 直播地址 {
    static var link: String {get}
}

//遵从实例属性协议1
protocol 全名 {
    var 姓: String {get}
    var 名: String {get}
}

struct 学生: 全名 {
    var 姓: String
    var 名: String
}

var 学生1 = 学生(姓: "lucky", 名: "coder")
学生1.名
学生1.姓

//遵从实例属性协议2

class 人物: 全名 {
    var 名头: String?
    var 人物名: String
    
    init(名头: String?, 人物名: String) {
        self.名头 = 名头
        self.人物名 = 人物名
    }
    
    var 姓: String {
        return 名头 ?? ""
    }
    
    var 名: String {
        return 人物名
    }
}

var 人物1 = 人物(名头: "战神", 人物名: "luckycoder")
人物1.姓
人物1.名

/************************************************************/

//方法协议: 定义时没有花括号执行体，实现仅要求名称相同
//类型方法协议: 前缀总是static
protocol 某protocol {
    static func 一个类型方法()
}

class 某class: 某protocol {
    class func 一个类型方法() {
        print("可override的类型方法实现")
    }
}

某class.一个类型方法()

class 另一个class: 某protocol {
    static func 一个类型方法() {
        print("不可ovverride的类型方法实现")
    }
}

另一个class.一个类型方法()

//实例方法协议
protocol 产生随机数的协议 {
    func 随机方法() -> Int
}

//产生随机整数的函数 arc4random 需要引用基础库
import Foundation

struct 随机体: 产生随机数的协议 {
    func 随机方法() -> Int {
        return Int(arc4random())
    }
}

let 随机体1 = 随机体()
随机体1.随机方法()

//结构体/枚举的"变异方法协议"
protocol 开关协议 {
    mutating func 切换状态()
}

enum 开关枚举: 开关协议 {
    case 开,关
    
    mutating func 切换状态() {
        switch self {
        case .关:
            self = .开
        case .开:
            self = .关
        }
    }
}


var 门 = 开关枚举.关
门.切换状态()
门.切换状态()


/************************************************************/

//构造方法协议: 可以要求遵从者实现指定的构造方法
//实现时用required init，编译器会提示添加。无须手动添加required

protocol 带参数的构造方法协议 {
    init(某参数: Int)
}

class 某类: 带参数的构造方法协议 {
    required init(某参数: Int) {
        
    }
}

//如果子类与父类同时遵从某构造方法协议，则子类构造方法须加override required
protocol 构造方法协议 {
    init()
}

class 父类_ {
    init() {
        
    }
}


class 子类_: 父类_, 构造方法协议 {
    override required init() {
        
    }
}

/************************************************************/


//协议作为类型使用: 可用于参数类型/返回类型；变量/常量/属性；集合类型中的元素类型

protocol 产生随机数的协议_ {
    func 随机方法_() -> Int
}

import Foundation
struct 随机体_: 产生随机数的协议_ {
    func 随机方法_() -> Int {
        return Int(arc4random())
    }
}

struct 骰子 {
    let 边: Int
    let 随机生成器: 产生随机数的协议_
    
    func 掷() -> Int {
        return 随机生成器.随机方法_() % 边 + 1
    }
}

let 一颗骰子 = 骰子(边: 6, 随机生成器: 随机体_())

for _ in 1...30 {
    print(一颗骰子.掷())
}

/************************************************************/

//协议作为代理: 代理是一种常见的设计模式，可以让类或结构体把一部分职责，指派给非同类的实例去承担。
//若要寻求代理，可以通过定义一个协议，打包给要实现的职责于其中
//该代理协议的遵从者就可以实现这些打包的职责
//代理在iOS开发中，一般可以用于响应特定的操作，或从外部数据源取回数据但无需了解是何种数据源

//游戏角色
struct Role {
    var name: String
    var attack: Int
    var defence: Int
}

//玩游戏
protocol Lolgame {
    var role: Role {get}
    mutating func play()
}

//游戏代练协议
protocol LolgameDelegate {
    func gameStart(game: Lolgame) -> Int
    func gameRolePK(game: Lolgame, armed: Bool) -> Int
    func gameOver(game: Lolgame) -> Int
}

//实现游戏代练
struct GameAgent: LolgameDelegate {
    func gameStart(game: Lolgame) -> Int {
        print(game.role.name, "开始打怪升级", "起始经验: 2000")
        return 2000
    }
    
    func gameRolePK(game: Lolgame, armed: Bool) -> Int {
        if armed {
            print(game.role.name, "您有武器，获得经验: 5000")
            return 5000
        }else {
            print(game.role.name, "您赤手空拳， 只获得经验: 2500, 有武器加倍呃")
            return 2500
        }
    }
    
    func gameOver(game: Lolgame) -> Int {
        print(game.role.name, "您已经正常退出，获得经验1000")
        return 1000
    }
}

struct PlayGame: Lolgame {
    var exp: Int
    var gameAgent: GameAgent?
    
    let role = Role(name: "战神cc", attack: 2000, defence: 5000)
    
    mutating func play() {
        if let gameAgent = gameAgent {
            print("您使用了代练")
            
            exp += gameAgent.gameStart(game: self)
            exp += gameAgent.gameRolePK(game: self, armed: true)
            exp += gameAgent.gameOver(game: self)
        }else {
            print("没有使用任何代练或挂机，不会自动升级")
        }
        
        
        print("一共经验值是: ", exp)
    }
}


var playgame1 = PlayGame(exp: 0, gameAgent: nil)
playgame1.play()

let agentSmith = GameAgent()

playgame1.gameAgent = agentSmith
playgame1.play()

/************************************************************/

//协议扩展和扩展约束: 既使无源码权限下，给已有的类添加协议
//既存实例会自动遵从添加了的协议

let a = 1
protocol showIntHint {
    func hint() -> String
}

extension Int: showIntHint {
    func hint() -> String {
        return "整数: \(self)"
    }
}

a.hint()
2.hint()


//如果一个类型预遵从了协议，可以直接扩展协议
1.description

struct MyText {
    var text: String
    var description: String {
        return "我的自定义显示: " + text
    }
}

extension MyText: CustomStringConvertible {}

let text1 = MyText(text: "3天学会Swift 3")

print(text1)

//扩展约束: 可以在扩展协议的同时，加上限定条件 where语句

extension showIntHint where Self:
CustomStringConvertible {
    func hint2() -> String {
        return "扩展约束提示, 整数: " + self.description
    }
}

1.hint2()

//集合类型 Collection也是一种协议， Iterator.Element指代其中的元素
extension Collection where Iterator.Element : CustomStringConvertible {
    func newDesc() -> String {
        let itemAsText = self.map{$0.description}
        
        return "元素数: \(self.count), 值分别是: " + itemAsText.joined(separator: ",")
    }
}

let 整数组1 = [1, 2, 3]
整数组1.newDesc()

let 名称数组 = [2.3, 6.6, 1.9, 4.4]
名称数组.newDesc()


/************************************************************/
//协议的集合类型: 因为协议可以作为类型使用，可把遵从相同协议的实例放到一个协议类型的数组
let 数组: [CustomStringConvertible] = [1, 2, 3, 4, "文本"]

for 元素 in 数组 {
    print(元素)
}

/************************************************************/

//协议继承和默认实现: 一个协议可以继承若干个协议，并可以在继承基础上增加新需求。与class继承相类似，区别是class不能多重继承。对结构体进行协议扩展，相当于实现了多重继承(面向协议编程)
//继承的多个协议间用逗号分隔

//自定义一个可打印和可预览协议
protocol MyPrintable: CustomStringConvertible, CustomPlaygroundQuickLookable {
    
}

struct MyText_{
    var text: String
}

//提供默认实现: 可以给协议扩展提供一个默认的实现，任何遵从此协议的类型都会获得

extension MyPrintable {
    var description: String {
        return "控制台: 默认描述"
    }
    
    var customPlaygroundQuickLook: PlaygroundQuickLook {
        return PlaygroundQuickLook.text("playground预览: 默认值")
    }
}

extension MyText_: MyPrintable {
    var descriptoin: String {
        return "print时的预览" + self.text
    }
    
    var customPlaygroundQuickLook: PlaygroundQuickLook {
        return PlaygroundQuickLook.text("我的Text快速预览: " + self.text)
    }
}

let text1_ = MyText_(text: "cc")
print(text1_)


/************************************************************/

//类专用协议: 可以把协议限制在class类型(让结构体和枚举无法使用)，加关键字class到协议继承列表的第一位

protocol 一个协议: class, CustomPlaygroundQuickLookable {
    
}

class myText {
    var text = "22"
}

extension myText:一个协议 {
    var customPlaygroundQuickLook: PlaygroundQuickLook {
        return PlaygroundQuickLook.text(self.text)
    }
}


/************************************************************/

//协议组合: 多个协议临时组合在一起的类型。形式: 协议1 & 协议2 & ...

protocol 年龄协议 {
    var 年龄: Int {get}
}

protocol 姓名协议 {
    var 姓名: String {get}
}

struct 学生_: 年龄协议, 姓名协议, CustomPlaygroundQuickLookable {
    var 年龄: Int
    var 姓名: String
    
    var customPlaygroundQuickLook: PlaygroundQuickLook {
        return PlaygroundQuickLook.text(self.姓名 + ": \(self.年龄)岁")
    }
}

//无论传递寿星是何类型 只要遵从年龄和姓名协议即可，参数大大自由化
func 生日祝愿(寿星: 年龄协议 & 姓名协议) {
    print("祝",寿星.姓名, 寿星.年龄, "岁生日快乐!")
}

let 学生1_ = 学生_(年龄: 20, 姓名: "洪荒少女")

生日祝愿(寿星: 学生1_)


/************************************************************/
//协议检查和转换: 使用is和as类型转换操作符来检查协议遵从与否，或转换成特定的协议。

protocol Coder {
    var name: String {get set}
    var updating: String {get}
}

struct AndroidCoder: Coder {
    var name: String
    var updating: String {
        return "安卓程序员学iOS开发"
    }
}

struct DotNotCoder: Coder {
    var name: String
    var updating: String {
        return ".NET程序员学Swift 3"
    }
    
}

struct NewBie {
    var name : String
}

let a_ = AndroidCoder(name: "android")
let d = DotNotCoder(name: "net")
let x = NewBie(name: "cc")

let coders:[Any] = [a_, d, x]
for coder in coders {
    if let coder1 = coder as? Coder {
        print(coder1.updating)
    }else {
        print("你不是程序员! 你会很辛苦的")
    }
    
    if let cc = coder as? NewBie {
        print("你是", cc.name)
    }
}
