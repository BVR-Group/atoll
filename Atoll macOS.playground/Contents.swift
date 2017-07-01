//: Playground - noun: a place where people can play

import AppKit
import Atoll
import Accelerate

let listA: DoubleList = [.pi,1,2,3,4,5,6,7,8,9]
let listB: DoubleList = [.pi,1,2,3,4,5,6,7,8,9]
let listC: FloatList = [.pi,1,2,3,4,5,6,7,8,9]

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
rootMeanSquare(listA)
meanSquare(listA)
sqrt(listA)
sum(listA)
sum(listC)

add(listA, listB)
min(listA + listB)
