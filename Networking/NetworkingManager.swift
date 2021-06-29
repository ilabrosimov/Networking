import UIKit


class NetworkManager {
    
    static func fetchData(url: String, complition: @escaping (_ food: Food) -> ()) {
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
}
