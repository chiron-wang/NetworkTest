//
//  Song.swift
//  NetworkTest
//
//  Created by mikewang on 2020/2/28.
//  Copyright © 2020 mikewang. All rights reserved.
//

import Foundation

class Song: Codable {
    let artistName: String
    let trackName: String
    let collectionName: String?
    let previewUrl: URL
    let artworkUrl100: URL
    let trackPrice: Double?
    let releaseDate: Date
    let isStreamable: Bool?
    var trackId: Int
}

struct SongResults: Codable {
    let resultCount: Int
    let results: [Song]
}

// for unique
extension Song: Hashable {
    static func == (lhs: Song, rhs: Song) -> Bool {
        return lhs.trackId == rhs.trackId
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(self.trackId)
    }
    
}

//// for group
//extension Song: Sequence, IteratorProtocol {
//    typealias Element = <#type#>
//    
//    typealias Element = <#type#>
//}
