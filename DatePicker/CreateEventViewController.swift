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
    
    //unwind segue
    //step 1 write ib action: segue parameter is required
    //step 2 type cast and get access to source
    //step 3 setup UI accordingly
    //step 4 drag action to exit icon in source
    @IBAction func updateUIFromUnwind(segue: UIStoryboardSegue) {
        guard let detailViewController = segue.source as? DetailViewController else {
            return
        }
        event = detailViewController.event
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
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
