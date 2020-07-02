//
//  VerbController.swift
//  HelpTense
//
//  Created by Pavel Sklyar on 14.03.2020.
//  Copyright © 2020 Pavel Sklyar. All rights reserved.
//

import UIKit
import Alamofire

class VerbController: UIViewController {
    
    var firstFormFromSearch: String!

    @IBOutlet weak var verb: UILabel!
    @IBOutlet weak var translate: UILabel!
    
    @IBOutlet weak var firstForm: UILabel!
    @IBOutlet weak var secondForm: UILabel!
    @IBOutlet weak var thirdForm: UILabel!
    
    @IBOutlet weak var firstFormSingle: UILabel!
    @IBOutlet weak var secondFormSingle: UILabel!
    @IBOutlet weak var thirdFormSingle: UILabel!
    
    @IBOutlet weak var firstFormMultiple: UILabel!
    @IBOutlet weak var secondFormMultiple: UILabel!
    @IBOutlet weak var thirdFormMultiple: UILabel!
    
    @IBOutlet weak var firstFormNegative: UILabel!
    @IBOutlet weak var secondFormNegative: UILabel!
    @IBOutlet weak var thirdFormNegative: UILabel!
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
    
        self.title = self.firstFormFromSearch
        
        getVerb(firstFormFromSearch ?? "") {
            irregularVerb in
            
            self.verb.text = irregularVerb.firstForm
            self.translate.text = "[" + irregularVerb.transcription + "] " + irregularVerb.translate
            
            self.firstForm.text = irregularVerb.firstForm
            self.secondForm.text = irregularVerb.secondForm
            self.thirdForm.text = irregularVerb.thirdForm
            
            self.firstFormSingle.text = irregularVerb.firstFormExampleSingle
            self.secondFormSingle.text = irregularVerb.secondFormExampleSingle
            self.thirdFormSingle.text = irregularVerb.thirdFormExampleSingle
            
            self.firstFormMultiple.text = irregularVerb.firstFormExampleMultiple
            self.secondFormMultiple.text = irregularVerb.secondFormExampleMultiple
            self.thirdFormMultiple.text = irregularVerb.thirdFormExampleMultiple
            
            self.firstFormNegative.text = irregularVerb.firstFormExampleNegative
            self.secondFormNegative.text = irregularVerb.secondFormExampleNegative
            self.thirdFormNegative.text = irregularVerb.thirdFormExampleNegative
        }
    }
    
    func getVerb(_ first_form: String, completion: @escaping (IrregularVerb) -> Void) {
        
        guard let verb = first_form.data(using: .utf8) else { fatalError() }
        
//        AF.
        AF.request("http://helptense.test/api/irregular/",
                   method: .get,
                   parameters: ["verb": verb],
                   encoder: JSONParameterEncoder.default).response { response in
            switch response.result {
            case .success(let data):
                guard let data = data else { return }
                let str = String(data: data, encoding: .utf8)
                print(str!)
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
        
    }
}
