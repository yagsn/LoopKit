//
//  Collection.swift
//  LoopKit
//
//  Created by Michael Pangburn on 2/14/19.
//  Copyright © 2019 LoopKit Authors. All rights reserved.
//

extension Collection {
    /// Returns a sequence containing adjacent pairs of elements in the ordered collection.
    func adjacentPairs() -> Zip2Sequence<Self, SubSequence> {
        return zip(self, dropFirst())
    }
}

// Source:  https://github.com/apple/swift/blob/master/stdlib/public/core/CollectionAlgorithms.swift#L476
extension Collection {
    /// Returns the index of the first element in the collection that matches
    /// the predicate.
    ///
    /// The collection must already be partitioned according to the predicate.
    /// That is, there should be an index `i` where for every element in
    /// `collection[..<i]` the predicate is `false`, and for every element
    /// in `collection[i...]` the predicate is `true`.
    ///
    /// - Parameter predicate: A predicate that partitions the collection.
    /// - Returns: The index of the first element in the collection for which
    ///   `predicate` returns `true`.
    ///
    /// - Complexity: O(log *n*), where *n* is the length of this collection if
    ///   the collection conforms to `RandomAccessCollection`, otherwise O(*n*).
    func partitioningIndex(
        where predicate: (Element) throws -> Bool
    ) rethrows -> Index {
        var n = count
        var l = startIndex

        while n > 0 {
            let half = n / 2
            let mid = index(l, offsetBy: half)
            if try predicate(self[mid]) {
                n = half
            } else {
                l = index(after: mid)
                n -= half + 1
            }
        }
        return l
    }
}
