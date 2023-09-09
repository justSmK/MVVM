//
//  MainCell.swift
//  MVVM
//
//  Created by Sergei Semko on 9/9/23.
//

import UIKit

final class MainCell: UITableViewCell {
    
    static var identifier: String {
        return String(describing: Self.self)
    }
    
    private let nameLabel = UILabel()
    private let emailLabel = UILabel()
    private var labelsStackView = UIStackView()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupLayout() {
        labelsStackView.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.font = .systemFont(ofSize: 16, weight: .regular)
        emailLabel.font = .systemFont(ofSize: 14, weight: .light)
        emailLabel.textColor = .gray
        
        
        labelsStackView.addArrangedSubview(nameLabel)
        labelsStackView.addArrangedSubview(emailLabel)
        
        labelsStackView.axis = .vertical
        labelsStackView.spacing = 2
        
        contentView.addSubview(labelsStackView)
        
        NSLayoutConstraint.activate([
            labelsStackView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            labelsStackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
        ])
    }
    
    func setupCell(viewModel: MainCellViewModel) {
        nameLabel.text = viewModel.name
        emailLabel.text = viewModel.email
    }
}
