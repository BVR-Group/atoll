//
//  List+Operators.swift
//  Atoll-macOS
//
//  Created by Dylan Wreggelsworth on 6/15/17.
//  Copyright © 2017 BVR, LLC. All rights reserved.
//

import Accelerate

fileprivate let EQUAL_LENGTH_MESSAGE = "Expected Lists of equal length."

public func + (lhs: DoubleList, rhs: DoubleList) -> DoubleList {
    precondition(lhs.count == rhs.count, EQUAL_LENGTH_MESSAGE)
    let result = DoubleList(repeating: 0, count: lhs.count)
    vDSP_vaddD(lhs.pointer, 1, rhs.pointer, 1, result.pointer, 1, vDSP_Length(lhs.count))
    return result
}

public func + (lhs: FloatList, rhs: FloatList) -> FloatList {
    precondition(lhs.count == rhs.count, EQUAL_LENGTH_MESSAGE)
    let result = FloatList(repeating: 0, count: lhs.count)
    vDSP_vadd(lhs.pointer, 1, rhs.pointer, 1, result.pointer, 1, vDSP_Length(lhs.count))
    return result
}

public func - (lhs: DoubleList, rhs: DoubleList) -> DoubleList {
    precondition(lhs.count == rhs.count, EQUAL_LENGTH_MESSAGE)
    let result = DoubleList(repeating: 0, count: lhs.count)
    vDSP_vsubD(lhs.pointer, 1, rhs.pointer, 1, result.pointer, 1, vDSP_Length(lhs.count))
    return result
}

public func - (lhs: FloatList, rhs: FloatList) -> FloatList {
    precondition(lhs.count == rhs.count, EQUAL_LENGTH_MESSAGE)
    let result = FloatList(repeating: 0, count: lhs.count)
    vDSP_vsub(lhs.pointer, 1, rhs.pointer, 1, result.pointer, 1, vDSP_Length(lhs.count))
    return result
}

public func * (lhs: DoubleList, rhs: DoubleList) -> DoubleList {
    precondition(lhs.count == rhs.count, EQUAL_LENGTH_MESSAGE)
    let result = DoubleList(repeating: 0, count: lhs.count)
    vDSP_vmulD(lhs.pointer, 1, rhs.pointer, 1, result.pointer, 1, vDSP_Length(lhs.count))
    return result
}

public func * (lhs: FloatList, rhs: FloatList) -> FloatList {
    precondition(lhs.count == rhs.count, EQUAL_LENGTH_MESSAGE)
    let result = FloatList(repeating: 0, count: lhs.count)
    vDSP_vmul(lhs.pointer, 1, rhs.pointer, 1, result.pointer, 1, vDSP_Length(lhs.count))
    return result
}

public func / (lhs: DoubleList, rhs: DoubleList) -> DoubleList {
    precondition(lhs.count == rhs.count, EQUAL_LENGTH_MESSAGE)
    let result = DoubleList(repeating: 0, count: lhs.count)
    vDSP_vdivD(lhs.pointer, 1, rhs.pointer, 1, result.pointer, 1, vDSP_Length(lhs.count))
    return result
}

public func / (lhs: FloatList, rhs: FloatList) -> FloatList {
    precondition(lhs.count == rhs.count, EQUAL_LENGTH_MESSAGE)
    let result = FloatList(repeating: 0, count: lhs.count)
    vDSP_vdiv(lhs.pointer, 1, rhs.pointer, 1, result.pointer, 1, vDSP_Length(lhs.count))
    return result
}
