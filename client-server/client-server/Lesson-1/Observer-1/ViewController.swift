//
//  ViewController.swift
//  client-server
//
//  Created by Artur Igberdin on 07.04.2021.
//

import UIKit

class Buyer {
    func takeInfo() {
        print("buyer notified!")
    }
}

struct WeakBuyer {
    weak var buyer: Buyer?
}

class Shop {
    
    var listeners = [WeakBuyer]()
    
    func subscribe(buyer: Buyer) {
        let weakBuyer = WeakBuyer(buyer: buyer)
        listeners.append(weakBuyer)
    }
    
    func notify() {
        listeners.forEach{ $0.buyer?.takeInfo()}
    }
}

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let shop = Shop()
        
        let buyer1 = Buyer()
        let buyer2 = Buyer()
        let buyer3 = Buyer()
        
        shop.subscribe(buyer: buyer1)
        shop.subscribe(buyer: buyer2)
        
        //Товар появился на складе/прилавке
        shop.notify()
    }
}

