//
//  ViewController.swift
//  AbdominalBreathing
//
//  Created by KaoDragon on 2017/7/27.
//  Copyright © 2017年 KaoDragon. All rights reserved.
//

import UIKit


class ViewController: UIViewController {

    @IBAction func startMenu(_ sender: Any) {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "StartMenu")
        self.present(vc!, animated: true, completion: nil)
    }
    
    /*
    let vc = self.storyboard?.instantiateViewController(withIdentifier: "Home")
    self.present(vc!, animated: true, completion: nil)
    */

    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

