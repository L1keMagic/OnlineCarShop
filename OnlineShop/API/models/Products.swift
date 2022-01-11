import Foundation

struct Product: Codable {
    let id: Int
    let title: String
    let productDescription: String?
    let price: Decimal
    let model, vin: String
    let imageURL: String?
    let isAddedToCart: Bool?

    enum CodingKeys: String, CodingKey {
        case id, title
        case productDescription = "description"
        case price, model, vin
        case imageURL = "imageUrl"
        case isAddedToCart
    }
}

typealias Products = [Product]
