//
//  ResultViewController.swift
//  Quizzler
//
//  Created by Вячеслав Терентьев on 10.07.2022.
//

import UIKit

class ResultViewController: UIViewController {
    
    private let infoView: UIView = {
       let view = UIView()
        view.backgroundColor = .gray
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let resultLabel: UILabel = {
       let label = UILabel()
        label.text = "Ваш результат"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var tryAgainButton: UIButton = {
        let button = UIButton(type: .system)
        button.layer.cornerRadius = 10
        button.setTitle("Try again", for: .normal)
        button.backgroundColor = .purple
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViews()
        setConstraints()
    }
    
    private func setupViews() {
        view.backgroundColor = .white
        
        view.addSubview(infoView)
        infoView.addSubview(resultLabel)
        
        view.addSubview(tryAgainButton)
    }
}

extension ResultViewController {
    
    private func setConstraints() {
        
        NSLayoutConstraint.activate([
            infoView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            infoView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            infoView.heightAnchor.constraint(equalToConstant: 200),
            infoView.widthAnchor.constraint(equalToConstant: 300)
        ])
        
        NSLayoutConstraint.activate([
            resultLabel.topAnchor.constraint(equalTo: infoView.topAnchor, constant: 70),
            resultLabel.centerXAnchor.constraint(equalTo: infoView.centerXAnchor)
        ])
        
        NSLayoutConstraint.activate([
            tryAgainButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -20),
            tryAgainButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            tryAgainButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            tryAgainButton.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
}
