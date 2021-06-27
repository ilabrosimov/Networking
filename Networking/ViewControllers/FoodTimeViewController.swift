//
//  ViewController.swift
//  Networking
//
//  Created by ilabrosimov on 27.06.2021.
//

import UIKit

class FoodTimeViewController: UICollectionViewController {

// MARK: - UICollectionViewDataSource
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        foodTime.count
    }
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "FoodCell", for: indexPath) as! FoodCell
        
        cell.layer.cornerRadius = 20
        cell.labelCell.text = foodTime[indexPath.item]
        return cell
    }
    
// MARK: - Override methods
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "RecipeSegue" {
            let recipeVC = segue.destination  as! RecipeCollectionViewController
            let cell = sender as! FoodCell
            recipeVC.foodTime = cell.labelCell.text
        }
    }
}
// MARK: - extension UICollectionViewDelegateFlowLayout
extension FoodTimeViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: UIScreen.main.bounds.width - 40, height: (UIScreen.main.bounds.height - 150) / 3)
    
    }
}


