///
///             \    |         | |
///            _ \   __|  _ \  | |
///           ___ \  |   (   | | |
///         _/    _\\__|\___/ _|_|
///
///
///  MIT License | Copyright 2017 BVR, LLC

import AppKit
import Atoll
import Accelerate

let listA: DoubleList = [0,1,2,3,4,5,6,7,8]
let listB: DoubleList = [0,1,2,3,4,5,6,7,8,9]
let listC: FloatList = [0,1,2,3,4,5,6,7,8,9]
let listD = FloatList(with: 0...1, by: .pi/100)
listD.count

listA + listB
listA - listB
listA * listB
listA / listB

pow(listA, listB)

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
innerProduct(listA, listB)
log(listC)
log(listD)
listA + .pi
listA * 2

listA += listB
listA *= .epsilon
listA

dump(exp(listA))
exp(listA[5]) == exp(listA)[5]



//dump(listA)
let newList = listA.mirrored()
dump(newList)
