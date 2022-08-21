//
//  Question.swift
//  Quizzler-iOS13
//
//  Created by Alan Trieu on 21/8/2022.
//  Copyright © 2022 The App Brewery. All rights reserved.
//

import Foundation

struct Question {
    let text: String
    let a: [String]
    let correctAnswer: String
    
    init(q: String, a: [String], correctAnswer: String) {
        self.text = q
        self.a = a
        self.correctAnswer = correctAnswer
    }
}
