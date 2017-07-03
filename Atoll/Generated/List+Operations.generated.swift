// Generated using Sourcery 0.7.2 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT

///
///             \    |         | |
///            _ \   __|  _ \  | |
///           ___ \  |   (   | | |
///         _/    _\\__|\___/ _|_|
///
///
///  MIT License | Copyright 2017 BVR, LLC

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


extension Double {
    public static func add(_ x: DoubleList, _ y: DoubleList) -> DoubleList {
        return result(from: x) { result in
            vDSP_vaddD(x.pointer, 1, y.pointer, 1, result, 1, x.vDSP_Length)
        }
    }

    public static func add(_ x: DoubleList, _ y: Double) -> DoubleList {
        var value = y
        return result(from: x) { result in
            vDSP_vsaddD(x.pointer, 1, &value, result, 1, x.vDSP_Length)
        }
    }

    public static func addInPlace(_ x: DoubleList, _ y: DoubleList) {
        vDSP_vaddD(x.pointer, 1, y.pointer, 1, x.pointer, 1, x.vDSP_Length)
    }

    public static func addInPlace(_ x: DoubleList, _ y: Double) {
        var value = y
        vDSP_vsaddD(x.pointer, 1, &value, x.pointer, 1, x.vDSP_Length)
    }

    public static func subtract(_ x: DoubleList, _ y: DoubleList) -> DoubleList {
        return result(from: x) { result in
            vDSP_vsubD(x.pointer, 1, y.pointer, 1, result, 1, x.vDSP_Length)
        }
    }

    public static func subtract(_ x: DoubleList, _ y:Double) -> DoubleList {
        var value = -y
        return result(from: x) { result in
            vDSP_vsaddD(x.pointer, 1, &value, result, 1, x.vDSP_Length)
        }
    }

    public static func subtractInPlace(_ x: DoubleList, _ y: DoubleList) {
        vDSP_vsubD(x.pointer, 1, y.pointer, 1, x.pointer, 1, x.vDSP_Length)
    }

    public static func subtractInPlace(_ x: DoubleList, _ y:Double) {
        var value = -y
        vDSP_vsaddD(x.pointer, 1, &value, x.pointer, 1, x.vDSP_Length)
    }

    public static func divide(_ x: DoubleList, _ y:DoubleList) -> DoubleList {
        return result(from: x) { result in
            vDSP_vdivD(x.pointer, 1, y.pointer, 1, result, 1, x.vDSP_Length)
        }
    }

    public static func divide(_ x: DoubleList, _ y:Double) -> DoubleList {
        var value = y
        return result(from: x) { result in
            vDSP_vsdivD(x.pointer, 1, &value, result, 1, x.vDSP_Length)
        }
    }

    public static func divideInPlace(_ x: DoubleList, _ y:DoubleList) {
        vDSP_vdivD(x.pointer, 1, y.pointer, 1, x.pointer, 1, x.vDSP_Length)
    }

    public static func divideInPlace(_ x: DoubleList, _ y:Double) {
        var value = y
        vDSP_vsdivD(x.pointer, 1, &value, x.pointer, 1, x.vDSP_Length)
    }

    public static func multiply(_ x: DoubleList, _ y: DoubleList) -> DoubleList {
        return result(from: x) { result in
            vDSP_vmulD(x.pointer, 1, y.pointer, 1, result, 1, x.vDSP_Length)
        }
    }

    public static func multiply(_ x: DoubleList, _ y: Double) -> DoubleList {
        var value = y
        return result(from: x) { result in
            vDSP_vsmulD(x.pointer, 1, &value, result, 1, x.vDSP_Length)
        }
    }

    public static func multiplyInPlace(_ x: DoubleList, _ y: DoubleList) {
        vDSP_vmulD(x.pointer, 1, y.pointer, 1, x.pointer, 1, x.vDSP_Length)
    }

    public static func multiplyInPlace(_ x: DoubleList, _ y: Double) {
        var value = y
        vDSP_vsmulD(x.pointer, 1, &value, x.pointer, 1, x.vDSP_Length)
    }

    public static func sum(_ x: DoubleList) -> Double {
        return result(from: x) { result in
            vDSP_sveD(x.pointer, 1, result, x.vDSP_Length)
        }
    }

    public static func pow(_ x: DoubleList, _ y: DoubleList) -> DoubleList {
        return result(from: x) { result in
            vvpow(result, x.pointer, y.pointer, x.countPointer)
        }
    }

    public static func powInPlace(_ x: DoubleList, _ y: DoubleList) {
        vvpow(x.pointer, x.pointer, y.pointer, x.countPointer)
    }

    public static func sqrt(_ x: DoubleList) -> Double {
        return result(from: x) { result in
            vvsqrt(result, x.pointer, x.countPointer)
        }
    }

    public static func mod(_ x: DoubleList, _ y: DoubleList) -> DoubleList {
        return result(from: x) { result in
            vvfmod(result, x.pointer, y.pointer, x.countPointer)
        }
    }

    public static func rootMeanSquare(_ x: DoubleList) -> Double {
        return result(from: x) { result in
            vDSP_rmsqvD(x.pointer, 1, result, x.vDSP_Length)
        }
    }

    public static func meanSquare(_ x: DoubleList) -> Double {
        return result(from: x) { result in
            vDSP_measqvD(x.pointer, 1, result, x.vDSP_Length)
        }
    }

    public static func mean(_ x: DoubleList) -> Double {
        return result(from: x) { result in
            vDSP_meanvD(x.pointer, 1, result, x.vDSP_Length)
        }
    }

    public static func meanMagnitude(_ x: DoubleList) -> Double {
        return result(from: x) { result in
            vDSP_meamgvD(x.pointer, 1, result, x.vDSP_Length)
        }
    }

    public static func min(_ x: DoubleList) -> Double {
        return result(from: x) { result in
            vDSP_minvD(x.pointer, 1, result, x.vDSP_Length)
        }
    }

    public static func max(_ x: DoubleList) -> Double {
        return result(from: x) { result in
            vDSP_maxvD(x.pointer, 1, result, x.vDSP_Length)
        }
    }

    public static func abs(_ x: DoubleList) -> DoubleList {
        return result(from: x) { result in
            vDSP_vabsD(x.pointer, 1, result, 1, x.vDSP_Length)
        }
    }

    public static func log(_ x: DoubleList) -> DoubleList {
        return result(from: x) { result in
            vvlog(result, x.pointer, x.countPointer)
        }
    }

    public static func innerProduct(_ x: DoubleList, _ y: DoubleList) -> Double {
        return sum(multiply(x, y))
    }
}

extension Float {
    public static func add(_ x: FloatList, _ y: FloatList) -> FloatList {
        return result(from: x) { result in
            vDSP_vadd(x.pointer, 1, y.pointer, 1, result, 1, x.vDSP_Length)
        }
    }

    public static func add(_ x: FloatList, _ y: Float) -> FloatList {
        var value = y
        return result(from: x) { result in
            vDSP_vsadd(x.pointer, 1, &value, result, 1, x.vDSP_Length)
        }
    }

    public static func addInPlace(_ x: FloatList, _ y: FloatList) {
        vDSP_vadd(x.pointer, 1, y.pointer, 1, x.pointer, 1, x.vDSP_Length)
    }

    public static func addInPlace(_ x: FloatList, _ y: Float) {
        var value = y
        vDSP_vsadd(x.pointer, 1, &value, x.pointer, 1, x.vDSP_Length)
    }

    public static func subtract(_ x: FloatList, _ y: FloatList) -> FloatList {
        return result(from: x) { result in
            vDSP_vsub(x.pointer, 1, y.pointer, 1, result, 1, x.vDSP_Length)
        }
    }

    public static func subtract(_ x: FloatList, _ y:Float) -> FloatList {
        var value = -y
        return result(from: x) { result in
            vDSP_vsadd(x.pointer, 1, &value, result, 1, x.vDSP_Length)
        }
    }

    public static func subtractInPlace(_ x: FloatList, _ y: FloatList) {
        vDSP_vsub(x.pointer, 1, y.pointer, 1, x.pointer, 1, x.vDSP_Length)
    }

    public static func subtractInPlace(_ x: FloatList, _ y:Float) {
        var value = -y
        vDSP_vsadd(x.pointer, 1, &value, x.pointer, 1, x.vDSP_Length)
    }

    public static func divide(_ x: FloatList, _ y:FloatList) -> FloatList {
        return result(from: x) { result in
            vDSP_vdiv(x.pointer, 1, y.pointer, 1, result, 1, x.vDSP_Length)
        }
    }

    public static func divide(_ x: FloatList, _ y:Float) -> FloatList {
        var value = y
        return result(from: x) { result in
            vDSP_vsdiv(x.pointer, 1, &value, result, 1, x.vDSP_Length)
        }
    }

    public static func divideInPlace(_ x: FloatList, _ y:FloatList) {
        vDSP_vdiv(x.pointer, 1, y.pointer, 1, x.pointer, 1, x.vDSP_Length)
    }

    public static func divideInPlace(_ x: FloatList, _ y:Float) {
        var value = y
        vDSP_vsdiv(x.pointer, 1, &value, x.pointer, 1, x.vDSP_Length)
    }

    public static func multiply(_ x: FloatList, _ y: FloatList) -> FloatList {
        return result(from: x) { result in
            vDSP_vmul(x.pointer, 1, y.pointer, 1, result, 1, x.vDSP_Length)
        }
    }

    public static func multiply(_ x: FloatList, _ y: Float) -> FloatList {
        var value = y
        return result(from: x) { result in
            vDSP_vsmul(x.pointer, 1, &value, result, 1, x.vDSP_Length)
        }
    }

    public static func multiplyInPlace(_ x: FloatList, _ y: FloatList) {
        vDSP_vmul(x.pointer, 1, y.pointer, 1, x.pointer, 1, x.vDSP_Length)
    }

    public static func multiplyInPlace(_ x: FloatList, _ y: Float) {
        var value = y
        vDSP_vsmul(x.pointer, 1, &value, x.pointer, 1, x.vDSP_Length)
    }

    public static func sum(_ x: FloatList) -> Float {
        return result(from: x) { result in
            vDSP_sve(x.pointer, 1, result, x.vDSP_Length)
        }
    }

    public static func pow(_ x: FloatList, _ y: FloatList) -> FloatList {
        return result(from: x) { result in
            vvpowf(result, x.pointer, y.pointer, x.countPointer)
        }
    }

    public static func powInPlace(_ x: FloatList, _ y: FloatList) {
        vvpowf(x.pointer, x.pointer, y.pointer, x.countPointer)
    }

    public static func sqrt(_ x: FloatList) -> Float {
        return result(from: x) { result in
            vvsqrtf(result, x.pointer, x.countPointer)
        }
    }

    public static func mod(_ x: FloatList, _ y: FloatList) -> FloatList {
        return result(from: x) { result in
            vvfmodf(result, x.pointer, y.pointer, x.countPointer)
        }
    }

    public static func rootMeanSquare(_ x: FloatList) -> Float {
        return result(from: x) { result in
            vDSP_rmsqv(x.pointer, 1, result, x.vDSP_Length)
        }
    }

    public static func meanSquare(_ x: FloatList) -> Float {
        return result(from: x) { result in
            vDSP_measqv(x.pointer, 1, result, x.vDSP_Length)
        }
    }

    public static func mean(_ x: FloatList) -> Float {
        return result(from: x) { result in
            vDSP_meanv(x.pointer, 1, result, x.vDSP_Length)
        }
    }

    public static func meanMagnitude(_ x: FloatList) -> Float {
        return result(from: x) { result in
            vDSP_meamgv(x.pointer, 1, result, x.vDSP_Length)
        }
    }

    public static func min(_ x: FloatList) -> Float {
        return result(from: x) { result in
            vDSP_minv(x.pointer, 1, result, x.vDSP_Length)
        }
    }

    public static func max(_ x: FloatList) -> Float {
        return result(from: x) { result in
            vDSP_maxv(x.pointer, 1, result, x.vDSP_Length)
        }
    }

    public static func abs(_ x: FloatList) -> FloatList {
        return result(from: x) { result in
            vDSP_vabs(x.pointer, 1, result, 1, x.vDSP_Length)
        }
    }

    public static func log(_ x: FloatList) -> FloatList {
        return result(from: x) { result in
            vvlogf(result, x.pointer, x.countPointer)
        }
    }

    public static func innerProduct(_ x: FloatList, _ y: FloatList) -> Float {
        return sum(multiply(x, y))
    }
}


public func add<T>(_ x: List<T>, _ y: List<T>) -> List<T> {
    return T.add(x, y)
}

public func add<T>(_ x: List<T>, _ y: T) -> List<T> {
    return T.add(x, y)
}

public func addInPlace<T>(_ x: List<T>, _ y: List<T>) {
    T.addInPlace(x, y)
}

public func addInPlace<T>(_ x: List<T>, _ y: T) {
    T.addInPlace(x, y)
}

public func subtract<T>(_ x: List<T>, _ y: List<T>) -> List<T> {
    return T.subtract(x, y)
}

public func subtract<T>(_ x: List<T>, _ y: T) -> List<T> {
    return T.subtract(x, y)
}

public func subtractInPlace<T>(_ x: List<T>, _ y: List<T>) {
    T.subtractInPlace(x, y)
}

public func subtractInPlace<T>(_ x: List<T>, _ y: T) {
    T.subtractInPlace(x, y)
}

public func divide<T>(_ x: List<T>, _ y: List<T>) -> List<T> {
    return T.divide(x, y)
}

public func divide<T>(_ x: List<T>, _ y: T) -> List<T> {
    return T.divide(x, y)
}

public func divideInPlace<T>(_ x: List<T>, _ y: List<T>) {
    T.divideInPlace(x, y)
}

public func divideInPlace<T>(_ x: List<T>, _ y: T) {
    T.divideInPlace(x, y)
}

public func multiply<T>(_ x: List<T>, _ y: List<T>) -> List<T> {
    return T.multiply(x, y)
}

public func multiply<T>(_ x: List<T>, _ y: T) -> List<T> {
    return T.multiply(x, y)
}

public func multiplyInPlace<T>(_ x: List<T>, _ y: List<T>) {
    T.multiplyInPlace(x, y)
}

public func multiplyInPlace<T>(_ x: List<T>, _ y: T) {
    T.multiplyInPlace(x, y)
}

public func sum<T>(_ x: List<T>) -> T {
    return T.sum(x)
}

public func pow<T>(_ x: List<T>, _ y: List<T>) -> List<T> {
    return T.pow(x, y)
}

public func sqrt<T>(_ x: List<T>) -> T {
    return T.sqrt(x)
}

public func mod<T>(_ x: List<T>, _ y: List<T>) -> List<T> {
    return T.mod(x, y)
}

public func rootMeanSquare<T>(_ x: List<T>) -> T {
    return T.rootMeanSquare(x)
}

public func meanSquare<T>(_ x: List<T>) -> T {
    return T.meanSquare(x)
}

public func mean<T>(_ x: List<T>) -> T {
    return T.mean(x)
}

public func meanMagnitude<T>(_ x: List<T>) -> T {
    return T.meanMagnitude(x)
}

public func min<T>(_ x: List<T>) -> T {
    return T.min(x)
}

public func max<T>(_ x: List<T>) -> T {
    return T.max(x)
}

public func abs<T>(_ x: List<T>) -> List<T> {
    return T.abs(x)
}

public func log<T>(_ x: List<T>) -> List<T> {
    return T.log(x)
}

public func innerProduct<T>(_ x: List<T>, _ y: List<T>) -> T {
    return T.innerProduct(x, y)
}


