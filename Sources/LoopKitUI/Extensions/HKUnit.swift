//
//  File.swift
//  
//
//  Created by Pete Schwamb on 11/24/20.
//

import Foundation
import HealthKit

extension HKUnit {
    /// The smallest value expected to be visible on a chart
    var chartableIncrement: Double {
        if self == .milligramsPerDeciliter {
            return 1
        } else {
            return 1 / 25
        }
    }
}
