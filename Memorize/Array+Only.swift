//
//  Array+Only.swift
//  Memorize
//
//  Created by Chase Schelthoff on 7/12/20.
//  Copyright © 2020 Chase Schelthoff. All rights reserved.
//

import Foundation

extension Array {
    var only: Element? {
        count == 1 ? first : nil
    }
}
