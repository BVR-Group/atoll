//
//  List+Operations.swift
//  Atoll
//
//  Created by Dylan Wreggelsworth on 6/20/17.
//  Copyright © 2017 BVR, LLC. All rights reserved.
//

import Foundation
import Accelerate

public func pow(_ x: DoubleList, _ y: DoubleList) -> DoubleList {
    let result = DoubleList(repeating: 0, count: x.count)
    vvpow(result.pointer, x.pointer, y.pointer, [Int32(result.count)])
    return result
}
