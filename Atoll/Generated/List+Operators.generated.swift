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

fileprivate func checkCount<T>(lhs: List<T>, rhs: List<T>) {
    precondition(lhs.count == rhs.count, "Expected Lists of equal length.")
}

extension List {
    public static func + (lhs: List<Element>, rhs: List<Element>) -> List<Element> {
        return Element.add(lhs, rhs)
    }

    public static func + (lhs: List<Element>, rhs: List.Element) -> List<Element> {
        return Element.add(lhs, rhs)
    }

    public static func - (lhs: List<Element>, rhs: List<Element>) -> List<Element> {
        return Element.subtract(lhs, rhs)
    }

    public static func - (lhs: List<Element>, rhs: List.Element) -> List<Element> {
        return Element.subtract(lhs, rhs)
    }

    public static func * (lhs: List<Element>, rhs: List<Element>) -> List<Element> {
        return Element.multiply(lhs, rhs)
    }

    public static func * (lhs: List<Element>, rhs: List.Element) -> List<Element> {
        return Element.multiply(lhs, rhs)
    }

    public static func / (lhs: List<Element>, rhs: List<Element>) -> List<Element> {
        return Element.divide(lhs, rhs)
    }

    public static func / (lhs: List<Element>, rhs: List.Element) -> List<Element> {
        return Element.divide(lhs, rhs)
    }

    public static func += (lhs: List<Element>, rhs: List<Element>) {
        Element.addInPlace(lhs, rhs)
    }

    public static func += (lhs: List<Element>, rhs: List.Element) {
        Element.addInPlace(lhs, rhs)
    }

    public static func -= (lhs: List<Element>, rhs: List<Element>) {
        Element.subtractInPlace(lhs, rhs)
    }

    public static func -= (lhs: List<Element>, rhs: List.Element) {
        Element.subtractInPlace(lhs, rhs)
    }

    public static func *= (lhs: List<Element>, rhs: List<Element>) {
        Element.multiplyInPlace(lhs, rhs)
    }

    public static func *= (lhs: List<Element>, rhs: List.Element) {
        Element.multiplyInPlace(lhs, rhs)
    }

    public static func /= (lhs: List<Element>, rhs: List<Element>) {
        Element.divideInPlace(lhs, rhs)
    }

    public static func /= (lhs: List<Element>, rhs: List.Element) {
        Element.divideInPlace(lhs, rhs)
    }
}
