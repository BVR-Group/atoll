//
//  List+Operations.swift
//  Atoll
//
//  Created by Dylan Wreggelsworth on 6/20/17.
//  Copyright © 2017 BVR, LLC. All rights reserved.
//

import Foundation
import Accelerate

public func withUnsafeMutablePointer<T>(
    to a: List<T>,
    block: (UnsafeMutablePointer<T>) -> Void
) {
    block(a.pointer)
}

public func withUnsafeMutablePointers<T>(
    to a: List<T>,
    and b: List<T>,
    block: (UnsafeMutablePointer<T>, UnsafeMutablePointer<T>) -> Void
) {
    block(a.pointer, b.pointer)
}

public func withUnsafeMutablePointers<T>(
    to a: List<T>,
    b: List<T>,
    c: List<T>,
    block: (UnsafeMutablePointer<T>, UnsafeMutablePointer<T>, UnsafeMutablePointer<T>) -> Void
) {
    block(a.pointer, b.pointer, c.pointer)
}

public func result<T>(from list: List<T>, block: (UnsafeMutablePointer<T>) -> Void) -> List<T> {
    let result = List<T>(count: list.count)
    block(result.pointer)
    return result
}

public func pow(_ x: DoubleList, _ y: DoubleList) -> DoubleList {
    return result(from: x) { result in
        vvpow(result, x.pointer, y.pointer, [Int32(x.count)])
    }
}

public func pow(_ x: FloatList, _ y: FloatList) -> FloatList {
    return result(from: x) { result in
        vvpowf(result, x.pointer, y.pointer, [Int32(x.count)])
    }
}
