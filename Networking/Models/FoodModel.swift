
// MARK: - Food
struct Food: Codable {
    let hits: [Hit]
    
    enum CodingKeys: String, CodingKey {
        case hits
    }
    init?(hits: [Hit]) {
        self.hits = hits
    }
    
    init?(json: [String: Any]) {
        guard let hits = json["hits"] as? [Hit] else {return nil}
        self.hits = hits
    }
   
}

// MARK: - Hit
struct Hit: Codable {
    let recipe: Recipe
    
    init?(recipe: Recipe) {
        self.recipe = recipe
    }
    
    init?(json: [String: Any]) {
        let recipe = json["recipe"] as? Recipe
        self.recipe = recipe!
    }
}

// MARK: - Recipe
struct Recipe: Codable {
    let label: String
    let image: String
    let ingredients: [Ingredient]
    
    init?(label: String, image: String, ingredients: [Ingredient]) {
        self.label = label
        self.image = image
        self.ingredients = ingredients
    }
    init?(json: [String: Any]) {
        let label = json["label"] as? String
        let image = json["image"] as? String
        let ingredients = json["ingredients"] as? [Ingredient]
        self.label = label!
        self.image = image!
        self.ingredients = ingredients!
        
    }
}
// MARK: - Ingredient
struct Ingredient: Codable {
    let text: String
    
    init?(text: String) {
        self.text = text
    }
    init?(json: [String:Any]) {
        let text = json["text"] as? String
        self.text = text!
    }
}
