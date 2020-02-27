//
//  Meme.swift
//  NetworkTest
//
//  Created by mikewang on 2020/2/27.
//  Copyright © 2020 mikewang. All rights reserved.
//

import Foundation

struct Meme: Codable {
    let id: Int
    let image: URL
    let caption: String
    let category: String
}
