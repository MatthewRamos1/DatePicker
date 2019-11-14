//
//  DetailViewController.swift
//  DatePicker
//
//  Created by Matthew Ramos on 11/14/19.
//  Copyright © 2019 Matthew Ramos. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    
    var event: Event?
    //lazy variables arent created until the first time theyre initiated
    lazy var dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        formatter.timeStyle = .medium
        return formatter
    }() //calls the closure
    @IBOutlet weak var messageLabel: UILabel!
    @IBOutlet weak var selectedDataLabel: UILabel!
    @IBOutlet weak var switchControl: UISwitch!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
        // Do any additional setup after loading the view.
    }
    
    func updateUI() {
        guard let date = event?.date else {
            return
        }
        switchControl.isOn = event?.willAttend ?? false
        
        messageLabel.text = event?.name ?? "Event name not available"
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
