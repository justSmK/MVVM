//
//  NetworkDataFetch.swift
//  MVVM
//
//  Created by Sergei Semko on 9/9/23.
//

import Foundation

class NetworkDataFetch {
    
    static let shared = NetworkDataFetch()
    
    private init() {}
    
    func fetchUsers(response: @escaping (Users?, NetworkError?) -> Void) {
        NetworkRequest.shared.getData { result in
            switch result {
                
            case .success(let data):
                do {
                    let users = try JSONDecoder().decode(Users.self, from: data)
                    response(users, nil)
                } catch let jsonError {
                    print("Failed to decode \(jsonError.localizedDescription)")
                }
            case .failure(let error):
                print(error.localizedDescription)
                response(nil, .canNotParseData)
            }
        }
    }
}
