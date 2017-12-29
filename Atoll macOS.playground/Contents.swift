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
var listB: DoubleList = [0,1,2,3,4,5,6,7,8,9]
let listC: FloatList = [0,1,2,3,4,5,6,7,8,9]

let listD = FloatList(with: 0...1, by: .pi/100)
listD.pointer

// Copies the values from D
var listE = FloatList(copyFrom: listD.pointer, count: listD.count)
listE = listE + 2
listE.pointer

// Ds values look good...
listD
listD.pointer

// Makes a new FloatList using Ds memory but this is mutable!...
var listF = FloatList(referencing: listD.pointer, count: listD.count)
listF.pointer
listF = listF * 2 // This will make a new allocation!

// Seems to be corrupt now...
listD

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

var testList: DoubleList = [0,1,2,3,4,5,6,7,8]
sqrtInPlace(testList)
testList


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


exp(listA[5]) == exp(listA)[5]

let newList = listA.mirrored()
listB.mirror()

