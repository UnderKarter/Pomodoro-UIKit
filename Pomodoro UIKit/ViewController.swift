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
        stopButton.isEnabled = false
        stopButton.alpha = 0.5
        stopButton.setTitle("Stop", for: .normal)
        stopButton.setTitleColor(UIColor.white, for: .normal)
        stopButton.backgroundColor = .systemTeal
        stopButton.layer.cornerRadius = 15
        stopButton.addTarget(self, action: #selector(stopButtonAction), for: .touchUpInside)
    }
    
    @objc func startButtonAction() {
        
    }
    
    @objc func stopButtonAction() {
        
    }
}

