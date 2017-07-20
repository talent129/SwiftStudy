//: Playground - noun: a place where people can play

import UIKit

//泛型: Swift中最强大的特性之一，Swift基础库的很多都是基于泛型构建。其实我们从头到尾都在用泛型，强大到你意识不到。

//数组和字典都是泛型集合。可以是Int,String或者任何其他任何类型，无任何类型的限制

//print函数的参数几乎可以是任何东西



//使用泛型前: 打印不同类型的数组
let 文本组 = ["1", "2", "3"]
let 整数组 = [1, 2, 3]
let 小数组 = [1.1, 1.2, 1.3]

func 打印文本组(数组:[String]) {
    for 元素 in 数组 {
        print(元素)
    }
}

func 打印整数组(数组:[Int]) {
    for 元素 in 数组 {
        print(元素)
    }
}

func 打印小数组(数组:[Double]) {
    for 元素 in 数组 {
        print(元素)
    }
}

//泛型函数: 可以用匹配任何类型
//用一个任意名称的占位符，取代原先实际类型.泛型函数名后加<占位符>


//打印任意数组元素
func 打印任意数组元素<类型占位符>(数组: [类型占位符]) {
    for 元素 in 数组 {
        print(元素)
    }
}

打印任意数组元素(数组: [1, 2, 3])
打印任意数组元素(数组: [1.1, 2.3, 3.3])
打印任意数组元素(数组: ["1", "2", "3"])

//Swift标准的交换值函数swap.
var a = 3
var b = -99
swap(&a, &b)
a
b

//类型参数: 上述例子中的占位符，作为取代类型的参数使用.
//类型参数紧跟函数名之后，用尖括号包含，如: <类型占位符>
//一旦定义了类型参数，即可用作定义参数类型/函数返回类型/函数体中做类型标识
//无论何时函数被调用时，类型参数就被实际的类型取代，可以定义任何多类型参数，<占位符1, 占位符2,...>
//命名: 大多数情况下，类型参数名称望文生义即可。比如: Dictionary<Key, Value>,Array<Element>,描述了相互之间或与函数的关系。如无明显的关联，传统上用单个的大写字母，如T,U,V, T代表Type(类型)

func 打印任意数组element<类型占位符>(数组: [类型占位符]) {
    for 元素 in 数组 {
        print(元素)
    }
}

//泛型类型: 可以自定义泛型类型，如适应任何类型参数的类/结构体/枚举等，像数组和字典一样.
//创建一个新泛型类型: Stack(堆).#imageLiteral(resourceName: "pushpop.png")

UIImage(named: "test.jpg")

//草堆使用规则: 先堆完，然后从下抽取(先进先出).计算机中的堆不同的是，后进先出，App中的导航，有进入详情页(push)和返回到上一页(pop).

UIImage(named: "pushpop")

//1. 堆中有3个值
//2. 第4个值是被"压"(push)进堆顶
//3. 堆保持了4个值，最近一个值在堆顶
//4. 堆顶的一项被拿掉(pop)
//5. 移掉后堆中还是3个值

struct IntStack {
    var items = [Int]()
    
    mutating func push(item: Int) {
        items.append(item)
    }
    
    mutating func pop() -> Int {
        return items.removeLast()
    }
}

struct Stack<Element> {
    var items = [Element]()
    
    mutating func push(item: Element) {
        items.append(item)
    }
    
    mutating func pop() -> Element {
        return items.removeLast()
    }
}

var Swift大神 = Stack<String>()
Swift大神.push(item: "芋头")
Swift大神.push(item: "萨神")
Swift大神.push(item: "鸟叔")
Swift大神.push(item: "阳神")
Swift大神.push(item: "cc")

let 菜鸟 = Swift大神.pop()
菜鸟

Swift大神


//泛型约束: 有时候需要泛型在一定的范围内，比如是某个类的子类，或遵从某个协议
//func 某函数<T: 某类, U: 某协议>(某参数: T, 某类型: U) {
//    //函数体
//}

//Equatable协议，顾名思义，可作相等运算的
func 查位置<Element: Equatable>(文本数组:[Element], 待查元素:Element) -> Int? {
    for (索引, 值) in 文本数组.enumerated() {
        if 值 == 待查元素 {
            return 索引 + 1
        }
    }
    return nil
}

查位置(文本数组: ["刘备", "关羽", "张飞", "孔明"], 待查元素: "关羽")

//关联类型: 定义协议时， 有时需要定义一个或多个泛型作辅助，用关键字associatedtype指定

protocol 容器 {
    //提供给遵从此协议的类型使用
    associatedtype ItemType
    
    //可用于方法和属性，推测参数或返回值类型
    mutating func append(_ item: ItemType)
    var count: Int {get}
    subscript(i: Int) -> ItemType {get}
}

struct IntStack__ : 容器 {
    var items = [Int]()
    
    mutating func push(item: Int) {
        items.append(item)
    }
    
    mutating func pop() -> Int {
        return items.removeLast()
    }
    
    mutating func append(_ item: Int) {
        self.push(item: item)
    }
    
    var count: Int {
        return items.count
    }
    
    subscript(i: Int) -> Int {
        return items[i]
    }
}

//Element 自动推测
struct Stack__<Element>: 容器 {
    var items = [Element]()
    
    mutating func push(item: Element) {
        items.append(item)
    }
    
    mutating func pop() -> Element {
        return items.removeLast()
    }
    
    mutating func append(_ item: Element) {
        self.push(item: item)
    }
    
    var count: Int {
        return items.count
    }
    
    subscript(i: Int) -> Element {
        return items[i]
    }
}

//Swift的数组已实现append,count,下标,可以直接遵从容器协议

extension Array: 容器 {}


//关联类型的约束: 对一个关联类型进行协议遵从性或类型一致性检查，在参数列表后紧跟where判断语句

protocol 容器_ {
    //未指定是谁的别名，留给遵从此协议的类型提供
    associatedtype ItemType
    
    //别名也用于方法和属性,推测参数或返回值类型
    mutating func append(_ item: ItemType)
    var count: Int {get}
    subscript(i: Int) -> ItemType {get}
}

func 完全匹配<C1: 容器_, C2: 容器_>(_ 容器1: C1, _ 容器2: C2) -> Bool where C1.ItemType == C2.ItemType, C1.ItemType: Equatable {
    //因为完全匹配算法，只要有一个元素不相等，运算就结束，所以优先筛选出不相等的条件出来
    
    if 容器1.count != 容器2.count {
        return false
    }
    
    for i in 0..<容器1.count where 容器1[i] != 容器2[i] {
        return false
    }
    return true
}

extension Array: 容器_{}

var array1 = [1, 2, 3]
var array2 = [Int]()
array2.append(1)
array2.append(2)
array2.append(3)

完全匹配(array2, array1)

