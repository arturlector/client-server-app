//
//  ThirdViewController.swift
//  client-server
//
//  Created by Artur Igberdin on 07.04.2021.
//

import UIKit

class ThirdViewController: UIViewController {
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var moneyLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let user = UserSession.shared
        
        nameLabel.text = UserSession.shared.fullName
        moneyLabel.text = String(describing: user.money)
    }
    

  

}
