//
//  ViewController.swift
//  Question
//
//  Created by zhu on 2020/3/29.
//  Copyright © 2020 zz. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    let question = [
    Question(question: "马云是中国首富", answer: true),
    Question(question: "刘强东最早是在中关村卖光盘的", answer: true),
    Question(question: "苹果公司是目前世界上最牛的科技公司", answer: true),
    Question(question: "只要坚持下去就能学好代码吗", answer: true),
    Question(question: "王思聪是80后", answer: true),
    Question(question: "在国内可以正常访问google.com吗", answer: false),
    Question(question: "敲完1万行代码之后可以成为编程高手吗", answer: true),
    Question(question: "撒贝宁说过清华还行吗", answer: false),
    Question(question: "一直听复昕学堂lebus的课可以变成大牛吗", answer: true),
    Question(question: "网上说苹果不好用安卓好用的人大多数都是水军吗", answer: true),
    Question(question: "豆瓣网是一个和你分享刚编的故事的网站吗", answer: false),
    Question(question: "优酷比B站牛", answer: false),
    Question(question: "我帅吗？", answer: true)
    ]
    var questionNum = 0
    var score = 0
    
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var progressLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var progressBar: UIProgressView!
    @IBAction func answerButton(_ sender: UIButton) {
        
        next(sender.tag)
        progressLabel.text = "\(questionNum + 1)/13"
        progressBar.progress = (1/13) * Float(questionNum + 1)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        questionLabel.text = question[0].questionText
    }
    func next(_ tag:Int) {
        if tag == 1{
            if question[questionNum].correctAnswer{
                ProgressHUD.showSuccess("答对了")
                scoreLabel.text = "Score:\(score += 1)"
            }else{
                ProgressHUD.showError("答错了")
            }
        }
        if tag == 2{
            if question[questionNum].correctAnswer{
                ProgressHUD.showError("答错了")
            }else{
                ProgressHUD.showSuccess("答对了")
                scoreLabel.text = "Score:\(score += 1)"
            }
        }
        scoreLabel.text = "Score:\(score)"
        questionNum += 1
        if questionNum >= 13 {
            questionNum = 0
            score = 0
            //结束后加一个弹窗
            let alert = UIAlertController(title: "恭喜", message: "全部回答完了,", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "返回", style: .default, handler: { (_) in
                self.questionLabel.text = self.question[0].questionText
            }))
            present(alert, animated: true, completion: nil)
       
        
        }
          questionLabel.text = question[questionNum].questionText
}

}
