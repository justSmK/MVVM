//
//  MainCellViewModel.swift
//  MVVM
//
//  Created by Sergei Semko on 9/9/23.
//

import Foundation

final class MainCellViewModel {
    
    var name: String
    var email: String
    
    init(_ user: User) {
        self.name = user.name
        self.email = user.email
    }
    
}
