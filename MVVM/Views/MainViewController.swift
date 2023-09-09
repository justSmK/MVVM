//
//  MainViewController.swift
//  MVVM
//
//  Created by Sergei Semko on 9/9/23.
//

import UIKit

final class MainViewController: UIViewController {
    
    let tableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    
    let activityIndicator = UIActivityIndicatorView(style: .large)
    
    var viewModel = MainViewModel()
    
    var cellDataSource = [MainCellViewModel]()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupLayout()
        setupConstraints()
        setupTableView()
        
        bindViewModel()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        viewModel.getUsers()
    }

    private func bindViewModel() {
        viewModel.isLoading.bind { [weak self] isLoading in
            guard let self, let isLoading else { return }
            DispatchQueue.main.async {
                isLoading ? self.activityIndicator.startAnimating() : self.activityIndicator.stopAnimating()
            }
        }
        
        viewModel.cellDataSource.bind { [weak self] users in
            guard let self, let users else { return }
            cellDataSource = users
            reloadTableView()
        }
    }
    
    func presentDetailsViewController(user: User) {
        let detailViewModel = DetailViewModel(user: user)
        let detailViewController = DetailsViewController(detailViewModel)
        navigationController?.pushViewController(detailViewController, animated: true)
    }

}


private extension MainViewController {
    func setupLayout() {
        view.backgroundColor = .systemBackground
        title = "Main Screen"
        
        view.addSubview(tableView)
        
        activityIndicator.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(activityIndicator)
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            
            activityIndicator.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            activityIndicator.centerYAnchor.constraint(equalTo: view.centerYAnchor),
        ])
    }
}
