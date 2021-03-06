//
//  ViewController.swift
//  Project2
//
//  Created by Dan Johnson on 1/29/18.
//  Copyright © 2018 Evanta. All rights reserved.
//

import UIKit
import GameplayKit

class ViewController: UIViewController {
    @IBOutlet weak var button1: UIButton!
    @IBOutlet weak var button2: UIButton!
    @IBOutlet weak var button3: UIButton!
    @IBOutlet weak var button4: UIButton!
    @IBOutlet weak var scoreLabel: UILabel!
    
    var countries = [String]()
    var matchCountries = [String]()
    var score = 0
    var correctAnswer = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        countries += ["estonia", "france", "germany", "ireland", "italy", "monaco", "nigeria", "poland", "russia", "spain", "uk", "us"]
        button1.layer.borderWidth = 1
        button2.layer.borderWidth = 1
        button3.layer.borderWidth = 1
        button4.layer.borderWidth = 1
        button1.layer.borderColor = UIColor.lightGray.cgColor
        button2.layer.borderColor = UIColor.lightGray.cgColor
        button3.layer.borderColor = UIColor.lightGray.cgColor
        button4.layer.borderColor = UIColor.lightGray.cgColor
        askQuestion()
    }
    
    func askQuestion(action: UIAlertAction! = nil) {
        matchCountries = GKRandomSource.sharedRandom().arrayByShufflingObjects(in: countries) as! [String]
        button1.setImage(UIImage(named: matchCountries[0]), for: .normal)
        button2.setImage(UIImage(named: matchCountries[1]), for: .normal)
        button3.setImage(UIImage(named: matchCountries[2]), for: .normal)
        button4.setImage(UIImage(named: matchCountries[3]), for: .normal)
        correctAnswer = GKRandomSource.sharedRandom().nextInt(upperBound: 3)
        title = matchCountries[correctAnswer].uppercased()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func buttonTapped(_ sender: UIButton) {
        var title: String
        
        if sender.tag == correctAnswer {
            title = "Correct"
            score += 1
        } else {
            title = "Wrong"
            score -= 1
        }
        scoreLabel.text = "Score: \(score)"
        let ac = UIAlertController(title: title, message: "You picked \(matchCountries[sender.tag].uppercased()).", preferredStyle: .alert)
        ac.addAction(UIAlertAction(title: "Continue", style: .default, handler: askQuestion))
        present(ac, animated: true)
    }
    
}

