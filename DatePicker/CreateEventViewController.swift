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
    
    var event: Event! {
        didSet {
            if event.willAttend {
                rsvpLabel.text = "RSVP YES"
                createEventButton.setTitle("View Event", for: .normal)
            } else {
                rsvpLabel.text = "RSVP NO"
                createEventButton.setTitle("RSVP to Event", for: .normal)
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        event = Event(name: "Event name not set", willAttend: false, date: Date()) //Date() pulls up current date and time
        eventTextField.delegate = self
        datePicker.minimumDate = Date()
        
    }

    @IBAction func datePickerChanged(_ sender: UIDatePicker) {
        event.date = sender.date
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
           print("prepare for segue")
           guard let detailViewController = segue.destination as? DetailViewController else {
               return
           }
           
           detailViewController.event = event
           
           //here is where we want to set up and pass the event data to the detail view controller
       }
    
}

extension CreateEventViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        event.name = eventTextField.text ?? ""
        return true
    }
}
