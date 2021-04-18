//
//  MappingViewController.swift
//  client-server
//
//  Created by Artur Igberdin on 14.04.2021.
//

import UIKit
import Alamofire

class MappingViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        //1. JSONSerialization + Parsing
        //loadUsersFirstExample()
        
        //2. Parsing in Models
        //loadUsersSecondExample()
        
        //3. Codable
        loadUsersThirdExample()
        
        //4. Codegen + Codable
    }
    
    func loadUsersThirdExample() {
        
        Alamofire.request("https://jsonplaceholder.typicode.com/users").responseData { (response) in
            
            guard let data = response.value else { return }
            
            do {
                let users = try JSONDecoder().decode([UserElement].self, from: data)
                print(users.first)
            } catch {
                print(error)
            }
        }
        
    }
    
    func loadUsersSecondExample() {
        
        guard let url = URL(string: "https://jsonplaceholder.typicode.com/users") else {
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            
            guard let data = data,
                  let json = try? JSONSerialization.jsonObject(with: data, options: JSONSerialization.ReadingOptions.mutableContainers)
                  else { return }
            
            let array = json as! [[String: Any]]
            let users = array.map { User(json: $0) }
            
            print(users.first ?? "")

        }.resume()
    }
    
    func loadUsersFirstExample() {
        
        guard let url = URL(string: "https://jsonplaceholder.typicode.com/users") else {
            return
        }

        URLSession.shared.dataTask(with: url) { data, response, error in
            
            guard let data = data,
                  let json = try? JSONSerialization.jsonObject(with: data, options: JSONSerialization.ReadingOptions.mutableContainers)
                  else { return }
            
            let array = json as! [Any]
                
            print(array)
            
            for userJson in array {
                
                let userJson  = userJson as! [String: Any]
                let id = userJson["id"] as! Int
                let name = userJson["name"] as! String
                let username = userJson["username"] as! String
                let email = userJson["email"] as! String
                let addressJson = userJson["address"] as! [String: Any]
                let street = addressJson["street"] as! String
                let suite = addressJson["suite"] as! String
                let city = addressJson["city"] as! String
                let zipcode = addressJson["zipcode"] as! String
                let geoJson = addressJson["geo"] as! [String: Any]
                let lat = geoJson["lat"] as! String
                let lng = geoJson["lng"] as! String
                let phone = userJson["phone"] as! String
                let website = userJson["website"] as! String
                let companyJson = userJson["company"] as! [String: Any]
                let companyName = companyJson["name"] as! String
                let catchPhrase = companyJson["catchPhrase"] as! String
                let bs = companyJson["bs"] as! String
                
                print(id, name, username, email, street, suite, city, zipcode, lat, lng, phone, website, companyName, catchPhrase, bs)
                
            }

        }.resume()
         
    }
   
    
    
//    func loadUsersFirstExample() {
//
//        guard let url = URL(string: "https://jsonplaceholder.typicode.com/users") else {
//            return
//        }
//
////        URLSession.shared.dataTask(with: url) { data, response, error in
////
////            print(data)
////        }
//
//        URLSession.shared.dataTask(with: url) { data, response, error in
//
//            guard let data = data,
//                  let json = try? JSONSerialization.jsonObject(with: data, options: JSONSerialization.ReadingOptions.mutableContainers)
//            else { return }
//
//            let array = json as! [Any]
//
//            for userJson in array {
//
//                let userJson = userJson as! [String: Any]
//
//                let name = userJson["name"] as! String
//                let id = userJson["id"] as! Int
//
//                let companyJson = userJson["company"] as! [String: Any]
//                let companyName = companyJson["name"] as! String
//
//                print(id, name, companyName)
//            }
//        }
//
//    }
}


