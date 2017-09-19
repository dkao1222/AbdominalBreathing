//
//  readyMenuViewController.swift
//  AbdominalBreathing
//
//  Created by Dragon Kao on 2017/8/5.
//  Copyright © 2017年 KaoDragon. All rights reserved.
//

import UIKit
import AVFoundation

class readyMenuViewController: UIViewController, AVSpeechSynthesizerDelegate {
    
    @IBOutlet weak var numberCountLabel: UILabel!
    // 宣告 synthesizer = AVSpeechSynthesizer
    let synthesizer = AVSpeechSynthesizer()
    let strZh1 = "準備開始腹式呼吸"
    var second = 5
    var times = Timer()
    

    var timeRunning = false
    
    func speechTalk(speaking: String) {
        let utteranceEN = AVSpeechUtterance(string: speaking)
        utteranceEN.voice = AVSpeechSynthesisVoice(language: "zh-TW")
        utteranceEN.rate = 0.1
        synthesizer.speak(utteranceEN)
    }
    
    // Func from AVSpeechSynthesizerDelegate check Start 需要設定委任
    func speechSynthesizer(_ synthesizer: AVSpeechSynthesizer, didStart utterance: AVSpeechUtterance) {
        print("Speaking is Start")
    }
    // Func from AVSpeechSynthesizerDelegate check Continue 需要設定委任
    func speechSynthesizer(_ synthesizer: AVSpeechSynthesizer, didContinue utterance: AVSpeechUtterance) {
        print("Speaking is continue")
    }
    // Func from AVSpeechSynthesizerDelegate check Pause 需要設定委任
    func speechSynthesizer(_ synthesizer: AVSpeechSynthesizer, didPause utterance: AVSpeechUtterance) {
        print("Speaking is pause")
    }
    // Func from AVSpeechSynthesizerDelegate check Finish 需要設定委任
    func speechSynthesizer(_ synthesizer: AVSpeechSynthesizer, didFinish utterance: AVSpeechUtterance) {
        print("Speaking is finish")
        actionView()
    }
    
    func actionView() {
        let vc = storyboard?.instantiateViewController(withIdentifier: "StartMenu") as! lodingViewController
        present(vc, animated: true, completion: nil)
    }
    
    func runTime() {
        times = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(readyMenuViewController.updateTime), userInfo: nil, repeats: true)
        timeRunning = true
    }
    
    func updateTime() {
        second -= 1
        print(second)
        numberCountLabel.text = String(second)
        if second == 0 {
            timeRunning = false
            times.invalidate()
        }
        
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        // 設定委任給 synthesizer
        self.synthesizer.delegate = self

        numberCountLabel.text = String(second)
        runTime()
        speechTalk(speaking: strZh1)

        
    }
    
    
    
    

}
