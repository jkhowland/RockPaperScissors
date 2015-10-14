//
//  ViewController.swift
//  RockPaperScissors
//
//  Created by Joshua Howland on 10/14/15.
//  Copyright © 2015 devmounta.in. All rights reserved.
//

import UIKit
import Darwin

enum Play: Int {
    case Rock = 0
    case Paper = 1
    case Scissors = 2
    
    var description: String {
        switch self {
        case .Rock:
            return "Rock"
        case .Paper:
            return "Paper"
        case .Scissors:
            return "Scissors"
            
        }
    }
}

class ViewController: UIViewController {

    @IBOutlet var computerPlay: UILabel!

    @IBAction func selectedRPS(sender: AnyObject) {

        
        if let play: Play = Play(rawValue: sender.tag) {
            playComputer(play)

            switch play {
            case .Scissors:
                break;
            case .Rock:
                break;
            case .Paper:
                break;
            }
        }
        
    }
    
    func playComputer(userPlay: Play) {
    
        var randomPlay = Int(arc4random_uniform(3))
        
        let quality: Float = 0.2;
        let play = Float(Float(arc4random()) / Float(UINT32_MAX))
       
        if play > (1 - quality) {
            randomPlay = self.winningPlay(userPlay).rawValue
        }
        
        // If quality == 1, then choice is entirely decided by players play
        // If quality == 0, then choice is entirely random

        // Random 0-1, result is greater than quality = play winning

        if let play: Play = Play(rawValue: randomPlay) {
            computerPlay.text = play.description
        }
    }
    
    func winningPlay(play: Play) -> Play {
    
        switch play {
        case .Scissors:
            return Play.Rock
        case .Rock:
            return Play.Paper
        case .Paper:
            return Play.Scissors
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

