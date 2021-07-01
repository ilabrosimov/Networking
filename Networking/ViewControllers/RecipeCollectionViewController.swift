//
//  RecipeCollectionViewController.swift
//  Networking
//
//  Created by ilabrosimov on 27.06.2021.
//

import UIKit

class RecipeCollectionViewController: UICollectionViewController {
    
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!

    // MARK: - Private propereties
    var foodTime:String?
    private var food: Food?
    private var currentRecipe: Int?
    // MARK: - Life cycle methods
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.activityIndicator.startAnimating()
        
        NetworkManager.fetchDataUrlSession (url: "https://api.edamam.com/api/recipes/v2?type=public&app_id=ec8bc526&app_key=ceea9a0eaf3cd0564d23cd7fc2edf6f5&diet=balanced&mealType=\(foodTime ?? "")"){ food in
            self.food = food
            DispatchQueue.main.async {
                self.collectionView.reloadData()
                self.activityIndicator.stopAnimating()
                self.activityIndicator.hidesWhenStopped = true
            }
        }
        NetworkManager.fetchDataAlamofire(url: "https://api.edamam.com/api/recipes/v2?type=public&app_id=ec8bc526&app_key=ceea9a0eaf3cd0564d23cd7fc2edf6f5&diet=balanced&mealType=\(foodTime ?? "")")
        
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ingredientSegue" {
            guard let ingredintVC = segue.destination as? IngredientTableViewController else {return}
            if currentRecipe != nil {
                ingredintVC.recipe = food?.hits[currentRecipe!].recipe
            }   
        }
    }
  
    // MARK: - UICollectionViewDataSource
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.food?.hits.count ?? 0
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "RecipeCell", for: indexPath) as! RecipeCell
        
        configureCollectionCell(cell: cell, indexPath: indexPath)
        cell.layer.cornerRadius = 20
        
        return cell
    }
    // MARK: - UICollectionViewDelegate
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        currentRecipe = indexPath.item
        performSegue(withIdentifier: "ingredientSegue", sender: nil)
    }
    // MARK: - Private methods
    private func configureCollectionCell (cell: RecipeCell, indexPath: IndexPath) {
        
        DispatchQueue.global().async {
            guard let imageUrl = URL(string: self.food!.hits[indexPath.item].recipe.image ) else {return }
            guard let imageData = try? Data(contentsOf: imageUrl) else {return }
            
            DispatchQueue.main.async {
                cell.imageView.image = UIImage(data: imageData )
            }
        }
    }
}

// MARK: - Extention UICollectionViewDelegateFlowLayout

extension RecipeCollectionViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let itemsPerRow = CGFloat(2)
        let padding = 20 * (itemsPerRow + 1)
        let availableWidth = collectionView.frame.width - padding
        let widthPerItem = availableWidth / itemsPerRow
        return CGSize(width: widthPerItem, height: widthPerItem)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        20
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        20
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 20, left: 20, bottom: 20, right: 20)
    }
}
