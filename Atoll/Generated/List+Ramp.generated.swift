// Generated using Sourcery 0.10.0 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT

///
///             \    |         | |
///            _ \   __|  _ \  | |
///           ___ \  |   (   | | |
///         _/    _\\__|\___/ _|_|
///
///
///  MIT License | Copyright 2017 BVR, LLC

import Accelerate

extension List where Element == Double {
    public init(with range: ClosedRange<Double>, by increment: Double) {
        let n = Int(((range.upperBound - range.lowerBound) / increment))
        var increase = increment
        var from = range.lowerBound
        let result = List<Element>(count: n)
        vDSP_vrampD(&from, &increase, result.pointer, 1, UInt(n))
        self = result
    }
}

extension List where Element == Float {
    public init(with range: ClosedRange<Float>, by increment: Float) {
        let n = Int(((range.upperBound - range.lowerBound) / increment))
        var increase = increment
        var from = range.lowerBound
        let result = List<Element>(count: n)
        vDSP_vramp(&from, &increase, result.pointer, 1, UInt(n))
        self = result
    }
}

