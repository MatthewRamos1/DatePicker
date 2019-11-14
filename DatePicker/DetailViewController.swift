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

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        print("prepare for segue")
        
        //here is where we want to set up and pass the event data to the detail view controller
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
