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

protocol SupportedFloatType {}
extension Double: SupportedFloatType {}
extension Float: SupportedFloatType {}
