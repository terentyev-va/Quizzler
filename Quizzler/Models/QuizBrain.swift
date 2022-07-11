//
//  QuizBrain.swift
//  Quizzler
//
//  Created by Вячеслав Терентьев on 09.07.2022.
//

import Foundation
import UIKit

struct QuizBrain {
    
    let quiz = [ Question(text: "На какую песню Metallica записала первый видеоклип",
                          answer: ["One", "Seek And Destroy", "The Unforgiven"],
                          correctAnswer: "One"),
                 Question(text: "Как называется второй студийный альбом группы",
                          answer: ["Master Of Puppets", "Load", "Ride The Lighting"],
                          correctAnswer: "Ride The Lighting"),
                 Question(text: "В каком году была основана группа",
                          answer: ["1983", "1981", "1980"],
                          correctAnswer: "1981"),
                 Question(text: "Как называется первая баллада написанная группой",
                          answer: ["Fade To Black", "The Unforgiven", "Mama Said"],
                          correctAnswer: "Fade To Black"),
                 Question(text: "В каком году Metallica выступала на фестивале Монстры рока на поле аэродрома Тушино в Москве",
                          answer: ["1993", "1991", "1996"],
                          correctAnswer: "1991"),
                 Question(text: "Какая композиция группы прозвучала в финальной серии сериала Очень странные дела",
                          answer: ["The Day That Never Comes", "Enter Sandman", "Master Of Puppets"],
                          correctAnswer: "Master Of Puppets"),
                 Question(text: "Какой материал использовал Джеймс Хэтфилд для создания гитары Карл",
                          answer: ["Из гаража", "Махагони из Амозонии", "Редкое красное дерево из Америки"],
                          correctAnswer: "Из гаража"),
                 Question(text: "С какой певицей выступали Metallica на премии Грэмми",
                          answer: ["Эми Уайнхаус", "Лили Ален", "Леди Гага"],
                          correctAnswer: "Леди Гага"),
                 Question(text: "В каком городе зародилась Metallica",
                          answer: ["Сан-Франциско", "Детроит", "Лос-Анджелес"],
                          correctAnswer: "Лос-Анджелес"),
                 Question(text: "С каким продюссером группа записал одноименный альбом Metallica (Balck)",
                          answer: ["Боб Рок", "Флеминг Расмуссен", "Рик Рубин"],
                          correctAnswer: "Боб Рок")
                 
    ]
    
    var questionNumber = 0
    var score = 0
    
    mutating func checkAnswer(_ userAnswer: String) -> Bool {
        if userAnswer == quiz[questionNumber].correctAnswer {
            score += 1
            return true
        } else {
            return false
        }
    }
    
    func getQuestionText() -> String {
        return quiz[questionNumber].text
    }
    
    func getFirstButtonText() -> String {
        return quiz[questionNumber].answer[0]
    }
    
    func getSecondButtonText() -> String {
        return quiz[questionNumber].answer[1]
    }
    
    func getThirdButtonText() -> String {
        return quiz[questionNumber].answer[2]
    }
    
    func getProgress() -> Float {
        let progress = Float(questionNumber + 1) / Float(quiz.count)
        return progress
    }
}
