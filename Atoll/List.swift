//
//  List.swift
//  Atoll-macOS
//
//  Created by Dylan Wreggelsworth on 6/15/17.
//  Copyright © 2017 BVR, LLC. All rights reserved.
//

import Foundation

/// Represents an ordered, fixed sized, reference semantic backed list of `SignedNumeric` elements that conforms to `MutableCollection` and `RandomAccessCollection`.
///
public struct List<Element: SignedNumeric> {
    private var value: ManagedBuffer<Int, Element>

    public var count: Int {
        return value.withUnsafeMutablePointerToHeader { $0.pointee }
    }

    public var capacity: Int {
        return value.capacity
    }

    public var storage: UnsafeMutablePointer<Element> {
        return value.withUnsafeMutablePointerToElements { $0 }
    }

    public init(repeating element: Element, count: Int) {
        value = ManagedBuffer<Int, Element>.create(minimumCapacity: count, makingHeaderWith: { _ in return count })
        value.withUnsafeMutablePointerToElements({
            $0.initialize(to: element, count: count)
        })
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
            precondition(index >= startIndex && index < endIndex, "Index out of bounds.")
            return value.withUnsafeMutablePointerToElements { $0[index] }
        }
        set(newValue) {
            self.replace(index: index, with: newValue)
        }
    }

    public var startIndex: Int {
        return 0
    }

    public var endIndex: Int {
        return value.capacity - 1
    }

    public func replace(index: Int, with element: Element) {
        precondition(index >= startIndex && index < endIndex, "Index out of bounds.")
        value.withUnsafeMutablePointerToElements { $0[index] = element }
    }
}
