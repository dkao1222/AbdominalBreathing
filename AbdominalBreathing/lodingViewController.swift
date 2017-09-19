//
//  lodingViewController.swift
//  AbdominalBreathing
//
//  Created by Dragon Kao on 2017/7/30.
//  Copyright © 2017年 KaoDragon. All rights reserved.
//

import UIKit
import Lottie


class lodingViewController: UIViewController {

    // refresh.jsom
    // data.json
    // search.json
    // horloge.json
    var animationStatus = 0
    
    func animationView(name: String, speed: Float, loop: Bool) {
        let animationView = LOTAnimationView(name: name)
        animationView.center = self.view.center
        animationView.contentMode = .scaleAspectFill
        view.addSubview(animationView)
        animationView.animationSpeed = CGFloat(speed)
        animationView.play()
        animationView.loopAnimation = loop
    }
    
    override func viewWillLayoutSubviews() {
        
        switch animationStatus {
        case 0:
            animationView(name: "data", speed: 0.1, loop: true)
        case 1:
            animationView(name: "loading", speed: 0.1, loop: true)
        case 2:
            animationView(name: "search", speed: 0.1, loop: true)
        case 3:
            animationView(name: "refresh", speed: 0.1, loop: true)
        case 4:
            animationView(name: "horloge", speed: 0.1, loop: true)
        default:
            animationView(name: "data", speed: 0.1, loop: true)
        }
        
        animationView(name: "data", speed: 0.5, loop: true)
        
        
    }
    
    
    
}
