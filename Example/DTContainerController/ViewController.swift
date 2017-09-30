//
//  ViewController.swift
//  DTContainerController
//
//  Created by tungvoduc on 09/22/2017.
//  Copyright (c) 2017 tungvoduc. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    let button = UIButton(type: UIButtonType.custom)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.randomColor()
        view.addSubview(button)
        button.addTarget(self, action: #selector(buttonTapped), for: UIControlEvents.touchUpInside)
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        // Random status bar style
        let rand = Int(arc4random() % 2)
        return rand == 0 ? UIStatusBarStyle.default : UIStatusBarStyle.lightContent
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        
        let buttonHeight: CGFloat = 50
        let buttonWidth: CGFloat = 100
        
        button.frame = CGRect(x: (view.frame.width - buttonWidth)/2, y: (view.frame.height - buttonHeight)/2, width: buttonWidth, height: buttonHeight)
        button.layer.cornerRadius = buttonHeight/2
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor.white.cgColor
        button.setTitle("Tap me!", for: UIControlState.normal)
    }
    
    deinit {
        print("ViewController destroyed")
    }
    
    @objc func buttonTapped() {
        containerViewController?.show(ViewController(), animated: true, completion: nil)
    }
}

extension UIColor {
    static func randomColor() -> UIColor {
        return UIColor(red: CGFloat(arc4random() % 256)/255, green: CGFloat(arc4random() % 256)/255, blue: CGFloat(arc4random() % 256)/255, alpha: 1)
    }
}

