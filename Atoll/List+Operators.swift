//
//  List+Operators.swift
//  Atoll-macOS
//
//  Created by Dylan Wreggelsworth on 6/15/17.
//  Copyright © 2017 BVR, LLC. All rights reserved.
//

import Accelerate

public func +(lhs: DoubleList, rhs: DoubleList) -> DoubleList {
    let result = DoubleList(repeating: 0, count: lhs.count)
    vDSP_vaddD(lhs.storage, 1, rhs.storage, 1, result.storage, 1, vDSP_Length(lhs.count))
    return result
}

public func +(lhs: FloatList, rhs: FloatList) -> FloatList {
    let result = FloatList(repeating: 0, count: lhs.count)
    vDSP_vadd(lhs.storage, 1, rhs.storage, 1, result.storage, 1, vDSP_Length(lhs.count))
    return result
}

