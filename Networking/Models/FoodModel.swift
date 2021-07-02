
// MARK: - Food
struct Food: Codable {
    let hits: [Hit]
    
    enum CodingKeys: String, CodingKey {
        case hits
    }
}

// MARK: - Hit
struct Hit: Codable {
    let recipe: Recipe
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
    
}
