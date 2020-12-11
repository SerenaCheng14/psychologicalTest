//
//  resultViewController.swift
//  innateGenger
//
//  Created by Serena on 2020/12/3.
//

import UIKit


class resultViewController: UIViewController {

    
    
    @IBOutlet weak var tittleLabel: UILabel!
    @IBOutlet weak var resultLabel: UILabel!
    @IBOutlet weak var resultImage: UIImageView!
    
    var index: Int?


    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let index = index {
            let answer = ANSWERS[index]
            tittleLabel.text = answer.title
            tittleLabel.adjustsFontSizeToFitWidth = true
            resultLabel.text = answer.description
            resultLabel.adjustsFontSizeToFitWidth = true
            resultImage.image = UIImage(named: "A\(index)")
        }
        // Do any additional setup after loading the view.
    }
    
    class Answer {
        let title: String
        let description: String
        
        init(title: String, description: String) {
            self.title = title
            self.description = description
        }
    }
    
    let ANSWERS = [Answer(title: "A型：100%女性", description: """
    你內心完全就是一個小女人，從生活細節就可以看出來，你輕聲細語、不會大聲嚷嚷，性格上也有軟弱、容易猶豫的一面，對你來說做一件事之前需要好好規劃，你也期待可以被人保護、受人肯定，期待有人可以溫柔的照顧你。
    """),
    Answer(title: "B型：70%男性、30%女性", description: """
    你個性上基本上偏男性、同時有些微的女性傾向，你渴望平靜且沒有是非的生活，同時你也愛好和平，不論這些人是不是你熟悉的人，你都不想與他產生紛爭與矛盾，你有著理智、且明理的思維邏輯，但你不喜歡與人計較，除非涉及原則、不然你很少浪費時間與精力與人爭論。
    """),
    Answer(title: "C型：50%男性、50%女性（中性）", description: """
    你是一個擁有中性內心的人，你討厭一成不變的生活模式，在你心中你很不願意服輸示弱、也很特驗末受成規，只要許可、你會盡全力去做出改變，這對你來說都是生活中不能缺少的經驗。
    """),
    Answer(title: "D型：30%男性、70%女性", description: """
    你的內在個性除了女性之外、有一點偏男性，在外人面前總是表現的很堅強，無論遇到什麼情況都用冷靜的心態與表情掩蓋自己的不安，隨著年齡增長，你也會越來越懂得保護自己，希望得到他人對你的肯定。
    """),
    Answer(title: "E型：100%男性", description: """
    你心理性別完全是強烈的男性，無論從言語、思想或行動上你是一個徹頭徹尾的強者，你不但希望能夠控制自己的命運、也渴望統治自己的生命和生活，你同時也有強烈的控制慾，你希望用自己的能力和努力來讓被你愛的人獲得更好的生活，就此來說、你是個很有責任感的人。
    """)
    
    ]


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */


}
