//
//  FruitsViewController.swift
//  client-server
//
//  Created by Artur Igberdin on 07.04.2021.
//

import UIKit

protocol FruitsViewControllerDelegate: class {
    func fruitDidSelect(_ fruit: String)
}

class FruitsViewController: UITableViewController {

    weak var delegate: FruitsViewControllerDelegate?
    
    let fruits = ["Яблоко", "Банан", "Киви"]
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "AppleCell")
    }

    // MARK: - UITableViewDatasource

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return fruits.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let cell: UITableViewCell = tableView.dequeueReusableCell(withIdentifier: "AppleCell", for: indexPath)
        cell.textLabel?.text = fruits[indexPath.row]
        return cell
    }
    
    // MARK: - UITableViewDelegate
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let fruit = fruits[indexPath.row]
        delegate?.fruitDidSelect(fruit)
        print(fruit)
        self.navigationController?.popViewController(animated: true)
    }
    
}
