//
//  AddLocationViewController.swift
//  swift-LocationTrivia-DataStoreRelationships-lab
//
//  Created by Enrique Torrendell on 10/24/16.
//  Copyright © 2016 Flatiron School. All rights reserved.
//

import UIKit

class AddLocationViewController: UIViewController {

    @IBOutlet weak var nameField: UITextField!
    @IBOutlet weak var latitudeField: UITextField!
    @IBOutlet weak var longitudeField: UITextField!
    @IBOutlet weak var saveButton: UIButton!
    @IBOutlet weak var cancelButton: UIButton!
    
    var location: Location?
    
    @IBAction func saveButton(_ sender: UIButton) {
        LocationDataStore.shareInstance.locations.append(Location(name: nameField.text!, latitude: Float(latitudeField.text!)!, longitude: Float(longitudeField.text!)!))
        dismiss(animated: true, completion: nil)

    }
    
    @IBAction func cancelButton(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        nameField.accessibilityLabel = "nameField"
        nameField.accessibilityIdentifier = "nameField"
        
        latitudeField.accessibilityLabel = "latitudeField"
        latitudeField.accessibilityIdentifier = "latitudeField"
            
        longitudeField.accessibilityLabel = "longitudeField"
        longitudeField.accessibilityIdentifier = "longitudeField"
    
        saveButton.accessibilityLabel = "saveButton"
        saveButton.accessibilityIdentifier = "saveButton"
        
        cancelButton.accessibilityLabel = "cancelButton"
        cancelButton.accessibilityIdentifier = "cancelButton"
    
    }    
}
