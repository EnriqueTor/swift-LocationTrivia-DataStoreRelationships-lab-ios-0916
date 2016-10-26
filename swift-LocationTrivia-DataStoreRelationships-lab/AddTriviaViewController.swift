//
//  AddTriviaViewController.swift
//  swift-LocationTrivia-DataStoreRelationships-lab
//
//  Created by Enrique Torrendell on 10/26/16.
//  Copyright © 2016 Flatiron School. All rights reserved.
//

import UIKit

class AddTriviaViewController: UIViewController {

    @IBOutlet weak var textTrivia: UITextField!
    @IBOutlet weak var saveTrivia: UIButton!
    @IBOutlet weak var cancelTrivia: UIButton!
    
    var location: Location?
    
    @IBAction func saveButton(_ sender: UIButton) {
        location?.trivia.append(Trivium(content: textTrivia.text!, likes: 0))
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func cancelButton(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        textTrivia.accessibilityLabel = "Trivium Text Field"
        textTrivia.accessibilityIdentifier = "Trivium Text Field"
        
        saveTrivia.accessibilityLabel = "Save Button"
        saveTrivia.accessibilityIdentifier = "Save Button"
        
        cancelTrivia.accessibilityLabel = "Cancel Button"
        cancelTrivia.accessibilityIdentifier = "Cancel Button"
        
    }
}
