// Generated using Sourcery 0.7.2 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT

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

public func result<T>(from list: List<T>, block: (UnsafeMutablePointer<T>) -> Void) -> T {
    var result: T = 0
    block(&result)
    return result
}

public func result<T>(from list: List<T>, block: (UnsafeMutablePointer<T>) -> Void) -> List<T> {
    let result = List<T>(count: list.count)
    block(result.pointer)
    return result
}

// Doubles

public func pow(_ x: DoubleList, _ y: DoubleList) -> DoubleList {
    return result(from: x) { result in
        vvpow(result, x.pointer, y.pointer, x.countPointer)
    }
}

public func sqrt(_ x: DoubleList) -> Double {
    return result(from: x) { result in
        vvsqrt(result, x.pointer, x.countPointer)
    }
}

public func mod(_ x: DoubleList, _ y: DoubleList) -> DoubleList {
    return result(from: x) { result in
        vvfmod(result, x.pointer, y.pointer, x.countPointer)
    }
}

public func rootMeanSquare(_ x: DoubleList) -> Double {
    return result(from: x) { result in
        vDSP_rmsqvD(x.pointer, 1, result, x.vDSP_Length)
    }
}

public func meanSquare(_ x: DoubleList) -> Double {
    return result(from: x) { result in
        vDSP_measqvD(x.pointer, 1, result, x.vDSP_Length)
    }
}

public func mean(_ x: DoubleList) -> Double {
    return result(from: x) { result in
        vDSP_meanvD(x.pointer, 1, result, x.vDSP_Length)
    }
}

public func meanMagnitude(_ x: DoubleList) -> Double {
    return result(from: x) { result in
        vDSP_meamgvD(x.pointer, 1, result, x.vDSP_Length)
    }
}

public func min(_ x: DoubleList) -> Double {
    return result(from: x) { result in
        vDSP_minvD(x.pointer, 1, result, x.vDSP_Length)
    }
}

public func max(_ x: DoubleList) -> Double {
    return result(from: x) { result in
        vDSP_maxvD(x.pointer, 1, result, x.vDSP_Length)
    }
}

public func abs(_ x: DoubleList) -> DoubleList {
    return result(from: x) { result in
        vDSP_vabsD(x.pointer, 1, result, 1, x.vDSP_Length)
    }
}

// Floats

public func pow(_ x: FloatList, _ y: FloatList) -> FloatList {
    return result(from: x) { result in
        vvpowf(result, x.pointer, y.pointer, x.countPointer)
    }
}

public func sqrt(_ x: FloatList) -> Float {
    return result(from: x) { result in
        vvsqrtf(result, x.pointer, x.countPointer)
    }
}

public func mod(_ x: FloatList, _ y: FloatList) -> FloatList {
    return result(from: x) { result in
        vvfmodf(result, x.pointer, y.pointer, x.countPointer)
    }
}

public func rootMeanSquare(_ x: FloatList) -> Float {
    return result(from: x) { result in
        vDSP_rmsqv(x.pointer, 1, result, x.vDSP_Length)
    }
}

public func meanSquare(_ x: FloatList) -> Float {
    return result(from: x) { result in
        vDSP_measqv(x.pointer, 1, result, x.vDSP_Length)
    }
}

public func mean(_ x: FloatList) -> Float {
    return result(from: x) { result in
        vDSP_meanv(x.pointer, 1, result, x.vDSP_Length)
    }
}

public func meanMagnitude(_ x: FloatList) -> Float {
    return result(from: x) { result in
        vDSP_meamgv(x.pointer, 1, result, x.vDSP_Length)
    }
}

public func min(_ x: FloatList) -> Float {
    return result(from: x) { result in
        vDSP_minv(x.pointer, 1, result, x.vDSP_Length)
    }
}

public func max(_ x: FloatList) -> Float {
    return result(from: x) { result in
        vDSP_maxv(x.pointer, 1, result, x.vDSP_Length)
    }
}

public func abs(_ x: FloatList) -> FloatList {
    return result(from: x) { result in
        vDSP_vabs(x.pointer, 1, result, 1, x.vDSP_Length)
    }
}
