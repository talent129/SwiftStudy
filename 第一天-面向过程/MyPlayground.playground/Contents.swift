//: Playground - noun: a place where people can play

import UIKit

//Hello World
print("Hello World! 世界你好")
print("👦👦")

//常量 使用let关键字 多使用常量  若不知道是常量还是变量 用常量
let 女朋友数量 = 1

let 工资 = 5000

//定义了一个圆周率
let π = 3.14

//变量 使用var关键字
var 课程名 = "Swift 3.0"

课程名 = "4.0"

//Int 和类型判断
var 今天跑了多少 = 5

今天跑了多少 = 6

//布尔  只有true 和 false
var da = true

//元组(Tuple): 定义变量的一个组合

//形式(一般): (3, "天", "Swift", "3.0")
//形式(前缀): (day: 3, unit: "天", lang: "Swift", ver: "3.0")

var x = 1
var y = 2
var z = 3

var 向量 = (x, y, z)


x
y
z

//可通过下标获取元素
向量.0

//也可通过变量名获取元素
var 课程 = (day: 3, unit: "天", lang: "Swift", ver: "3.0")
课程.day


//可选类型(Optional): 代表变量可能有值的情况

//形式: var 变量 : 类型? 默认是无值nil

var address : String?
address = "南京"


var addr : String? = "南京栖霞区"

//基础操作符 操作几个对象就是几元操作符

//一元操作符
-6

//二元操作符
3 + 6

"字符串"

//空
var a = ""

//空格 不为空
var b = " "


a.isEmpty

b.isEmpty


if a.isEmpty {
    print("为空")
}else {
    print("不为空")
}

//字符
var aa : Character = "我"

//可以对一个字符串的character属性进行循环，来访问其中单个字符
let words = "好好学习 天天向上"

for word in words.characters {
    print(word)
}

//连接字符串和字符
//用+
let str1 = "学习"
let str2 = "Swift"
let str3 = "加油"

var string = str1 + str2 + str3


//向字符串添加字符 用append方法
let number : Character = "1"

string.append(number)


//字符串插值: 组合常量/变量/字面量/表达式成一个长字符串

let name = "冰c"
let type = "G"
let num = 2
let price = 120

let 订票提示 = "\(name)先生，您订购了\(type)\(num)的往返票，需支付\(price * 2)元"

//集合类型: 一组同一类型的值的组合，根据组合的整体特性分为:
//有序可重复--数组(Array)
//无序不重复--集合(Set)
//无序可重复，但每一个值有唯一的键(key)--字典(Dictionary)

let array : [Int]

//创建一个有默认值得数组
array = [Int](repeatElement(3, count: 10))

//创建一个有序范围的Int数组

let array2 = Array(1...10)

//用数组字面量来创建数组: [值1， 值2， 值3...，值N]
var places = ["beijing", "shanghai", "nanjing", "hangzhou"]

//元素计数: count  是否为空: isEmpty

places.count
places.isEmpty

//添加 append  一个同类型的元素
places.append("shenzhen")

let otherPlaces = ["NewYork", "Paris", "London"]

//添加数组  同类型数组
places += otherPlaces

places.count

//获取元素
places[5]

//插入 insert
places.insert("Toronto", at: 4)

//删除 remove
places.remove(at: 3)

//集合: 值无序不重复，适合存储具有唯一性的数据，如身份证号码
//定义: Set<元素类型> 无法使用类型推断 但可省略类型
let set : Set = [1, 2, 3, 4]//无序

//用数组字面量创建集合
var cities : Set = ["beijing", "shanghai", "nanjing"]

//元素计数 : count, 是否为空: isEmpty
cities.count
cities.isEmpty

//插入insert
cities.insert("shenzhen")

//删除  remove
cities.remove("shanghai")

//是否包含某元素
cities.contains("beijing")

cities.contains("guangzhou")

//转换为数组
let citiesArray = cities.sorted()

//集合间的运算


//交集
var set1 : Set = [2, 3, 5, 6]
let set2 : Set = [2, 5, 8, 26]

set1.intersection(set2)

//差集
set1.subtract(set2)


//并集
set1.union(set2)

//补集
set1.symmetricDifference(set2)

//集合间的关系

//相等
let set3 : Set = [1, 2, 3]
let set4 : Set = [3, 2, 1, 5]

set3 == set4

//子集
//isSubset(可以相等)， 严格子集: isStrictSubset
set3.isSubset(of: set4)
set3.isStrictSubset(of: set4)

//父集: isSuperset (可以相等) 严格父集: isStrictSuperSetOf
set4.isSuperset(of: set3)
set4.isStrictSuperset(of: set3)


//无交集 isDisjoint
let set5 : Set = ["游戏", "动漫"]
let set6 : Set = ["台球", "购物"]

set5.isDisjoint(with: set6)


//字典 值无序可重复  键值对
//定义: Dictionary<键类型, 值类型> 或 [键类型 : 值类型]

//用字典字面量来创建字典 键与值之间用冒号隔开
var dic1 = ["name" : "cai", "sex" : "man", "addr" : "nanjing"]

//计数 count  是否为空: isEmpty

dic1.count
dic1.isEmpty

//添加或更新   字典变量[key] = 值
dic1["addr"] = "南京"
dic1["height"] = "175"

dic1


//获取  依然可以用下标
dic1["name"]

//移除， 用下标把值设为nil
dic1["addr"] = nil

dic1

//循环一个字典for in, 因为键值对有两个元素 可以用元组
for (key, value) in dic1 {
    print(key, value)
}


//单独使用其中键或值，使用keys或values(可使用for in)
for key in dic1.keys {
    print(key)
}

for value in dic1.values {
    print(value)
}

//把键值对分离成数组，[数组类型](字典变量.keys)  [数组类型](字典变量.values)

let codes = [String](dic1.keys)

let values = [String](dic1.values)
