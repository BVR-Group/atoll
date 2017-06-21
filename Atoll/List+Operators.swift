//
//  List+Operators.swift
//  Atoll-macOS
//
//  Created by Dylan Wreggelsworth on 6/15/17.
//  Copyright © 2017 BVR, LLC. All rights reserved.
//

import Accelerate


fileprivate func checkCount<T>(lhs: List<T>, rhs: List<T>) {
    precondition(lhs.count == rhs.count, "Expected Lists of equal length.")
}

public func + (lhs: DoubleList, rhs: DoubleList) -> DoubleList {
    checkCount(lhs: lhs, rhs: rhs)
    return result(from: lhs) { result in
        vDSP_vaddD(lhs.pointer, 1, rhs.pointer, 1, result, 1, vDSP_Length(lhs.count))
    }
}

public func + (lhs: FloatList, rhs: FloatList) -> FloatList {
    checkCount(lhs: lhs, rhs: rhs)
    return result(from: lhs) { result in
        vDSP_vadd(lhs.pointer, 1, rhs.pointer, 1, result, 1, vDSP_Length(lhs.count))
    }
}

public func - (lhs: DoubleList, rhs: DoubleList) -> DoubleList {
    checkCount(lhs: lhs, rhs: rhs)
    return result(from: lhs) { result in
        vDSP_vsubD(lhs.pointer, 1, rhs.pointer, 1, result, 1, vDSP_Length(lhs.count))
    }
}

public func - (lhs: FloatList, rhs: FloatList) -> FloatList {
    checkCount(lhs: lhs, rhs: rhs)
    return result(from: lhs) { result in
        vDSP_vsub(lhs.pointer, 1, rhs.pointer, 1, result, 1, vDSP_Length(lhs.count))
    }
}

public func * (lhs: DoubleList, rhs: DoubleList) -> DoubleList {
    checkCount(lhs: lhs, rhs: rhs)
    return result(from: lhs) { result in
        vDSP_vmulD(lhs.pointer, 1, rhs.pointer, 1, result, 1, vDSP_Length(lhs.count))
    }
}

public func * (lhs: FloatList, rhs: FloatList) -> FloatList {
    checkCount(lhs: lhs, rhs: rhs)
    return result(from: lhs) { result in
        vDSP_vmul(lhs.pointer, 1, rhs.pointer, 1, result, 1, vDSP_Length(lhs.count))
    }
}

public func / (lhs: DoubleList, rhs: DoubleList) -> DoubleList {
    checkCount(lhs: lhs, rhs: rhs)
    return result(from: lhs) { result in
        vDSP_vdivD(lhs.pointer, 1, rhs.pointer, 1, result, 1, vDSP_Length(lhs.count))
    }
}

public func / (lhs: FloatList, rhs: FloatList) -> FloatList {
    checkCount(lhs: lhs, rhs: rhs)
    return result(from: lhs) { result in
        vDSP_vdiv(lhs.pointer, 1, rhs.pointer, 1, result, 1, vDSP_Length(lhs.count))
    }
}
