//
//  LoopKitTests.swift
//  LoopKitTests
//
//  Created by Nathan Racklyeft on 1/18/16.
//  Copyright © 2016 Nathan Racklyeft. All rights reserved.
//

import XCTest
import Foundation

public typealias JSONDictionary = [String: Any]


extension XCTestCase {
    public func loadFixture<T>(_ resourceName: String, directory: String) -> T {
        let path = Bundle.module.path(forResource: resourceName, ofType: "json", inDirectory: directory)!
        return try! JSONSerialization.jsonObject(with: Data(contentsOf: URL(fileURLWithPath: path)), options: []) as! T
    }
}
