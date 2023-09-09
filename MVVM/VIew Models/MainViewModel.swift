//
//  MainViewModel.swift
//  MVVM
//
//  Created by Sergei Semko on 9/9/23.
//

import Foundation

final class MainViewModel {
    
    var isLoading: Observable<Bool> = Observable(false)
    var cellDataSource: Observable<[MainCellViewModel]> = Observable(nil)
    var dataSource: Users?
    
    func numberOfSection() -> Int {
        return 1
    }
    
    func numberOfRows(_ section: Int) -> Int {
        dataSource?.count ?? 0
    }
    
    func getUsers() {
        isLoading.value = true
        
        NetworkDataFetch.shared.fetchUsers { [weak self] users, error in
            guard let self else { return }
            self.isLoading.value = false
            if let users {
                self.dataSource = users
                mapCellData()
            }
        }
    }
    
    func mapCellData() {
        cellDataSource.value = dataSource?.compactMap { MainCellViewModel($0) }
        
    }
}
