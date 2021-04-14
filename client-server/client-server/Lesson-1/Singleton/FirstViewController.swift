//
//  FirstViewController.swift
//  client-server
//
//  Created by Artur Igberdin on 07.04.2021.
//

import UIKit

final class UserSession {
    
    static let shared = UserSession()
    
    private init() {}
    
    var id = 0
    var fullName = ""
    var money = 0
    
}

class FirstViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        
        let user = UserSession.shared
        
        user.fullName = "Вася"
        user.id = 1
        user.money = 1000
    }


}
