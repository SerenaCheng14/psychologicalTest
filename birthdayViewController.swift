//
//  birthdayViewController.swift
//  innateGenger
//
//  Created by Serena on 2020/12/4.
//

import UIKit

class birthdayViewController: UIViewController {

    @IBOutlet weak var datePicker: UIDatePicker!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBSegueAction func showResult(_ coder: NSCoder) -> numberResultViewController? {
        let controller = numberResultViewController(coder:coder)
        controller?.birthday = datePicker.date
        
        return controller
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
