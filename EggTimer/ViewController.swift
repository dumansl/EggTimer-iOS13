//
//  ViewController.swift
//  EggTimer
//
//  Created by Angela Yu on 08/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit
import AVFoundation


class ViewController: UIViewController {
    // let softTime = 5
    // let mediumTime = 7
    // let hardTime = 12
    
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var progressBar: UIProgressView!
    
    let eggTimes = ["Soft" : 3, "Medium": 4 , "Hard": 7]
    var timer = Timer()
    var totalTime = 0
    var secondPassed = 0
    var player: AVAudioPlayer!
    
    @IBAction func hardnessSelected(_ sender: UIButton) {
        //let senderTitle = sender.currentTitle!
        // let result = eggTimes[senderTitle]!
        // print(result)
        /*
        if senderTitle == "Soft" {
            print(softTime)
        } else if senderTitle == "Medium" {
            print(mediumTime)
        } else if senderTitle == "Hard" {
            print(hardTime)
        }
        */
        /*
        for i in eggTimes {
            if i.key == senderTitle {
                print(i.value)
            }
        }
         */
        timer.invalidate()
        let hardness = sender.currentTitle!
        totalTime = eggTimes[hardness]!
        
        progressBar.progress = 0
        secondPassed = 0
        titleLabel.text = hardness
  
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
    }
    
    func playSound() {
        let url = Bundle.main.url(forResource: "alarm_sound", withExtension: "mp3")
        player = try! AVAudioPlayer(contentsOf: url!)
        player.play()
                
    }
    
    @objc func updateTimer() {
        if secondPassed < totalTime {
            secondPassed += 1
            progressBar.progress = Float(secondPassed) / Float(totalTime)
           
        }else{
            titleLabel.text = "Done!"
            playSound()
        }
    }
}
