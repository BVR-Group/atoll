// Generated using Sourcery 0.7.2 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT

fileprivate func checkCount<T>(lhs: List<T>, rhs: List<T>) {
    precondition(lhs.count == rhs.count, "Expected Lists of equal length.")
}


// Doubles

public func + (lhs: DoubleList, rhs: DoubleList) -> DoubleList {
    return add(lhs, rhs)
}

public func - (lhs: DoubleList, rhs: DoubleList) -> DoubleList {
    return subtract(lhs, rhs)
}

public func * (lhs: DoubleList, rhs: DoubleList) -> DoubleList {
    return multiply(lhs, rhs)
}

public func / (lhs: DoubleList, rhs: DoubleList) -> DoubleList {
    return divide(lhs, rhs)
}

public func + (lhs: DoubleList, rhs: Double) -> DoubleList {
    return add(lhs, rhs)
}

public func - (lhs: DoubleList, rhs: Double) -> DoubleList {
    return subtract(lhs, rhs)
}

public func * (lhs: DoubleList, rhs: Double) -> DoubleList {
    return multiply(lhs, rhs)
}

public func / (lhs: DoubleList, rhs: Double) -> DoubleList {
    return divide(lhs, rhs)
}

// Floats

public func + (lhs: FloatList, rhs: FloatList) -> FloatList {
    return add(lhs, rhs)
}

public func - (lhs: FloatList, rhs: FloatList) -> FloatList {
    return subtract(lhs, rhs)
}

public func * (lhs: FloatList, rhs: FloatList) -> FloatList {
    return multiply(lhs, rhs)
}

public func / (lhs: FloatList, rhs: FloatList) -> FloatList {
    return divide(lhs, rhs)
}

public func + (lhs: FloatList, rhs: Float) -> FloatList {
    return add(lhs, rhs)
}

public func - (lhs: FloatList, rhs: Float) -> FloatList {
    return subtract(lhs, rhs)
}

public func * (lhs: FloatList, rhs: Float) -> FloatList {
    return multiply(lhs, rhs)
}

public func / (lhs: FloatList, rhs: Float) -> FloatList {
    return divide(lhs, rhs)
}
