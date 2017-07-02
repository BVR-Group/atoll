///
///             \    |         | |
///            _ \   __|  _ \  | |
///           ___ \  |   (   | | |
///         _/    _\\__|\___/ _|_|
///
///
///  MIT License | Copyright 2017 BVR, LLC

import Foundation

public typealias DoubleList = List<Double>
public typealias FloatList = List<Float>

public protocol Real: SignedNumeric {
    static func add(_ x: List<Self>, _ y: List<Self>) -> List<Self>
    static func add(_ x: List<Self>, _ y: Self) -> List<Self>
    static func subtract(_ x: List<Self>, _ y: List<Self>) -> List<Self>
    static func subtract(_ x: List<Self>, _ y: Self) -> List<Self>
    static func divide(_ x: List<Self>, _ y: List<Self>) -> List<Self>
    static func divide(_ x: List<Self>, _ y: Self) -> List<Self>
    static func multiply(_ x: List<Self>, _ y: List<Self>) -> List<Self>
    static func multiply(_ x: List<Self>, _ y: Self) -> List<Self>
    static func sum(_ x: List<Self>) -> Self
    static func pow(_ x: List<Self>, _ y: List<Self>) -> List<Self>
    static func sqrt(_ x: List<Self>) -> Self
    static func mod(_ x: List<Self>, _ y: List<Self>) -> List<Self>
    static func rootMeanSquare(_ x: List<Self>) -> Self
    static func meanSquare(_ x: List<Self>) -> Self
    static func mean(_ x: List<Self>) -> Self
    static func meanMagnitude(_ x: List<Self>) -> Self
    static func min(_ x: List<Self>) -> Self
    static func max(_ x: List<Self>) -> Self
    static func abs(_ x: List<Self>) -> List<Self>
    static func log(_ x: List<Self>) -> List<Self>
    static func innerProduct(_ x: List<Self>, _ y: List<Self>) -> Self
}

extension Double: Real {}
extension Float: Real {}
