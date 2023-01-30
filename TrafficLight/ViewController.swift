//
//  ViewController.swift
//  TrafficLight
//
//  Created by Айдар Оспанов on 30.01.2023.
//

import UIKit

enum Color {
    case red
    case yellow
    case green
}

class ViewController: UIViewController {

    @IBOutlet var redView: UIView!
    @IBOutlet var yellowView: UIView!
    @IBOutlet var greenView: UIView!
    @IBOutlet var startButton: UIButton!
    
    //MARK: private properties
    private var color = Color.red
    
    private let turnOn: CGFloat = 1
    private let turnOff: CGFloat = 0.3
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black
        configure()
    }
    
    private func configure() {
    
        redView.layer.cornerRadius = redView.frame.height / 2
        redView.alpha = turnOff
    
        
        yellowView.layer.cornerRadius = yellowView.frame.height / 2
        yellowView.alpha = turnOff
        
        greenView.layer.cornerRadius = yellowView.frame.height / 2
        greenView.alpha = turnOff
        
        //без settitle не меняется на title Next пришлось так сделать)
        startButton.setTitle("START", for: .normal)
        startButton.layer.cornerRadius = 12
    }

 //MARK: IBAction
    
    @IBAction func startButtonTapped() {
        
        if startButton.currentTitle == "START" {
            startButton.setTitle("NEXT", for: .normal)
        }
        
        switch color {
        case .red:
            redView.alpha = turnOn
            greenView.alpha = turnOff
            color = .yellow
        case .yellow:
            redView.alpha = turnOff
            yellowView.alpha = turnOn
            color = .green
        case .green:
            yellowView.alpha = turnOff
            greenView.alpha = turnOn
            color = .red
        }
    }
    
}

