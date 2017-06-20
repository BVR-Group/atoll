//: Playground - noun: a place where people can play

import AppKit
import Atoll
import Accelerate

var list: List<Double> = [0,1,2,3,4,5]
list[0] = 0
list[1] = 1
list[2] = 2
list[3] = 3
list[4] = 4
list[5] = 5

list.replace(index: 3, with: 128)

let start = List<Double>(repeating: .pi, count: 20)
let end = List<Float>(repeating: .pi, count: 20)

let result = start + start
result.forEach { print($0) }
result.count
print("\n----\n")
let result2 = end + end
result2.forEach { print($0) }
result2.count

let result3 = result2

result2.replace(index: 3, with: 12345)
result3[3]
result3.replace(index: 3, with: 123456)
result2[3]

let copy = result2.copy()
copy.replace(index: 3, with: 1234567)
copy[3]
result3[3]
