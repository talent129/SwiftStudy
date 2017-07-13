//: Playground - noun: a place where people can play

import UIKit

//下标是方法的一种，是访问集合、列表或者序列中的元素的快捷方式。用法:实例名[索引]。可以访问或设置其中元素。下标可以是多维或嵌套的
//嵌套: area[country][province][city][districet][weekly];
//多维: 矩阵[2, 2], 数组[1, 2, 3]

import Foundation

//常见的用法: 字典、数组、集合等
var 数组1 = [1, 2, 3, 55, 6, -9, 0]
数组1[3]

let 字典1 = ["lucky" : 1, "coder" : 2, "cai" : 3]
字典1["cai"]

//通过下标简化调用方法

struct 圆 {
    func 面积(半径: Double) -> Double {
        return Double.pi * pow(半径, 2)
    }
    
    subscript (半径: Double) -> Double {
        return Double.pi * pow(半径, 2)
    }
}

let 圆1 = 圆()
圆1.面积(半径: 3.2)

圆1[3.2]

//多维下标。实现一个二维行列式矩阵

//       第0列  第1列
// 第0行   4     -2        索引：当前列 + 0
// 第1行   9      0        索引：当前列 + 之前所有行列总数（当前行 × 总列数）
//
// 通过变换成Int数组[4, -2, 9, 0]，以索引来访问.⚠️确保数组索引不得越界。

struct Matrix {
    var rows, cols : Int
    var grid : [Int]
    
    init(rows: Int, cols: Int) {
        self.cols = cols;
        self.rows = rows;
        
        grid = Array(repeating: 0, count: rows * cols)
    }
    
    func indexIsValid(row: Int, col: Int) -> Bool {
        return row >= 0 && row < rows && col >= 0 && col < cols
    }
    
    subscript(row: Int, col: Int)   -> Int {
        get {
            assert(indexIsValid(row: row, col: col), "数组索引越界")
            return grid[col + (row * cols)]
        }
        
        set {
            assert(indexIsValid(row: row , col: col), "数组索引越界")
            grid[col + (row * cols)] = newValue
        }
    }
}


var matrix1 = Matrix(rows: 3, cols: 3)
matrix1[0, 0] = 7
matrix1[0, 1] = 5
matrix1[0,2] = -9
matrix1[1,0] = 8
matrix1[1,1] = 9
matrix1[1,2] = 99
matrix1[2,0] = -8
matrix1[2,1] = -9
matrix1[2,2] = -99
matrix1.grid

matrix1[2,2]

