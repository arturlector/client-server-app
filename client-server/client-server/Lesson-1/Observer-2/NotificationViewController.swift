//
//  NotificationViewController.swift
//  client-server
//
//  Created by Artur Igberdin on 07.04.2021.
//

import UIKit

class NotificationViewController: UIViewController {

    let someNotification = Notification.Name("someNotificationKey")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        NotificationCenter.default.addObserver(self, selector: #selector(changeColor(notification:)), name: someNotification, object: nil)
    }
    
    //MARK: -
    @IBAction func sendNotificationAction(_ sender: Any) {
        NotificationCenter.default.post(name: someNotification, object: nil)
    }
    
    @objc
    func changeColor(notification: Notification) {
        view.backgroundColor = .yellow
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self, name: someNotification, object: nil)
    }

}
