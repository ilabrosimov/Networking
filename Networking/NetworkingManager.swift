import UIKit
import Alamofire

class NetworkManager {
    
    static func fetchDataUrlSession(url: String, complition: @escaping (_ food: Food) -> ()) {
        guard let url = URL(string: url) else {return}
        let session = URLSession.shared
        session.dataTask(with: url) {(data, _ , error) in
            guard let data = data else {return}
            do {
                let food =  try JSONDecoder().decode(Food.self, from: data)
                complition(food)
                
            } catch {
                print(error)
            }
            
        }.resume()
    }
    static func fetchDataAlamofire ( url: String) {
        guard let url = URL(string: url) else {return}
        AF.request(url)
            .validate()
            .responseJSON { (dataResponse) in
                
                switch dataResponse.result {
                case .success(let value) :
                    
                    guard let foodData = value as? [String: Any] else {return}
                case .failure(let error):
                    print(error)
                }
            }
        
    }
}
                
                
                    
                
                    
