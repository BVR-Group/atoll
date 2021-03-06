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
import simd

/// Represents an ordered, fixed sized, reference semantic list of `SignedNumeric` elements that conforms to
/// `MutableCollection` and `RandomAccessCollection`.
///
public struct List<Element: Real> {
    
    internal class WrappedValue {
        fileprivate let pointer: UnsafeMutablePointer<Element>
        let count: Int
        
        init(with pointer: UnsafeMutablePointer<Element>, and count: Int) {
            self.count = count
            self.pointer = pointer
        }
        
        init(count: Int) {
            self.count = count
            self.pointer = UnsafeMutablePointer<Element>.allocate(capacity: count)
        }
        
        deinit {
            pointer.deallocate(capacity: count)
        }
    }
    
    fileprivate var wrappedValue: WrappedValue
    
    internal var value: UnsafeMutablePointer<Element> {
        return self.wrappedValue.pointer
    }

    public var pointer: UnsafeMutablePointer<Element> {
        return value
    }

    public var count: Int

    public var countPointer: [Int32] {
        return [Int32(count)]
    }

    public var vDSP_Length: vDSP_Length {
        return UInt(count)
    }

    public var halfIndex: List.Index {
        return self.endIndex / 2
    }

    public var firstHalf: MutableRandomAccessSlice<List<Element>> {
        return self[startIndex..<halfIndex]
    }

    public init(repeating element: Element, count: Int) {
        self.count = count
        self.wrappedValue = WrappedValue(count: count)
        _ = UnsafeMutableBufferPointer(start: value, count: count).initialize(from: (0..<count).map({ _ in return element }))
    }

    public init(count: Int) {
        self.init(repeating: 0, count: count)
    }

    public init(ones count: Int) {
        self.init(repeating: 1, count: count)
    }
    
    public init(copyFrom pointer: UnsafeMutablePointer<Element>, count: Int) {
        self.count = count
        self.wrappedValue = WrappedValue(count: count)
        self.wrappedValue.pointer.assign(from: pointer, count: count)
    }
    
    public init(referencing pointer: UnsafeMutablePointer<Element>, count: Int) {
        self.count = count
        self.wrappedValue = WrappedValue(with: pointer, and: count)
    }

    public func copy() -> List<Element> {
        let result = List<Element>.init(repeating: 0, count: count)
        result.value.assign(from: value, count: count)
        return result
    }

    /// Takes the first half of the list, reverses it, and replaces the later half with the resulting values.
    public func mirrored() -> List<Element> {
        var result = self.copy()
        result.mirror()
        return result
    }
    
    /// Takes the first half of the list, reverses it, and replaces the later half with the resulting values.
    public mutating func mirror() {
        let range: Range<List.Index> = self.endIndex % 2 == 0 ? self.halfIndex..<endIndex : self.halfIndex + 1..<endIndex
        self.replaceSubrange(range, with: firstHalf.reversed())
    }
}

extension List: ExpressibleByArrayLiteral {
    public typealias ArrayLiteralElement = Element

    public init(arrayLiteral elements: Element...) {
        self.init(repeating: 0, count: elements.count)
        for (i, element) in elements.enumerated() {
            self[i] = element
        }
    }
}

extension List: MutableCollection, RandomAccessCollection, RangeReplaceableCollection {

    public init() {
        self.init(count: 0)
    }

    public mutating func replaceSubrange<C: Collection>(
        _ subrange: Range<Index>,
        with newElements: C
    ) where C.Iterator.Element == Element {
        assert(subrange.lowerBound >= startIndex && subrange.upperBound <= endIndex)
        _ = UnsafeMutableBufferPointer(start: value + subrange.lowerBound, count: count - subrange.lowerBound).initialize(from: newElements)
    }

    public typealias Index = Int

    public subscript(index: Index) -> Element {
        get {
            return UnsafeMutableBufferPointer(start: value, count: count)[index]
        }
        set(newValue) {
            UnsafeMutableBufferPointer(start: value, count: count)[index] = newValue
        }
    }

    public var startIndex: Int {
        return UnsafeMutableBufferPointer(start: value, count: count).startIndex
    }

    public var endIndex: Int {
        return UnsafeMutableBufferPointer(start: value, count: count).endIndex
    }
}

extension List: CustomDebugStringConvertible {
    public var debugDescription: String {
        return self.map({ $0 }).debugDescription
    }
}

public func swap<Element>(_ lhs: inout List<Element>, _ rhs: inout List<Element>) {
    swap(&lhs.wrappedValue, &rhs.wrappedValue)
    swap(&lhs.count, &rhs.count)
}
