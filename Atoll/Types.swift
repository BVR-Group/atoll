//
//  Types.swift
//  Atoll-macOS
//
//  Created by Dylan Wreggelsworth on 6/15/17.
//  Copyright © 2017 BVR, LLC. All rights reserved.
//

import Foundation

public typealias DoubleList = List<Double>
public typealias FloatList = List<Float>

protocol SupportedFloatType {}
extension Double: SupportedFloatType {}
extension Float: SupportedFloatType {}

// sourcery:inline:Operation.stencil
