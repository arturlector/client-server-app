//
//  UserModel.swift
//  client-server
//
//  Created by Artur Igberdin on 14.04.2021.
//

import Foundation

struct UserModel: Codable {
    let id: Int
    let name: String
    let username: String
    let email: String
    let address: AddressModel
    let phone: String
    let website: String
    let company: CompanyModel
}

struct AddressModel: Codable {
    let street: String
    let suite: String
    let city: String
    let zipcode: String
    let geo: GeoModel
}

struct GeoModel: Codable {
    let latitude: String
    let longitude: String
    
    enum CodingKeys: String, CodingKey {
          case latitude = "lat"
          case longitude = "lng"
    }
}

struct CompanyModel: Codable {
  let name: String
  let catchPhrase: String
  let bs: String
}
