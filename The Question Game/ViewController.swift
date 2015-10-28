//
//  ViewController.swift
//  The Question Game
//
//  Created by Ian Han on 10/28/15.
//  Copyright © 2015 Ian Han. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBAction func again() {
        reset()
        
    }
    @IBOutlet weak var button: UIButton!
    @IBOutlet weak var background: UIImageView!
    @IBOutlet weak var questionLabel: UILabel!

    func reset() {
        let randomQuestionsIndex = Int(arc4random_uniform(UInt32(questionsArray.count)))
        let randomColor = colorsArray[Int(arc4random_uniform(UInt32(colorsArray.count)))]
        let randomBackgroundImage = UIImage(named: "image\(arc4random_uniform(7) + 1).png")
        //background.image = randomBackgroundImage
        //questionLabel.text = String(questionsArray[randomQuestionsIndex])
        button.backgroundColor = randomColor
        UIView.transitionWithView(self.background,
            duration:0.5,
            options: UIViewAnimationOptions.TransitionCrossDissolve,
            animations: { self.background.image = randomBackgroundImage},
            completion: nil)
        UIView.transitionWithView(self.questionLabel, duration: 0.5, options: UIViewAnimationOptions.TransitionCrossDissolve, animations: { self.questionLabel.text = String(questionsArray[randomQuestionsIndex])}, completion: nil)
        
    }

    

    override func viewDidLoad() {
        super.viewDidLoad()
        reset()
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

