//
//  ViewController.swift
//  Destini-iOS13
//
//  Created by Angela Yu on 08/08/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var storyLabel: UILabel!
    @IBOutlet weak var choice1Button: UIButton!
    @IBOutlet weak var choice2Button: UIButton!
    
    var storyBrain = StoryBrain()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        storyLabel.text = storyBrain.getStory()
        choice1Button.setTitle(storyBrain.getChoices()[0], for: .normal)
        choice2Button.setTitle(storyBrain.getChoices()[1], for: .normal)

    }
    
    @IBAction func choiceMade(_ sender: UIButton) {
        storyBrain.nextStory(sender.currentTitle!)
        
        updateUI()
    }
    
    // updates label and buttons with next story
    func updateUI() {
        storyLabel.text = storyBrain.getStory()
        choice1Button.setTitle(storyBrain.getChoices()[0], for: .normal)
        choice2Button.setTitle(storyBrain.getChoices()[1], for: .normal)
    }


}

