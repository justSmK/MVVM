//
//  DetailsViewController.swift
//  MVVM
//
//  Created by Sergei Semko on 9/9/23.
//

import UIKit

final class DetailsViewController: UIViewController {
    
    private let nameLabel = UILabel()
    private let usernameLabel = UILabel()
    private let emailLabel = UILabel()
    private let phoneLabel = UILabel()
    
    private let streetLabel = UILabel()
    private let suiteLabel = UILabel()
    private let cityLabel = UILabel()
    
    private var labelsStackView = UIStackView()
    
    let detailsViewModel: DetailViewModel
    
    init(_ detailViewModel: DetailViewModel) {
        self.detailsViewModel = detailViewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupLayout()
        setupConstraints()
        displayUserInfo()
    }
    
    private func displayUserInfo() {
        nameLabel.text = detailsViewModel.name
        usernameLabel.text = detailsViewModel.username
        emailLabel.text = detailsViewModel.email
        phoneLabel.text = detailsViewModel.phone
        
        streetLabel.text = detailsViewModel.street
        suiteLabel.text = detailsViewModel.suite
        cityLabel.text = detailsViewModel.city
    }
    
}


private extension DetailsViewController {
    func setupLayout() {
        title = "User Details"
        view.backgroundColor = .systemBackground
        
        labelsStackView = UIStackView(
            arrangedSubviews: [
                nameLabel,
                usernameLabel,
                emailLabel,
                phoneLabel,
                streetLabel,
                suiteLabel,
                cityLabel
            ]
        )
        
        labelsStackView.axis = .vertical
        labelsStackView.spacing = 2
        labelsStackView.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(labelsStackView)
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            labelsStackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            labelsStackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
        ])
    }
}
