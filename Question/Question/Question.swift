//
//  Question.swift
//  Question
//
//  Created by zhu on 2020/3/29.
//  Copyright © 2020 zz. All rights reserved.
//

import Foundation

class Question {
    let questionText: String
    let correctAnswer: Bool
    
    init(question:String,answer:Bool) {
        questionText = question
        correctAnswer = answer
    }
    
}
