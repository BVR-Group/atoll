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
    static var epsilon: Self { get }

    static func add(_ x: List<Self>, _ y: List<Self>) -> List<Self>
    static func add(_ x: List<Self>, _ y: Self) -> List<Self>
    static func addInPlace(_ x: List<Self>, _ y: List<Self>)
    static func addInPlace(_ x: List<Self>, _ y: Self)

    static func subtract(_ x: List<Self>, _ y: List<Self>) -> List<Self>
    static func subtract(_ x: List<Self>, _ y: Self) -> List<Self>
    static func subtractInPlace(_ x: List<Self>, _ y: List<Self>)
    static func subtractInPlace(_ x: List<Self>, _ y: Self)

    static func divide(_ x: List<Self>, _ y: List<Self>) -> List<Self>
    static func divide(_ x: List<Self>, _ y: Self) -> List<Self>
    static func divideInPlace(_ x: List<Self>, _ y: List<Self>)
    static func divideInPlace(_ x: List<Self>, _ y: Self)

    static func multiply(_ x: List<Self>, _ y: List<Self>) -> List<Self>
    static func multiply(_ x: List<Self>, _ y: Self) -> List<Self>
    static func multiplyInPlace(_ x: List<Self>, _ y: List<Self>)
    static func multiplyInPlace(_ x: List<Self>, _ y: Self)

    static func sum(_ x: List<Self>) -> Self

    static func pow(_ x: List<Self>, _ y: List<Self>) -> List<Self>
//    static func powInPlace(_ x: List<Self>, _ y: List<Self>)

    static func exp(_ x: List<Self>) -> List<Self>

    // static func sqrt(_ x: List<Self>) -> List<Self>
    static func sqrt(_ x: List<Self>) -> Self
//    static func sqrtInPlace(_ x: List<Self>)

    static func mod(_ x: List<Self>, _ y: List<Self>) -> List<Self>
    // static func mod(_ x: List<Self>, _ y: Self) -> List<Self>
    // static func modInPlace(_ x: List<Self>, _ y: List<Self>)
    // static func modInPlace(_ x: List<Self>, _ y: Self)

    static func rootMeanSquare(_ x: List<Self>) -> Self
    static func meanSquare(_ x: List<Self>) -> Self
    static func mean(_ x: List<Self>) -> Self
    static func meanMagnitude(_ x: List<Self>) -> Self
    static func min(_ x: List<Self>) -> Self
    static func max(_ x: List<Self>) -> Self

    static func abs(_ x: List<Self>) -> List<Self>
    // static func absInPlace(_ x: List<Self>, _ y: Self)

    static func log(_ x: List<Self>) -> List<Self>
    // static func logInPlace(_ x: List<Self>, _ y: Self)

    static func innerProduct(_ x: List<Self>, _ y: List<Self>) -> Self
}

extension Double: Real {
    public static var epsilon: Double { return .ulpOfOne }
}
extension Float: Real {
    public static var epsilon: Float { return .ulpOfOne }
}
