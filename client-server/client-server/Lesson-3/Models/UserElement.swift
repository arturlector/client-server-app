//
//  UserElement.swift
//  client-server
//
//  Created by Artur Igberdin on 14.04.2021.
//

import Foundation

import Foundation

// MARK: - UserElement
struct UserElement: Codable {
    let id: Int
    let name, username, email: String
    let address: AddressElement
    let phone, website: String
    let company: CompanyElement
}

// MARK: - Address
struct AddressElement: Codable {
    let street, suite, city, zipcode: String
    let geo: GeoElement
}

// MARK: - Geo
struct GeoElement: Codable {
    let lat, lng: String
}

// MARK: - Company
struct CompanyElement: Codable {
    let name, catchPhrase, bs: String
}

//typealias User = [UserElement]
