//
//  ViewController.swift
//  BoostCourse
//
//  Created by jaekyung you on 2021/01/08.
//

import AVFoundation
import UIKit

class ViewController: UIViewController, AVAudioPlayerDelegate {

    // MARK: Properties
    var player: AVAudioPlayer!
    var timer: Timer!
    
    // MARK: IBOutlets
    @IBOutlet weak var playPauseButton: UIButton!
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var progressSlider: UISlider!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    // MARK: Methods
    
    // Player 시작
    
    // Timer 시작
    
    // Tiemr 끝내기
    
    
    // 
    
    
    @IBAction func touchUpPlayPauseButton(_ sender: UIButton) {
        print("Tapped Button")
    }
    
    @IBAction func sliderValueChanged(_ sender: UISlider) {
        print("Slider value changed")
    }
}

