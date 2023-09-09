//
//  MainViewModel.swift
//  MVVM
//
//  Created by Sergei Semko on 9/9/23.
//

import Foundation

final class MainViewModel {
    func numberOfSection() -> Int {
        return 1
    }
    
    func numberOfRows(_ section: Int) -> Int {
        return 10
    }
}
