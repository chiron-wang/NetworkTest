//
//  Song.swift
//  NetworkTest
//
//  Created by mikewang on 2020/2/28.
//  Copyright © 2020 mikewang. All rights reserved.
//

import Foundation

struct Song: Codable {
    let artistName: String
    let trackName: String
    let collectionName: String?
    let previewUrl: URL
    let artworkUrl100: URL
    let trackPrice: Double?
    let releaseDate: Date
    let isStreamable: Bool?
}

struct SongResults: Codable {
    let resultCount: Int
    let results: [Song]
}
