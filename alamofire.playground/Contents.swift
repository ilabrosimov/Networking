import UIKit
import Alamofire
var greeting = "Hello, playground"

static func fetchDataAlamofire ( url: String) {
    guard let url = URL(string: url) else {return}
    Alamofire.AF.request(url).validate().response { (response) in
        switch response.result {
        case .success(let value) :
            print(value)
        case .failure(let error):
            print(error)
        }
    }
    
}
