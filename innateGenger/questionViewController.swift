//
//  questionViewController.swift
//  innateGenger
//
//  Created by Serena on 2020/12/3.
//

import UIKit
import Foundation


class questionViewController: UIViewController {
    
    var question: Question?
    var index: Int?

    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet var selectionButton: [UIButton]!
    @IBOutlet weak var imageView: UIImageView!
    
    @IBAction func pressedSelectionButton(_ sender: UIButton) {
        
        if let question = question {
            let selection = question.selections[sender.tag]
            if let nextIndex = selection.nextQuestion {
                // update the view
                self.question = QUESTIONS[nextIndex]
                updateView(index: nextIndex, question: QUESTIONS[nextIndex])
            } else if let finalAnswer = selection.finalAnswer {
                // to the end
                performSegue(withIdentifier: "ResultSegue", sender: finalAnswer)
            }
        }
    }
    
    
    func updateView(index: Int, question: Question) {
            imageView.image = UIImage(named: "\(index)")
            questionLabel.text = question.description
            questionLabel.adjustsFontSizeToFitWidth = true
            let selections = question.selections
            for i in 0...selections.count-1 {
                selectionButton[i].setTitle(selections[i].text, for: .normal)
                selectionButton[i].tag = i
            }
        }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        if let index = index {
        let index = 0
            question = QUESTIONS[index]
            if let question = question {
                updateView(index: index, question: question)
            }
//        }
        // Do any additional setup after loading the view.
    }
    
//    override func didReceiveMemoryWarning() {
//           super.didReceiveMemoryWarning()
//     }
           // Dispose of any resources that can be recreated.


    
    class Question {
        let description: String
        let selections: [Selection]
        
        init(description: String, selections: [Selection]) {
            self.description = description
            self.selections = selections
        }
    }
    
    class Selection {
        let text: String
        let nextQuestion: Int?
        let finalAnswer: Int?
        
        init(text: String, nextQuestion: Int?, finalAnswer: Int?) {
            self.text = text
            self.nextQuestion = nextQuestion
            self.finalAnswer = finalAnswer
        }
    }
    


    
    let QUESTIONS = [Question(description: "買自己的電腦時，你會比較在意什麼?", selections: [Selection(text: "顯示器", nextQuestion: 1, finalAnswer: nil), Selection(text: "鍵盤", nextQuestion: 2, finalAnswer: nil), Selection(text: "滑鼠", nextQuestion: 3, finalAnswer: nil)]),
        Question(description: "你的衣櫃通常什麼時候開始換季?", selections: [Selection(text: "按日曆節氣來換", nextQuestion: 2, finalAnswer: nil), Selection(text: "季節快結束的時候", nextQuestion: 4, finalAnswer: nil), Selection(text: "熱（冷）到不得不換的時候", nextQuestion: 3, finalAnswer: nil)]),
        Question(description: "自己一個人的時候，你的坐姿是什麼?", selections: [Selection(text: "雙腿併攏在一起", nextQuestion: 5, finalAnswer: nil), Selection(text: "雙腿叉開", nextQuestion: 3, finalAnswer: nil), Selection(text: "完翹二郎腿、翹腳", nextQuestion: 4, finalAnswer: nil)]),
        Question(description: "遇到自己喜歡的人，你會怎麼做?", selections: [Selection(text: "等對方和自己告白", nextQuestion: 4, finalAnswer: nil), Selection(text: "單戀對方", nextQuestion: 5, finalAnswer: nil), Selection(text: "第一時間主動告白", nextQuestion: 6, finalAnswer: nil)]),
        Question(description: "你喜歡什麼材質的衣服?", selections: [Selection(text: "絲綢", nextQuestion: 5, finalAnswer: nil), Selection(text: "紗料", nextQuestion: 6, finalAnswer: nil), Selection(text: "棉質", nextQuestion: 7, finalAnswer: nil)]),
        Question(description: "自己做完飯後，廚房通常是什麼樣子?", selections: [Selection(text: "亂的慘不忍睹", nextQuestion: 6, finalAnswer: nil), Selection(text: "非常乾淨整潔", nextQuestion: 7, finalAnswer: nil), Selection(text: "有一點點凌亂", nextQuestion: 8, finalAnswer: nil)]),
        Question(description: "你對歷史戰爭題材的電視劇有什麼想法?", selections: [Selection(text: "特別帥", nextQuestion: 7, finalAnswer: nil), Selection(text: "很無語", nextQuestion: 8, finalAnswer: nil), Selection(text: "特別有吸引力", nextQuestion: 9, finalAnswer: nil)]),
        Question(description: "每次出門前，你最注重?", selections: [Selection(text: "自己是不是帶了要帶的東西", nextQuestion: 8, finalAnswer: nil), Selection(text: "自己的味道", nextQuestion: 9, finalAnswer: nil), Selection(text: "自己的髮型和穿著", nextQuestion: nil, finalAnswer: 2)]),
        Question(description: "你認為工作套裝或西裝是?", selections: [Selection(text: "莊重正式的服飾", nextQuestion: nil, finalAnswer: 3), Selection(text: "過於拘謹的服飾", nextQuestion: nil, finalAnswer: 4), Selection(text: "美麗的服飾", nextQuestion: nil, finalAnswer: 0)]),
        Question(description: "如果為自己的房子選顏色的話，你會選?", selections: [Selection(text: "紅色", nextQuestion: nil, finalAnswer: 1), Selection(text: "白色", nextQuestion: nil, finalAnswer: 2), Selection(text: "紫色", nextQuestion: nil, finalAnswer: 3)]),
        ]




    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
            if let destination = segue.destination as? resultViewController {
                if let answerIndex = sender as? Int {
                    destination.index = answerIndex
                }
            }
        }
    

}
