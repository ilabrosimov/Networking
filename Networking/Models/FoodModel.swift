
// MARK: - Food
struct Food: Codable {
    let from, to, count: Int
    let hits: [Hit]

    enum CodingKeys: String, CodingKey {
        case from, to, count
        case hits
    }
}

// MARK: - Hit
struct Hit: Codable {
    let recipe: Recipe

    enum CodingKeys: String, CodingKey {
        case recipe
    }
}

// MARK: - Recipe
struct Recipe: Codable {
    let label: String
    let image: String
    let ingredients: [Ingredient]
}
// MARK: - Ingredient
struct Ingredient: Codable {
    let text: String
    let weight: Double
    let foodCategory: String?
    let foodID: String
    let image: String?

    enum CodingKeys: String, CodingKey {
        case text, weight, foodCategory
        case foodID = "foodId"
        case image
    }
}
