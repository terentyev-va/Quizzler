//
//  MainViewController.swift
//  Quizzler
//
//  Created by Вячеслав Терентьев on 09.07.2022.
//

import UIKit

class MainViewController: UIViewController {
    
    private let backgroundView: UIImageView = {
       let imageView = UIImageView()
        imageView.image = UIImage(named: "background")
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let questionlabel: UILabel = {
       let label = UILabel()
        label.font = UIFont(name: "AStamperRgBt", size: 24)
        label.numberOfLines = 0
        label.textAlignment = .center
        label.textColor = #colorLiteral(red: 0.921431005, green: 0.9214526415, blue: 0.9214410186, alpha: 1)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var firstButton: UIButton = {
        let button = UIButton(type: .system)
        settingButtons(button: button)
        return button
    }()
    
    private lazy var secondButton: UIButton = {
        let button = UIButton(type: .system)
        settingButtons(button: button)
        return button
    }()
    
    private lazy var thirdButton: UIButton = {
        let button = UIButton(type: .system)
        settingButtons(button: button)
        return button
    }()
        
    private let progressBar: UIProgressView = {
       let progressBar = UIProgressView()
        progressBar.progressViewStyle = .bar
        progressBar.setProgress(0.0, animated: false)
        progressBar.progressTintColor = .systemCyan
        progressBar.trackTintColor = .systemGray
        progressBar.translatesAutoresizingMaskIntoConstraints = false
        return progressBar
    }()
    
    private let buttonStackView: UIStackView = {
       let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 10
        stackView.distribution = .fill
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    private let scoreLabel: UILabel = {
       let label = UILabel()
        label.textColor = .white
        label.text = "Score: "
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    var quizBrain = QuizBrain()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViews()
        setConstraints()
        updateUI()
    }
    
    private func setupViews() {
        
        view.addSubview(backgroundView)
        view.addSubview(questionlabel)
        buttonStackView.addArrangedSubview(firstButton)
        buttonStackView.addArrangedSubview(secondButton)
        buttonStackView.addArrangedSubview(thirdButton)
        view.addSubview(buttonStackView)
        view.addSubview(progressBar)
        view.addSubview(scoreLabel)
    }
    
    private func settingButtons(button: UIButton) {
        button.addTarget(self, action: #selector(didTapButton), for: .touchUpInside)
        button.layer.cornerRadius = 10
        button.layer.borderColor = UIColor.white.cgColor
        button.layer.borderWidth = 2
        button.backgroundColor = .none
        button.titleLabel?.font = UIFont(name: "AStamperRgBt", size: 14)
        button.tintColor = .white
        button.translatesAutoresizingMaskIntoConstraints = false
    }
    
    @objc private func didTapButton(_ sender: UIButton) {
        
        let userAnswer = sender.currentTitle!
        let userGotItRight = quizBrain.checkAnswer(userAnswer)
        
        if userGotItRight {
//            sender.backgroundColor = .green
        } else {
            sender.shake()
        }
        
        quizBrain.nextQuestion()
        scoreLabel.text = "Правильные ответы: \(quizBrain.getScore())"

        Timer.scheduledTimer(timeInterval: 0.2,
                             target: self,
                             selector: #selector(updateUI),
                             userInfo: nil,
                             repeats: false)
    }
    
    @objc private func updateUI() {
        questionlabel.text = quizBrain.getQuestionText()
        firstButton.setTitle(quizBrain.getFirstButtonText(), for: .normal)
        secondButton.setTitle(quizBrain.getSecondButtonText(), for: .normal)
        thirdButton.setTitle(quizBrain.getThirdButtonText(), for: .normal)
        progressBar.progress = quizBrain.getProgress()
        scoreLabel.text = "Правильные ответы: \(quizBrain.getScore())"
        firstButton.backgroundColor = .clear
        secondButton.backgroundColor = .clear
    }
}

//MARK: - SetConstraints

extension MainViewController {
    
    private func setConstraints() {
        
        NSLayoutConstraint.activate([
            backgroundView.topAnchor.constraint(equalTo: view.topAnchor, constant: 0),
            backgroundView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
            backgroundView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
            backgroundView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0)
        ])
        
        NSLayoutConstraint.activate([
            questionlabel.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            questionlabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            questionlabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20)
        ])
        
        NSLayoutConstraint.activate([
            buttonStackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -30),
            buttonStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            buttonStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            firstButton.heightAnchor.constraint(equalToConstant: 50),
            secondButton.heightAnchor.constraint(equalToConstant: 50),
            thirdButton.heightAnchor.constraint(equalToConstant: 50)
        ])
        
        NSLayoutConstraint.activate([
            progressBar.topAnchor.constraint(equalTo: buttonStackView.bottomAnchor, constant: 15),
            progressBar.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            progressBar.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20)
        ])
        
        NSLayoutConstraint.activate([
            scoreLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10),
            scoreLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20)
        ])
    }
}
