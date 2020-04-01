//
//  ViewController.swift
//  摇骰子
//
//  Created by zhu on 2020/3/27.
//  Copyright © 2020 zz. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var diceView: UIImageView!
    @IBOutlet weak var diceView2: UIImageView!
    @IBAction func dcie(_ sender: UIButton) {
        updateDice()
    }
    override func viewDidLoad() {
        super.viewDidLoad()
       updateDice()
    }
    override func motionEnded(_ motion: UIEvent.EventSubtype, with event: UIEvent?) {
        updateDice()
    }
    func updateDice() {
        let dice = Int.random(in: 1...6)
        let dice2 = Int.random(in: 1...6)
        diceView.image = UIImage(named: "dice\(dice)")
        diceView2.image = UIImage(named: "dice\(dice2)")
    }

}

