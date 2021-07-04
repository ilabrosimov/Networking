//
//  RecipeImageView.swift
//  Networking
//
//  Created by ilabrosimov on 04.07.2021.
//

import UIKit

class RecipeImageView: UIImageView {
    
    func fetchImage(from url: String)  {
        guard let imageUrl = URL(string: url) else {return }
     
        //Загружаем из кеша
        if let cachedImage = loadImageDataFromCache(url: imageUrl) {
            image = cachedImage
            return
        }
        //В кеше нет данных, загргужаем из сети
        ImageManager.shared.getImage(url: imageUrl) { date, response in
            DispatchQueue.main.async {
                self.image = UIImage(data: date)
            }
            //Сохраняем в кеш
            self.saveImageDataToCache(data: date, response: response)
        }
    }
    
    private func saveImageDataToCache (data: Data, response: URLResponse) {
        guard let responseUrl = response.url else {return}
        let request = URLRequest(url: responseUrl)
        let cachedResponse = CachedURLResponse(response: response, data: data)
        URLCache.shared.storeCachedResponse(cachedResponse, for: request)
    }
    
    private func loadImageDataFromCache (url: URL) -> UIImage? {
        let request = URLRequest(url: url )
        
        if let cacheResponse = URLCache.shared.cachedResponse(for: request ) {
            return UIImage(data: cacheResponse.data)
        }
        return nil
        
    }
}
