//
//  NSData.swift
//  LoopKit
//
//  Created by Nate Racklyeft on 8/26/16.
//  Copyright © 2016 Nathan Racklyeft. All rights reserved.
//

import Foundation

extension Data {
    static func newPumpEventIdentifier() -> Data {
        return Data(UUID().uuidString.utf8)
    }
}
