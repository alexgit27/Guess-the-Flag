//
//  ViewController.swift
//  Guess the Flag
//
//  Created by Alexandr on 20.01.2021.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var button1: UIButton!
    @IBOutlet weak var button3: UIButton!
    @IBOutlet weak var button2: UIButton!
    
    var countries = [String]()
    var score = 0
    var correctAnswer = 0
    var questionsAsked = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        countries.append("estonia")
        countries.append("france")
        countries.append("germany")
        countries.append("ireland")
        countries.append("italy")
        countries.append("monaco")
        countries.append("nigeria")
        countries.append("poland")
        countries.append("russia")
        countries.append("spain")
        countries.append("uk")
        countries.append("us")
        
        button1.layer.borderWidth = 1
        button2.layer.borderWidth = 2
        button3.layer.borderWidth = 1
        
        button1.layer.borderColor = UIColor.lightGray.cgColor
        button2.layer.borderColor = UIColor(red: 0.9, green: 0.3, blue: 0.7, alpha: 0.4).cgColor
        button3.layer.borderColor = UIColor.lightGray.cgColor
        
        askQuestion()
        
    }
    func askQuestion(action: UIAlertAction! = nil) {
        countries.shuffle()
        
        correctAnswer = Int.random(in: 0...2)
        
        title = "\(countries[correctAnswer].uppercased()) Score: \(score)"
        
        button1.setImage(UIImage(named: countries[0]), for: .normal)
        button2.setImage(UIImage(named: countries[1]), for: .normal)
        button3.setImage(UIImage(named: countries[2]), for: .normal)
    }
    
    @IBAction func buttonTapped(_ sender: UIButton) {
        var title: String
        
        questionsAsked += 1
        
        if sender.tag == correctAnswer{
            title = "Correct"
            score += 1
        } else{
            title = "Wrong"
            score -= 1
        }
        
        if questionsAsked == 10{
            let ac = UIAlertController(title: "You answer on 10 questions. G", message: "You score: \(score)", preferredStyle: .alert)
            ac.addAction(UIAlertAction(title: "Start again.", style: .default, handler: askQuestion))
            score = 0
            present(ac, animated: true)
        }
        
        if title == "Correct"{
            let ac = UIAlertController(title: title, message: "Your score is: \(score)", preferredStyle: .alert)
            ac.addAction(UIAlertAction(title: "Continue", style: .default, handler: askQuestion))
            
            present(ac, animated: true)
        } else{
            let ac = UIAlertController(title: "\(title). It's flag: \(countries[sender.tag].uppercased())", message: "Your score is: \(score)", preferredStyle: .alert)
            ac.addAction(UIAlertAction(title: "Continue", style: .default, handler: askQuestion))
            
            present(ac, animated: true)
        }
    }
}

