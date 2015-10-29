//
//  ViewController.swift
//  The Question Game
//
//  Created by Ian Han on 10/28/15.
//  Copyright © 2015 Ian Han. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    //button actions to get new quote, reset background, run transition, gain new color for button
    @IBAction func again() {
        reset()
    }
    
    //button reference
    @IBOutlet weak var button: UIButton!
    
    //background reference
    @IBOutlet weak var background: UIImageView!
    
    //quote label
    @IBOutlet weak var questionLabel: UILabel!

    
    //fundemental action on screen
    func reset() {
        
        //pick random number from the array, cast as Int, then assign to the constant
        let randomQuestionsIndex = Int(arc4random_uniform(UInt32(questionsArray.count)))
        let randomColor = colorsArray[Int(arc4random_uniform(UInt32(colorsArray.count)))]
        
        //since images are lazily labeld as image1,2,3,4,5 etc. we can use string interpolation to pick random backgroun image. Must change nuber everytime though. Should put in array to make flexible code
        let randomBackgroundImage = UIImage(named: "image\(arc4random_uniform(8) + 1).png")
        
        //Choose random color from colorsArray to show background of button
        button.backgroundColor = randomColor
        
        //transitions for both background (self.background) and for quote labels (self. questionLabel)
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

