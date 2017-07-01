//: Playground - noun: a place where people can play

import AppKit
import Atoll
import Accelerate

let listA: DoubleList = [0,1,2,3,4,5,6,7,8,9]
let listB: DoubleList = [0,1,2,3,4,5,6,7,8,9]
let listC: FloatList = [0,1,2,3,4,5,6,7,8,9]

listA + listB
listA - listB
listA * listB
listA / listB

pow(listA, listB)

withUnsafeMutablePointers(to: listA, and: listB) { (a, b) in
    print(a, b)
}

mod(listA, listB)
mean(listA)
mean(listC)
