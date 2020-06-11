//
//  ViewController.swift
//  Project2
//
//  Created by אדיר נוימן on 10/06/2020.
//  Copyright © 2020 Adir Noyman. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet var button1: UIButton!
    @IBOutlet var button2: UIButton!   
    @IBOutlet var button3: UIButton!
    
    var countries = [String]()
    var score = 0
    var correctAnswer = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        countries += ["Estonia","France","Italy","US","UK","Germany","Poland","Russia","Ireland","Spain", "Nigeria","Monaco"]
        
        button1.layer.borderWidth = 1
        button2.layer.borderWidth = 1
        button3.layer.borderWidth = 1
        
        button1.layer.borderColor = UIColor.lightGray.cgColor
        button2.layer.borderColor = UIColor.lightGray.cgColor
        button3.layer.borderColor = UIColor.lightGray.cgColor
        
        askQuestion()
        
    }
    
    func askQuestion(action: UIAlertAction! = nil) {
        
        countries.shuffle()
        correctAnswer = Int.random(in: 0...2)
        
        button1.setImage(UIImage(named: countries[0].lowercased()), for: .normal)
        button2.setImage(UIImage(named: countries[1].lowercased()), for: .normal)
        button3.setImage(UIImage(named: countries[2].lowercased()), for: .normal)
        
        title = countries[correctAnswer].uppercased()
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
        
        let ac = UIAlertController(title: title, message: "Your score is \(score) points", preferredStyle: .alert)
        
        ac.addAction(UIAlertAction(title: "Continue", style: .default, handler: askQuestion))
        
        present(ac, animated: true)
    }
    


}

