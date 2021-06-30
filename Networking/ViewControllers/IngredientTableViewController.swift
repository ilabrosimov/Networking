//
//  IngredientTableViewController.swift
//  Networking
//
//  Created by ilabrosimov on 29.06.2021.
//

import UIKit


class IngredientTableViewController: UITableViewController {
    var recipe: Recipe?
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
        navigationItem.title = "List of ingredients"
    }

    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return recipe?.label ?? ""
    }
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return recipe?.ingredients.count ?? 0
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        cell.textLabel?.text = recipe?.ingredients[indexPath.row].text
        return cell
    }
    

}
