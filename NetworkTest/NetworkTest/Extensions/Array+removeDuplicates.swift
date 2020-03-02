//
//  Array+removeDuplicates.swift
//  NetworkTest
//
//  Created by mikewang on 2020/3/2.
//  Copyright © 2020 mikewang. All rights reserved.
//

import Foundation

// ref: https://www.hackingwithswift.com/example-code/language/how-to-remove-duplicate-items-from-an-array
extension Array where Element: Hashable {
    func removingDuplicates() -> [Element] {
        var addedDict = [Element: Bool]()

        return filter {
            addedDict.updateValue(true, forKey: $0) == nil
        }
    }

    mutating func removeDuplicates() {
        self = self.removingDuplicates()
    }
}
