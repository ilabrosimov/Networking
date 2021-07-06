//
//  ImageManager.swift
//  Networking
//
//  Created by ilabrosimov on 04.07.2021.
//
import Foundation
class ImageManager {
    
    static var shared = ImageManager()
    private init() {}
    
    //загружаем из сети картинку с помощью URLSession
    func getImage (url: URL, completion: @escaping (Data, URLResponse) -> ()) {
        URLSession.shared.dataTask(with: url) { date, response, error in
            guard let data = date, let response = response else {
                print(error?.localizedDescription ?? "Unknown error")
                return
            }
            guard url == response.url else {return}
            
            completion(data,response)
        }.resume()
    }
}
