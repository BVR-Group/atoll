//
//  List.swift
//  Atoll-macOS
//
//  Created by Dylan Wreggelsworth on 6/15/17.
//  Copyright © 2017 BVR, LLC. All rights reserved.
//

import Foundation

/// Represents an ordered, fixed sized, reference semantic list of `SignedNumeric` elements that conforms to
/// `MutableCollection` and `RandomAccessCollection`.
///
public struct List<Element: SignedNumeric> {
    private var value: UnsafeMutablePointer<Element>

    public var pointer: UnsafeMutablePointer<Element> {
        return value
    }

    public let count: Int

    public init(repeating element: Element, count: Int) {
        self.count = count
        self.value = UnsafeMutablePointer<Element>.allocate(capacity: count)
        _ = UnsafeMutableBufferPointer(start: value, count: count).initialize(from: (0..<count).map({ _ in return element }))
    }

    public init(count: Int) {
        self.init(repeating: 0, count: count)
    }

    public func copy() -> List<Element> {
        let result = List<Element>.init(repeating: 0, count: count)
        result.value.assign(from: value, count: count)
        return result
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

extension List: MutableCollection, RandomAccessCollection {
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

