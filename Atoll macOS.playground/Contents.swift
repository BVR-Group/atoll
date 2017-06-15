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

list[0...].forEach({ print($0) })



let start = List<Double>(repeating: .pi, count: 20)
let end = List<Float>(repeating: 0, count: 20)

vDSP_vdpsp(start.storage, 1, end.storage, 1, UInt(end.capacity))

for value in end {
    print(value)
}
