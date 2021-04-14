//
//  MainViewController.swift
//  client-server
//
//  Created by Artur Igberdin on 07.04.2021.
//

import UIKit

class MainViewController: UIViewController, FruitsViewControllerDelegate {
    
    @IBOutlet weak var fruitLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    //MARK - FruitsViewControllerDelegate
    
    func fruitDidSelect(_ fruit: String) {
        self.fruitLabel.text = fruit
    }
    
    //MARK - Actions
    @IBAction func showFruitViewControllerAction(_ sender: Any) {
        
        let fruitController = FruitsViewController()
        fruitController.delegate = self
        self.navigationController?.pushViewController(fruitController, animated: true)
    }
    
}
