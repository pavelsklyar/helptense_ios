//
//  IrregularVerb.swift
//  HelpTense
//
//  Created by Pavel Sklyar on 15.03.2020.
//  Copyright © 2020 Pavel Sklyar. All rights reserved.
//

import UIKit

struct IrregularVerb: Decodable {
    
    let firstForm: String
    let secondForm: String
    let thirdForm: String
    
    let firstFormExampleSingle: String
    let firstFormExampleMultiple: String
    let firstFormExampleNegative: String
    
    let secondFormExampleSingle: String
    let secondFormExampleMultiple: String
    let secondFormExampleNegative: String
    
    let thirdFormExampleSingle: String
    let thirdFormExampleMultiple: String
    let thirdFormExampleNegative: String
    
    let translate: String
    let transcription: String
    
    enum CodingKeys: String, CodingKey {
        
        case firstForm = "first_form"
        case secondForm = "second_form"
        case thirdForm = "third_form"
        
        case firstFormExampleSingle = "first_form_example_single"
        case firstFormExampleMultiple = "first_form_example_multiple"
        case firstFormExampleNegative = "first_form_example_negative"
        
        case secondFormExampleSingle = "second_form_example_single"
        case secondFormExampleMultiple = "second_form_example_multiple"
        case secondFormExampleNegative = "second_form_example_negative"
        
        case thirdFormExampleSingle = "third_form_example_single"
        case thirdFormExampleMultiple = "third_form_example_multiple"
        case thirdFormExampleNegative = "third_form_example_negative"
        
        case translate
        case transcription
    }
}
