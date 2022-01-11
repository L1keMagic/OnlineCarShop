import Foundation

enum ApiType {
    case getProducts
    
    var baseURL: String {
        return "localhost"
    }
    
    var headers: [String : String] {
        switch self {
        default:
            return [ : ]
        }
    }
    
    var path: String {
        switch self {
        case .getProducts:
            return "Products"
        }
    }
    
    var request: URLRequest {
        let url = URL(string: path, relativeTo: URL(string: baseURL)!)!
        var request = URLRequest(url: url)
        request.allHTTPHeaderFields = headers
        
        switch self {
        default:
            request.httpMethod = "GET"
            return request
        }
    }
}

class ApiManager {
    static let shared = ApiManager()
    
    func getProducts(completion: @escaping (Products) -> Void) {
        let request = ApiType.getProducts.request
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            if let data = data, let products = try? JSONDecoder().decode(Products.self, from: data) {
                completion(products)
            } else {
                completion([])
            }
        }
        task.resume()
    }
    
    func getProductsJson() -> Products {
        let decoder = JSONDecoder()
        guard
            let url = Bundle.main.url(forResource: "data", withExtension: "json"),
            let data = try? Data(contentsOf: url),
            let products = try? decoder.decode(Products.self, from: data)
        else {
            fatalError()
        }
        return products
    }
    
    func getCartProductsJson() -> Products {
        let decoder = JSONDecoder()
        guard
            let url = Bundle.main.url(forResource: "data", withExtension: "json"),
            let data = try? Data(contentsOf: url),
            let products = try? decoder.decode(Products.self, from: data)
        else {
            fatalError()
        }
        
        return products.filter { $0.isAddedToCart == true }
    }
}
