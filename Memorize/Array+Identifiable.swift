//
//  Array+Identifiable.swift
//  Memorize
//
//  Created by Chase Schelthoff on 7/10/20.
//  Copyright © 2020 Chase Schelthoff. All rights reserved.
//

import Foundation

extension Array where Element : Identifiable {
    func firstIndex(matching: Element) -> Int? {
        for (index, element) in self.enumerated() {
            if matching.id == element.id {
                return index
            }
        }
        return nil
    }
}
