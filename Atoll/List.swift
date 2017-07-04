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

/// Represents an ordered, fixed sized, reference semantic list of `SignedNumeric` elements that conforms to
/// `MutableCollection` and `RandomAccessCollection`.
///
public struct List<Element: Real> {
    internal var value: UnsafeMutablePointer<Element>

    public var pointer: UnsafeMutablePointer<Element> {
        return value
    }

    public let count: Int

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
        self.value = UnsafeMutablePointer<Element>.allocate(capacity: count)
        _ = UnsafeMutableBufferPointer(start: value, count: count).initialize(from: (0..<count).map({ _ in return element }))
    }

    public init(count: Int) {
        self.init(repeating: 0, count: count)
    }

    public init(ones count: Int) {
        self.init(repeating: 1, count: count)
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
