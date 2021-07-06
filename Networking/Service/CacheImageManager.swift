//
//  CacheImageManager.swift
//  Networking
//
//  Created by ilabrosimov on 06.07.2021.
//

import UIKit
class CacheImageManager {
    static let shared = CacheImageManager()
    private init() {}
    
     func saveImageDataToCache (data: Data, response: URLResponse) {
        guard let responseUrl = response.url else {return}
        let request = URLRequest(url: responseUrl)
        let cachedResponse = CachedURLResponse(response: response, data: data)
        URLCache.shared.storeCachedResponse(cachedResponse, for: request)
    }
    
    
     func loadImageDataFromCache (url: URL) -> UIImage? {
        let request = URLRequest(url: url )
        
        if let cacheResponse = URLCache.shared.cachedResponse(for: request ) {
            return UIImage(data: cacheResponse.data)
        }
        return nil
        
    }
}
