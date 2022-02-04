//
//  StoreItem.swift
//  iTunesSearch
//
//  Created by Angel Zambrano on 2/4/22.
//

import Foundation

enum StoreItemError: Error, LocalizedError {
    case itemsNotFound
    case imageDataMissing
}


struct StoreItem: Codable {
    var artistName: String
    var trackName: String
    var kind: String
    var artworkUrl100: URL
    
}
struct SearchResponse: Codable {
    let results: [StoreItem]
}
