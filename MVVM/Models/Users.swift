//
//  Users.swift
//  MVVM
//
//  Created by Sergei Semko on 9/9/23.
//

import Foundation

typealias Users = [User]

// MARK: - User
struct User: Codable {
    let name, username, email: String
    let address: Address
    let phone: String
}

// MARK: - Address
struct Address: Codable {
    let street, suite, city: String
}

