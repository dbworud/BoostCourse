//
//  ViewController.swift
//  BoostCourse
//
//  Created by jaekyung you on 2021/01/08.
//

import AVFoundation
import UIKit

class ViewController: UIViewController {

    // MARK: Properties
    var player: AVAudioPlayer!
    var timer: Timer!
    
    // MARK: IBOutlets
    @IBOutlet weak var playPauseButton: UIButton!
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var progressSlider: UISlider!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initializePlayer()
        updateTimeLabel(time: 0)
    }

    // MARK: Methods
    
    // Player 시작
    func initializePlayer() {
        // 음원 가져오기
        guard let soundAsset: NSDataAsset = NSDataAsset(name: "sound") else {
            print("음원을 찾을 수 없습니다")
            return
        }
        
        do{
            try player = AVAudioPlayer(data: soundAsset.data)
            player.delegate = self
        }catch let error as NSError {
            print("플레이어 초기화 실패 \(error.code), \(error.localizedDescription)")
        }
        
        // Slider 범위 설정하기
        progressSlider.minimumValue = 0
        progressSlider.maximumValue = Float(player.duration)
        progressSlider.value = Float(player.currentTime)
        
    }
    
    // TimeLabel을 TimeInterval에 따라 update하기
    func updateTimeLabel(time: TimeInterval) {
        let minute = Int(time/60)
        let second = Int(time.truncatingRemainder(dividingBy: 60))
        let milisecond = Int(time.truncatingRemainder(dividingBy: 1) * 100)
        
        let timeText = String(format: "%02ld:%02ld:%02ld", minute, second, milisecond)
        timeLabel.text = timeText
    }
    
    // Timer 시작
    func makeAndFireTimer() {
        self.timer = Timer.scheduledTimer(withTimeInterval: 0.01, repeats: true, block: { [unowned self] timer in
            
            // whether the control is currently tracking touch event
            if progressSlider.isTracking {
                return
            }
            
            // update slider and timelabel
            updateTimeLabel(time: self.player.currentTime)
            progressSlider.value = Float(self.player.currentTime)
            
        })
        self.timer.fire() // timer message sent to its target
    }
    
    // Tiemr 끝내기
    func invalidateTimer() {
        self.timer.invalidate()
        self.timer = nil // 메모리 삭제
    }
    
    
    // setup layout
    func setupLayout() {
        guard let playPauseButton = playPauseButton, let progressSlider = progressSlider, let timeLabel = timeLabel else {
            return
        }

        [playPauseButton, progressSlider, timeLabel].forEach {
            self.view.addSubview($0)
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
        
        

    }
    
    
    @IBAction func touchUpPlayPauseButton(_ sender: UIButton) {
        sender.isSelected = !sender.isSelected
        
        if sender.isSelected {
            self.player?.play()
            makeAndFireTimer()
        } else {
            self.player?.pause()
            invalidateTimer()
        }
    }
    
    @IBAction func sliderValueChanged(_ sender: UISlider) {
//        print("Slider value changed")
        updateTimeLabel(time: TimeInterval(sender.value))
        if sender.isTracking { return }
        self.player.currentTime = TimeInterval(sender.value)
    }
}



extension ViewController: AVAudioPlayerDelegate{
    
    func audioPlayerDecodeErrorDidOccur(_ player: AVAudioPlayer, error: Error?) {
        guard let error = error else {
            print("디코드 오류 발생")
            return
        }
        
        // 에러 상세 알림 메세지
        let alert = UIAlertController(title: "알림", message: "오디오 플레이어 오류 발생 \(error.localizedDescription)", preferredStyle: .alert)
        
        let okAction = UIAlertAction(title: "확인", style: .default) { _ in
            self.dismiss(animated: true, completion: nil)
        }
        
        alert.addAction(okAction)
        self.present(alert, animated: true, completion: nil)
    }
    
    // 끝났을 때 초기화, 돌아가기
    func audioPlayerDidFinishPlaying(_ player: AVAudioPlayer, successfully flag: Bool) {
        self.playPauseButton.isSelected = false
        self.progressSlider.value = 0
        self.updateTimeLabel(time: 0)
        self.invalidateTimer()
    }
}
