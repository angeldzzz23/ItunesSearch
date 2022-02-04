//
//  StoreItemController.swift
//  iTunesSearch
//
//  Created by Angel Zambrano on 2/4/22.
//

import Foundation

class StoreItemController {
    // fethcing items
    func fetchItems(matching query: [String: String]) async
       throws -> [StoreItem] {
        var urlComponents = URLComponents(string:
           "https://itunes.apple.com/search")!
        urlComponents.queryItems = query.map { URLQueryItem(name: $0.key,
           value: $0.value) }
           
         
        let (data, response) = try await URLSession.shared.data(from:
           urlComponents.url!)
            guard let httpResponse = response as? HTTPURLResponse,
               httpResponse.statusCode == 200 else {
            throw StoreItemError.itemsNotFound
        }

        let decoder = JSONDecoder()
        let searchResponse = try decoder.decode(SearchResponse.self,
           from: data)
           //var url: URL
           print("here")
           print(searchResponse)
           print("end")
        return searchResponse.results
    }
    
    // fetching 
    
    
}
