//
//  ResultViewController.swift
//  Quizzler
//
//  Created by Вячеслав Терентьев on 10.07.2022.
//

import UIKit

class ResultViewController: UIViewController {
    
    private let backgroundView: UIImageView = {
       let imageView = UIImageView()
        imageView.image = UIImage(named: "detailViewBackground")
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let infoView: UIView = {
       let view = UIView()
        view.backgroundColor = .black
        view.alpha = 0.7
        view.layer.cornerRadius = 16
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let finishTestLabel: UILabel = {
       let label = UILabel()
        label.font = UIFont(name: "AStamperRgBt", size: 24)
        label.numberOfLines = 0
        label.text = "Вы завершили тест"
        label.textAlignment = .center
        label.textColor = #colorLiteral(red: 0.921431005, green: 0.9214526415, blue: 0.9214410186, alpha: 1)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
     var resultLabel: UILabel = {
       let label = UILabel()
        label.textColor = #colorLiteral(red: 0.921431005, green: 0.9214526415, blue: 0.9214410186, alpha: 1)
        label.font = UIFont(name: "AStamperRgBt", size: 22)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var tryAgainButton: UIButton = {
        let button = UIButton(type: .system)
        button.layer.cornerRadius = 10
        button.titleLabel?.font = UIFont(name: "AStamperRgBt", size: 14)
        button.tintColor = .white
        button.setTitle("Ещё раз?", for: .normal)
        button.layer.borderColor = UIColor.white.cgColor
        button.layer.borderWidth = 2
        button.backgroundColor = .none
        button.addTarget(self, action: #selector(tryAgainButtonTaped), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    var score = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViews()
        setConstraints()
        updateLabel()
    }
    
    private func setupViews() {
        view.backgroundColor = .black
        
        view.addSubview(backgroundView)
        view.addSubview(infoView)
        view.addSubview(finishTestLabel)
        view.addSubview(resultLabel)
        view.addSubview(tryAgainButton)
    }
    
    private func updateLabel() {
        resultLabel.text = "Ваш результат: \(score)"
    }
    
    @objc private func tryAgainButtonTaped() {
        dismiss(animated: true)
    }
}

//MARK: - SetConstraints

extension ResultViewController {
    
    private func setConstraints() {
        
        NSLayoutConstraint.activate([
            backgroundView.topAnchor.constraint(equalTo: view.topAnchor, constant: 0),
            backgroundView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
            backgroundView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
            backgroundView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0)
        ])
        
        NSLayoutConstraint.activate([
            finishTestLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            finishTestLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 40)
        ])
        
        NSLayoutConstraint.activate([
            infoView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            infoView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            infoView.heightAnchor.constraint(equalToConstant: 100),
            infoView.widthAnchor.constraint(equalToConstant: 300)
        ])
        
        NSLayoutConstraint.activate([
            resultLabel.centerYAnchor.constraint(equalTo: infoView.centerYAnchor),
            resultLabel.centerXAnchor.constraint(equalTo: infoView.centerXAnchor),
        ])
        
        NSLayoutConstraint.activate([
            tryAgainButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -20),
            tryAgainButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            tryAgainButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            tryAgainButton.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
}
