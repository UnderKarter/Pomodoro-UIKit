//
//  ViewController.swift
//  Pomodoro UIKit
//
//  Created by temp user on 30.05.2022.
//

import UIKit

class ViewController: UIViewController {

    private let timeLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.text = "25 : 00"
        label.textColor = UIColor.white
        label.font = UIFont.monospacedDigitSystemFont(ofSize: 46, weight: .bold)
        return label
    }()
    
    var startButton = UIButton()
    var stopButton = UIButton()
    
    var timer = Timer()
    var isTimerStarted = false
    
    var seconds = 10
    let timeForWork = 10
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        
    }

    func setupView(){
        view.backgroundColor = UIColor.systemGray4
        timeLabel.sizeToFit()
        view.addSubview(timeLabel)
        timeLabel.center = view.center
        
        createButtons()
    }

    func createButtons() {
        
        startButton = UIButton(frame: CGRect(x: 30, y: view.frame.size.height - 90, width: view.frame.size.width - 250, height: 50))
        view.addSubview(startButton)
        startButton.setTitle("Start", for: .normal)
        startButton.backgroundColor = .systemIndigo
        startButton.layer.cornerRadius = 15
        startButton.addTarget(self, action: #selector(startButtonAction), for: .touchUpInside)
        
        stopButton = UIButton(frame: CGRect(x: 220, y: view.frame.size.height - 90, width: view.frame.size.width - 250, height: 50))
        view.addSubview(stopButton)
//        stopButton.isEnabled = true
//        stopButton.alpha = 1.0
        stopButton.setTitle("Stop", for: .normal)
        stopButton.setTitleColor(UIColor.white, for: .normal)
        stopButton.backgroundColor = .systemTeal
        stopButton.layer.cornerRadius = 15
        stopButton.addTarget(self, action: #selector(stopButtonAction), for: .touchUpInside)
    }
    
    // MARK: - Button action
    
    @objc func startButtonAction() {
        startButton.isEnabled = true
        startButton.alpha = 1.0
        
        if !isTimerStarted {
            
            startTimer()
            
            isTimerStarted = true
            
            
            startButton.setTitle("Pause", for: .normal)
            startButton.setTitleColor(UIColor.white, for: .normal)
            startButton.backgroundColor = UIColor.red
            
            stopButton.isEnabled = true
            stopButton.alpha = 1
            
        } else {
            timer.invalidate()
            
            isTimerStarted = false
            
            startButton.setTitle("Start", for: .normal)
            startButton.setTitleColor(UIColor.white, for: .normal)
            startButton.backgroundColor = UIColor.systemIndigo
            
        }
    }
    
    @objc func stopButtonAction() {
        timer.invalidate()
        
        stopButton.isEnabled = false
        stopButton.alpha = 0.5
        startButton.setTitle("Start", for: .normal)
        startButton.setTitleColor(UIColor.white, for: .normal)
        startButton.backgroundColor = UIColor.systemIndigo
        
        seconds = timeForWork
        timeLabel.text = "25 : 00"
        
        isTimerStarted = false
    }
    
    //MARK: - Timer func
    func startTimer() {
        timer = Timer.scheduledTimer(timeInterval: 1,
                                     target: self,
                                     selector: #selector(ViewController.timerAction),
                                     userInfo: nil,
                                     repeats: true)
    }
    
    @objc func timerAction(){
        
        seconds -= 1
        
        let time = secondsToMinuteSecond(time: seconds)
        let timeString = makeTimeToString(minuties: time.0, seconds: time.1)
        
        timeLabel.text = timeString
        timeLabel.sizeToFit()
    
        if seconds == 0 {
            timer.invalidate()
            
            startButton.setTitle("Start", for: .normal)
            startButton.setTitleColor(UIColor.white, for: .normal)
            startButton.backgroundColor = UIColor.systemIndigo
            
            seconds = timeForWork
            
            stopButtonAction()
            startButtonAction()
        }
    }
    
    //MARK: - label func
    func secondsToMinuteSecond(time: Int) -> (Int, Int) {
        let minuties = Int((Double(time)) / 60)
        let seconds = (time % 60)

        return (minuties, seconds)
    }
    
    func makeTimeToString(minuties: Int, seconds: Int) -> String {
        
        var timeString = ""
        if minuties >= 10 {
        timeString += String(minuties)
        } else {
        timeString += String(format: "0%2i", minuties)
        }
        
        timeString += " : "
        
        if seconds >= 10 {
        timeString += String(seconds)
        } else {
        timeString += String(format: "0%2i", seconds)
        }
        
        return timeString
    }
}

