//
//  Model.swift
//  Learningjourney
//
//  Created by فالحه الغنامي on 25/04/1446 AH.
//


import Foundation
import SwiftUI

class LearningViewModel: ObservableObject {
    @Published var model = LearningModel()

    func updateLearningDuration(to duration: String) {
        model.learningDuration = duration
    }

    func updateInputText(to text: String) {
        model.inputText = text
    }
}
