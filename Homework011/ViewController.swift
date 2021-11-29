//
//  ViewController.swift
//  Homework011
//
//  Created by Chun-Yi Lin on 2021/11/27.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var upImageView: CurtainImageView!
    @IBOutlet weak var downImageView: UIImageView!
    @IBOutlet weak var upSegmentController: UISegmentedControl!
    @IBOutlet weak var downSegmentController: UISegmentedControl!
    @IBOutlet weak var sentanceLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var printDatePicker: UIDatePicker!
    @IBOutlet weak var keyInTextField: UITextField!
    
    
    let photoImages = ["Flying", "Creation", "Dinner", "Tahiti"]
    let dateFormatter = DateFormatter()
    var upSelectedNumber : Int = 0
    var downSelectedNumber : Int = 0
    var timer : Timer?

    override func viewDidLoad() {
        super.viewDidLoad()
        syncNumber ()
    }
    
    func syncNumber () {
        keyInTextField.resignFirstResponder()
        upImageView.image = UIImage(named: photoImages[upSelectedNumber])
        downImageView.image = UIImage(named: photoImages[downSelectedNumber])
        upSegmentController.selectedSegmentIndex = upSelectedNumber
        downSegmentController.selectedSegmentIndex = downSelectedNumber
    }
    
    @IBAction func upSegmentChange(_ sender: UISegmentedControl) {
        upSelectedNumber = sender.selectedSegmentIndex
        syncNumber ()
    }
    
    @IBAction func downSegmentChange(_ sender: UISegmentedControl) {
        downSelectedNumber = sender.selectedSegmentIndex
        syncNumber ()
        
    }

    @IBAction func sentanceTextKeyIn(_ sender: UITextField) {
        sentanceLabel.text = sender.text
    }
    
    @IBAction func randomSwitchClicked(_ sender: UISwitch) {
        if sender.isOn {
                upSelectedNumber = Int.random(in: 0...photoImages.count-1)
                downSelectedNumber = Int.random(in: 0...photoImages.count-1)
        } else {
            upSelectedNumber = 0
            downSelectedNumber = 0
        }
        syncNumber ()
    }
    
    @IBAction func photoDatePicker(_ sender: UIDatePicker) {
        let preFormatDate = sender.date
        dateFormatter.dateFormat = "yyyy"
        let postFormatDate = dateFormatter.string(from: preFormatDate)
        dateLabel.text = "\(postFormatDate)"
    }
    
}

