//
//  ViewController.swift
//  KennyYakalaDesignProject
//
//  Created by Taylan Hubeylioğlu on 9.04.2022.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var lblHighScore: UILabel!
    @IBOutlet weak var lblTime: UILabel!
    @IBOutlet weak var lblScore: UILabel!
    
    @IBOutlet weak var imageViewKenny1: UIImageView!
    @IBOutlet weak var imageViewKenny2: UIImageView!
    @IBOutlet weak var imageViewKenny3: UIImageView!
    @IBOutlet weak var imageViewKenny4: UIImageView!
    @IBOutlet weak var imageViewKenny5: UIImageView!
    @IBOutlet weak var imageViewKenny6: UIImageView!
    @IBOutlet weak var imageViewKenny7: UIImageView!
    @IBOutlet weak var imageViewKenny8: UIImageView!
    @IBOutlet weak var imageViewKenny9: UIImageView!
    @IBOutlet weak var imageViewKenny10: UIImageView!
    @IBOutlet weak var imageViewKenny11: UIImageView!
    @IBOutlet weak var imageViewKenny12: UIImageView!
    
    @IBOutlet weak var btnPlayAgain: UIButton!
    @IBOutlet weak var btnGoHome: UIButton!
    @IBOutlet weak var lblGameOver: UILabel!

    var timerForTimeLabel = Timer()
    var timerForGame = Timer()
    var time : Int = 0
    var score : Int = 0
    var scoreControl : Int = 0
    var timerInterval : Double = 1.5
    var gameStopped : Bool = false
    var sameLocationControl : Int = 0
    var highScore : Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        lblGameOver.isHidden = true
        btnPlayAgain.isHidden = true
        btnGoHome.isHidden = true
        let kennyCatched1 = UITapGestureRecognizer(target: self, action: #selector(increaseScore))
        let kennyCatched2 = UITapGestureRecognizer(target: self, action: #selector(increaseScore))
        let kennyCatched3 = UITapGestureRecognizer(target: self, action: #selector(increaseScore))
        let kennyCatched4 = UITapGestureRecognizer(target: self, action: #selector(increaseScore))
        let kennyCatched5 = UITapGestureRecognizer(target: self, action: #selector(increaseScore))
        let kennyCatched6 = UITapGestureRecognizer(target: self, action: #selector(increaseScore))
        let kennyCatched7 = UITapGestureRecognizer(target: self, action: #selector(increaseScore))
        let kennyCatched8 = UITapGestureRecognizer(target: self, action: #selector(increaseScore))
        let kennyCatched9 = UITapGestureRecognizer(target: self, action: #selector(increaseScore))
        let kennyCatched10 = UITapGestureRecognizer(target: self, action: #selector(increaseScore))
        let kennyCatched11 = UITapGestureRecognizer(target: self, action: #selector(increaseScore))
        let kennyCatched12 = UITapGestureRecognizer(target: self, action: #selector(increaseScore))
        makeKennysInteractive()
        hideKennys()
        imageViewKenny1.addGestureRecognizer(kennyCatched1)
        imageViewKenny2.addGestureRecognizer(kennyCatched2)
        imageViewKenny3.addGestureRecognizer(kennyCatched3)
        imageViewKenny4.addGestureRecognizer(kennyCatched4)
        imageViewKenny5.addGestureRecognizer(kennyCatched5)
        imageViewKenny6.addGestureRecognizer(kennyCatched6)
        imageViewKenny7.addGestureRecognizer(kennyCatched7)
        imageViewKenny8.addGestureRecognizer(kennyCatched8)
        imageViewKenny9.addGestureRecognizer(kennyCatched9)
        imageViewKenny10.addGestureRecognizer(kennyCatched10)
        imageViewKenny11.addGestureRecognizer(kennyCatched11)
        imageViewKenny12.addGestureRecognizer(kennyCatched12)
        
        timerForGame = .scheduledTimer(timeInterval: timerInterval, target: self, selector: #selector(randomKenny), userInfo: nil, repeats: true)
        timerForTimeLabel = .scheduledTimer(timeInterval: 1, target: self, selector: #selector(updateTimeLabel), userInfo: nil, repeats: true)
        
        let storedHighScore = UserDefaults.standard.object(forKey: "highscore")
        
        if storedHighScore == nil {
            highScore = 0
            lblHighScore.text = "Highscore : \(highScore)"
        }
        if let newScore = storedHighScore as? Int {
            highScore = newScore
            lblHighScore.text = "Highscore : \(highScore)"
        }
        
    }
    

    @objc func randomKenny() {
        
        var randomKennyLocation = Int.random(in: 1..<13)
        if randomKennyLocation == sameLocationControl {
            randomKennyLocation = Int.random(in: 1..<13)
        }
        sameLocationControl = randomKennyLocation
        hideKennys()

        if randomKennyLocation == 1 {
            imageViewKenny1.isHidden = false
        }
        else if randomKennyLocation == 2 {
            imageViewKenny2.isHidden = false
        }
        else if randomKennyLocation == 3 {
            imageViewKenny3.isHidden = false
        }
        else if randomKennyLocation == 4 {
            imageViewKenny4.isHidden = false
        }
        else if randomKennyLocation == 5 {
            imageViewKenny5.isHidden = false
        }
        else if randomKennyLocation == 6 {
            imageViewKenny6.isHidden = false
        }
        else if randomKennyLocation == 7 {
            imageViewKenny7.isHidden = false
        }
        else if randomKennyLocation == 8 {
            imageViewKenny8.isHidden = false
        }
        else if randomKennyLocation == 9 {
            imageViewKenny9.isHidden = false
        }
        else if randomKennyLocation == 10 {
            imageViewKenny10.isHidden = false
        }
        else if randomKennyLocation == 11 {
            imageViewKenny11.isHidden = false
        }
        else if randomKennyLocation == 12 {
            imageViewKenny12.isHidden = false
        }
        
        if timerInterval != 1.5 && score == scoreControl {
            timerForGame.invalidate()
            timerForTimeLabel.invalidate()
            time = 0
            gameStopped = true
            lblGameOver.isHidden = false
            hideKennys()
            btnPlayAgain.isHidden = false
            btnGoHome.isHidden = false

            if score > highScore {
                highScore = score
                UserDefaults.standard.set(highScore, forKey: "highscore")
                lblHighScore.text = "Highscore : \(highScore)"
            }
            
        }
        
        if timerInterval != 1.5 && score > scoreControl {
            scoreControl = score
        }
        
        if timerInterval > 0.24 && gameStopped != true {
            timerInterval -= 0.07
            timerForGame.invalidate()
            timerForGame = .scheduledTimer(timeInterval: timerInterval, target: self, selector: #selector(randomKenny), userInfo: nil, repeats: true)
        }
        
    }
    
    
    @IBAction func btnPlayAgain(_ sender: Any) {
        btnPlayAgain.isHidden = true
        btnGoHome.isHidden = true
        lblGameOver.isHidden = true
        scoreControl = 0
        score = 0
        lblScore.text = "Score : \(score)"
        gameStopped = false

        time = 0
        updateTimeLabel()
        timerInterval = 1.5
        timerForGame = .scheduledTimer(timeInterval: timerInterval, target: self, selector: #selector(randomKenny), userInfo: nil, repeats: true)
        timerForTimeLabel = .scheduledTimer(timeInterval: 1, target: self, selector: #selector(updateTimeLabel), userInfo: nil, repeats: true)
    }
    
    
    @IBAction func btnGoHome(_ sender: Any) {
        performSegue(withIdentifier: "goToEntranceSegue", sender: nil)
    }

    
    
    @objc func increaseScore() {
        if timerInterval > 1 {
        score += 1
        lblScore.text = "Score : \(score)"
        }
        else if timerInterval > 0.5 && timerInterval <= 1 {
            score += 3
            lblScore.text = "Score : \(score)"
        }
        else if timerInterval <= 0.5 {
            score += 5
            lblScore.text = "Score : \(score)"
        }
    }
    
    func makeKennysInteractive() {
        imageViewKenny1.isUserInteractionEnabled = true
        imageViewKenny2.isUserInteractionEnabled = true
        imageViewKenny3.isUserInteractionEnabled = true
        imageViewKenny4.isUserInteractionEnabled = true
        imageViewKenny5.isUserInteractionEnabled = true
        imageViewKenny6.isUserInteractionEnabled = true
        imageViewKenny7.isUserInteractionEnabled = true
        imageViewKenny8.isUserInteractionEnabled = true
        imageViewKenny9.isUserInteractionEnabled = true
        imageViewKenny10.isUserInteractionEnabled = true
        imageViewKenny11.isUserInteractionEnabled = true
        imageViewKenny12.isUserInteractionEnabled = true
    }
    
    @objc func hideKennys() {
        imageViewKenny1.isHidden = true
        imageViewKenny2.isHidden = true
        imageViewKenny3.isHidden = true
        imageViewKenny4.isHidden = true
        imageViewKenny5.isHidden = true
        imageViewKenny6.isHidden = true
        imageViewKenny7.isHidden = true
        imageViewKenny8.isHidden = true
        imageViewKenny9.isHidden = true
        imageViewKenny10.isHidden = true
        imageViewKenny11.isHidden = true
        imageViewKenny12.isHidden = true
    }
    
    @objc func updateTimeLabel() {
        time += 1
        lblTime.text = "Time : \(time)"
    }
    
    
}

