//
//  ViewController.swift
//  BillOrSteve
//
//  Created by James Campagno on 6/8/16.
//  Copyright © 2016 Flatiron School. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var counterLabel: UILabel!
    
    @IBOutlet weak var factLabel: UILabel!
    
    @IBOutlet weak var billLabel: UILabel!

    @IBOutlet weak var steveLabel: UILabel!
    
    @IBAction func billButton(_ sender: AnyObject) {
        switch currentFactInfo.0 == "Bill Gates" {
        case true:
            counter += 1
            counterLabel.text = String(counter)
            factLabel.text = showFact()
        default:
            factLabel.text = showFact()
        }
    }
    
    @IBAction func steveButton(_ sender: AnyObject) {
        switch currentFactInfo.0 == "Steve Jobs" {
        case true:
            counter += 1
            counterLabel.text = String(counter)
            factLabel.text = showFact()
        default:
            factLabel.text = showFact()
        }
    }
    
    
    
    
    
    var billAndSteveFacts: [String : [String]] = [:]
    
    var counter = 0
    
    var currentFactInfo = ("","")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        createFacts()
        print("AllFActs:\(billAndSteveFacts)")
        currentFactInfo = getRandomFact()
        print(currentFactInfo)
        factLabel.text = currentFactInfo.1
    }
   
    func createFacts() {
        
        let billFacts = ["He aimed to become a millionaire by the age of 30. However, he became a billionaire at 31.",
            "He scored 1590 (out of 1600) on his SATs.",
            "His foundation spends more on global health each year than the United Nation's World Health Organization.",
            "The private school he attended as a child was one of the only schools in the US with a computer. The first program he ever used was a tic-tac-toe game.",
            "In 1994, he was asked by a TV interviewer if he could jump over a chair from a standing position. He promptly took the challenge and leapt over the chair like a boss."]
        let steveFacts = ["He took a calligraphy course, which he says was instrumental in the future company products' attention to typography and font.",
                         "Shortly after being shooed out of his company, he applied to fly on the Space Shuttle as a civilian astronaut (he was rejected) and even considered starting a computer company in the Soviet Union.",
                         "He actually served as a mentor for Google founders Sergey Brin and Larry Page, even sharing some of his advisers with the Google duo.",
                         "He was a pescetarian, meaning he ate no meat except for fish."]
        
        billAndSteveFacts["Bill Gates"] = billFacts
        billAndSteveFacts["Steve Jobs"] = steveFacts
    }
    
    func getRandomFact() -> (String,String) {
        var factResult: String = ""
        let billOrSteve = randomPerson()
        print(billOrSteve)
        if let billOrSteveFacts = billAndSteveFacts[billOrSteve] {
            factResult = billOrSteveFacts[randomIndex(fromArray: billOrSteveFacts)]
        }
        currentFactInfo = (billOrSteve,factResult)
        return (currentFactInfo.0,currentFactInfo.1)
    }
    
    
    
    // Helper Functions
    func randomIndex(fromArray array: [String]) -> Int {
        return Int(arc4random_uniform(UInt32(array.count)))
    }
    
    func randomPerson() -> String {
        let randomNumber = arc4random_uniform(2)
        
        if randomNumber == 0 {
            return "Steve Jobs"
        } else {
            return "Bill Gates"
        }
    }
    
    func showFact() -> String {
        currentFactInfo = getRandomFact()
        return currentFactInfo.1
    }
    
}
