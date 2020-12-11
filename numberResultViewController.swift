//
//  numberResultViewController.swift
//  innateGenger
//
//  Created by Serena on 2020/12/4.
//

import UIKit
import WebKit

class numberResultViewController: UIViewController {
    
    var birthday:Date!
    @IBOutlet weak var webView: WKWebView!
    
    let lifeNumberNames = ["開創","協調","創意","務實","自由","關懷","探究","權威","智慧"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let number = calculateLifeNumber(date: birthday)
        title = "\(number) \(lifeNumberNames[number-1])數"

        if let url = URL(string: "https://www.ifreesite.com/numerology/a\(number).htm") {
        let request = URLRequest(url: url)
        webView.load(request)
        }

        // Do any additional setup after loading the view.
    }
    
    func calculateLifeNumber(date: Date) -> Int {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yMd"
        var numberString = dateFormatter.string(from: date)
        var sum = 0
        repeat {
            sum = 0
            for character in numberString {
                let number = Int(String(character))!
                sum = sum + number
            }
            numberString = "\(sum)"
        } while sum > 9
        return sum
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
