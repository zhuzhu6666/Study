//
//  ViewController.swift
//  木琴
//
//  Created by zhu on 2020/3/27.
//  Copyright © 2020 zz. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    //创建一个播放器
    var player: AVAudioPlayer!
    

    @IBAction func piano(_ sender: UIButton) {
      let num = sender.tag
      play(num)
    }
    func play(_ num1:Int){
        let num = Bundle.main.url(forResource: "note\(num1)", withExtension: "wav")
         do{
             player = try AVAudioPlayer(contentsOf: num!)
             player.play()
         }catch{
                  print("error")
          }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
    }


}

