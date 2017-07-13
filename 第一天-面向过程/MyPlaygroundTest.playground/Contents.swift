//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

//控制流
//用来检查和运算各种条件和逻辑的组合，控制app的运行流向
//循环语句for-in, while
//if和循环控制语句
//早退语句
//退出循环语句break continue
    //break: 结束整个循环 continue: 结束本次循环
//switch

//函数
//定义函数:
//形式: func 函数名(参数1: 类型， 参数2: 类型,...) -> 返回结果的类型 {执行语句}
//调用: var 变量名称 = 函数名(变量1, 变量2...)

//类型要严格匹配

//加法函数
func add(x: Int, y: Int) -> Int {
    return x + y
}

var z = add(x: 3, y: 5)

print(1 + 2)


//参数和返回值

//无参数  无返回值 一般用于执行一系列操作，不需要结果
func  welcome() {
    print("欢迎")
    print("学习")
    print("Swift")
}

welcome()

//多返回值 使用元组

func maxMin() -> (Int, Int) {
    return (Int.min, Int.max)
}

maxMin().0
maxMin().1

//多个参数  参数以 名称 : 类型 列出，多个参数间用逗号分隔

func add_func(x: Int, y: Int, z: Int) -> Int {
    return x + y + z
}

//可以给某个参数以默认值
func add_func2(x: Int, increment: Int = 2) -> Int {
        return x + increment
}


add_func2(x: 3)

add_func2(x: 3, increment: 7)

//函数类型: 包含参数和返回类型的简写形式  可以像普通变量那样使用，一般用于函数式编程

//calcate()具体怎么卖算 要依赖method方法

func calcate(x: Int, y: Int, method:(Int, Int) -> Int) -> Int {
    return method(x, y)
}

func add_c(x: Int, y: Int) -> Int {
    return x + y
}

func mutiply(x: Int, y: Int) -> Int {
    return x * y
}

calcate(x: 3, y: 6, method: add_c)

calcate(x: 5, y: 6, method: mutiply)


//闭包 Closure 是一种函数的简写形式，省去函数名，把参数和返回值放入花括号内
    //无名函数
//闭包表达式
//1.有时候需要更简洁的使用函数的方式
//2.尤其是一个函数的某参数是另一个函数时
//3.这节主要以sort函数为例

var city = ["beijing", "shanghai", "guangzhou", "shenzhen"]

//sort函数用于对数组进行排序 只接受一个函数型参数，描述排序逻辑
var sortedCity = city.sorted()

func daoxu(a: String, b: String) -> Bool {
    return a > b
}

var s = city.sorted(by: daoxu)


//用闭包表达式来改写

var citySort = city.sorted { (a, b) -> Bool in
    return a > b
}


//闭包的自动推断

//参数和返回类型可自动推断，单表达式可以忽略return关键词
var citySorted_ = city.sorted { (a, b) in
    a > b
}

//可使用快捷参数 前缀$，从0开始递增
var city_ = city.sorted{$0 > $1}

city_


//枚举 enumeration
//计数、列举(有限): 详细叙述之意
//非常强大、与switch结合使用

//定义和使用
//给定一个名称，然后把每一种情况列举出来

enum Weather {
    case sunny
    case cloudy
    case rainy
    case snow
    case foggy
}

//使用  点语法
Weather.cloudy

//与switch配合使用，如果变量是枚举值，可省略枚举名
var todayWeather = Weather.sunny

switch todayWeather {
case .sunny:
    print("天气晴朗")
case .cloudy:
    print("多云")
default:
    print("天气状况未知")
}


//附加值: 每一种类型都可附加一个或多个值，形式是元组 

enum 精确天气 {
    case 晴(Int, Int, String)
    case 霾(String, Int)
}

//赋予附加值: 加上元组字面量

let 上海今日天气 = 精确天气.晴(26, 50, "蓝")
let 北京今日天气 = 精确天气.霾("PM10", 100)

//取得附加值: 用switch语句 在case中加上元组变量

switch 北京今日天气 {
case .晴(let i, let j, let m):
    print("紫外线指数:", i ,"晾晒指数:", j, "天蓝程度:", m)
case .霾(let i, let j):
    print("雾霾颗粒类别:", i, "指数:", j)
}

