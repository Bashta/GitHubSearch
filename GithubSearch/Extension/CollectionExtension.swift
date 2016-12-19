//
//  CollectionExtension.swift
//  GithubSearch
//
//  Created by Er on 12/19/16.
//  Copyright © 2016 NativeSolutions. All rights reserved.
//

import Foundation

extension Collection where Index == Int {

    func randomElement() -> Iterator.Element? {
        return isEmpty ? nil : self[Int(arc4random_uniform(UInt32(endIndex)))]
    }
}
