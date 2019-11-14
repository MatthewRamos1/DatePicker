//
//  ViewController.swift
//  DatePicker
//
//  Created by Matthew Ramos on 11/14/19.
//  Copyright © 2019 Matthew Ramos. All rights reserved.
//

import UIKit

class CreateEventViewController: UIViewController {

    @IBOutlet weak var eventTextField: UITextField!
    @IBOutlet weak var datePicker: UIDatePicker!
    @IBOutlet weak var createEventButton: UIButton!
    @IBOutlet weak var rsvpLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        eventTextField.delegate = self
        
    }

    @IBAction func datePickerChanged(_ sender: Any) {
    }
    
}

extension CreateEventViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}
