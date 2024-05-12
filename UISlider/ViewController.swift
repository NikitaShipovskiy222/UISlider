//
//  ViewController.swift
//  UISlider
//
//  Created by Nikita Shipovskiy on 06/03/2024.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    
    
    var player = AVAudioPlayer()
    
    
    private lazy var sliderAudio: UISlider = {
        $0.center = self.view.center
        $0.minimumValue = 0.0
        $0.maximumValue = 100.0
        $0.addTarget(self, action: #selector(chengeSlider), for: .valueChanged)
        return $0
    }(UISlider(frame: CGRect(x: 0, y: 0, width: 200, height: 23)))
    
    
    
    private lazy var playButton: UIButton = {
        $0.setTitle("Play", for: .normal)
        $0.backgroundColor = .gray
        $0.setTitleColor(.red, for: .normal)
        $0.addTarget(self, action: #selector(playButtonAction), for: .touchDown)
        return $0
    }(UIButton(frame: CGRect(x: 150, y: 200, width: 100, height: 50)))
    
    private lazy var pauseButton: UIButton = {
        $0.setTitle("Pause", for: .normal)
        $0.backgroundColor = .gray
        $0.setTitleColor(.red, for: .normal)
        $0.addTarget(self, action: #selector(pauseButtonAction), for: .touchDown)
        return $0
    }(UIButton(frame: CGRect(x: 150, y: 300, width: 100, height: 50)))
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        view.addSubview(sliderAudio)
    
        view.addSubview(playButton)
        view.addSubview(pauseButton)
        
        
        do{
            
            if let audioPath = Bundle.main.path(forResource: "dj hook & dirkey 168 bpm c#min HOT RAP", ofType: "mp3") {
                try player = AVAudioPlayer(contentsOf: URL(fileURLWithPath: audioPath))
                self.sliderAudio.maximumValue = Float(player.duration)
            }
        } catch {
            print("ERROR")
        }
        self.player.pause()
        
    }
    
    @objc func playButtonAction(sender: UIButton) {
        self.player.play()
    }
    
    @objc func pauseButtonAction(sender: UIButton){
        self.player.pause()
    }
    
    //MARK: - sliderValue
    @objc func chengeSlider(sender: UISlider){
        if sender == sliderAudio {
            self.player.currentTime = TimeInterval(sender.value)
        }
    }
    
    
    
}
