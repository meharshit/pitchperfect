//
//  playSoundsViewController.swift
//  pitchperfect
//
//  Created by Harshit Satyaseel on 17/01/18.
//  Copyright © 2018 Harshit Satyaseel. All rights reserved.
//

import UIKit
import AVFoundation

// MARK: UI buttons outlets

class playSoundsViewController: UIViewController {
    
    
    @IBOutlet weak var snailButton: UIButton!
    @IBOutlet weak var chipmunkButton: UIButton!
    @IBOutlet weak var rabbitButton: UIButton!
    @IBOutlet weak var vaderButton: UIButton!
    @IBOutlet weak var echoButton: UIButton!
    @IBOutlet weak var reverbButton: UIButton!
    @IBOutlet weak var stopButton: UIButton!
    
  
    var recordedAudioURL:URL!
    var audioFile:AVAudioFile!
    var audioEngine:AVAudioEngine!
    var audioPlayerNode: AVAudioPlayerNode!
    var stopTimer: Timer!
    
    enum ButtonType: Int {
        case slow = 0, fast, chipmunk, vader, echo, reverb
    }
    
    
    
    // MARK: Actions
    
    @IBAction func playSoundForButton(_ sender: UIButton) {
        print("Play Sound Button Pressed")
        // this code converts the button's tag to the button's type
        switch(ButtonType(rawValue: sender.tag)!) {
        case .slow:
            playSound(rate: 0.5)
        case .fast:
            playSound(rate: 1.5)
        case .chipmunk:
            playSound(pitch: 1000)
        case .vader:
            playSound(pitch: -1000)
        case .echo:
            playSound(echo: true)
        case .reverb:
            playSound(reverb: true)
        }
        
        configureUI(.playing)
    }
    
    @IBAction func stopButtonPressed(_ sender: AnyObject) {
        print("Stop Audio Button Pressed")
        // this is added in the class extension so we are calling the stopAudio function.
        stopAudio()
    }
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        setupAudio()

        // Do any additional setup after loading the view.
    }
    // this is for the  stopbutton initially in not playing state
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        configureUI(.notPlaying)
        
        
    }

    

}
