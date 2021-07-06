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
        if let cachedImage = CacheImageManager.shared.loadImageDataFromCache(url: imageUrl) {
            image = cachedImage
            return
        }
        //В кеше нет данных, загргужаем из сети
        ImageManager.shared.getImage(url: imageUrl) { date, response in
            DispatchQueue.main.async {
                self.image = UIImage(data: date)
            }
            //Сохраняем в кеш
            CacheImageManager.shared.saveImageDataToCache(data: date, response: response)
        }
    }
}
