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
    
//    let eggTimes = ["Soft": 60, "Medium": 84, "Hard": 720]
    let eggTimes = ["Soft": 3, "Medium": 5, "Hard": 7]
    var secondsRemaining = 60
    var totalSeconds = 60
    var timer = Timer()
    
    let url = Bundle.main.url(forResource: "alarm_sound", withExtension: "mp3")
    var alarmPlayer: AVAudioPlayer!
    
    @IBOutlet weak var progressBar: UIProgressView!
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBAction func hardnessSelected(_ sender: UIButton) {
        timer.invalidate()
        
        progressBar.progress = 0.0
        
        let hardness = sender.currentTitle!
        totalSeconds = eggTimes[hardness]!
        secondsRemaining = eggTimes[hardness]!
        
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
    }
    
    @objc func updateTimer() {
        if secondsRemaining >= 0 {
            progressBar.trackTintColor = UIColor.systemGray
            titleLabel.text = String(secondsRemaining)
            
            // update progress bar
            progressBar.progress = 1 - (Float(secondsRemaining) / Float(totalSeconds))
            
            secondsRemaining -= 1
        } else {
            titleLabel.text = "Egg is done!"
            alarmPlayer = try! AVAudioPlayer(contentsOf: url!)
            alarmPlayer.play()
            timer.invalidate()
            let seconds = 3.5
            DispatchQueue.main.asyncAfter(deadline: .now() + seconds) {
                self.progressBar.trackTintColor = UIColor.white
                self.progressBar.progress = 0.0
                self.titleLabel.text = "How do you like your eggs?"
            }

        }
    }
}
