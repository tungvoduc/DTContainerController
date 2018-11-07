//
//  ViewController.swift
//  DTContainerController
//
//  Created by tungvoduc on 09/22/2017.
//  Copyright (c) 2017 tungvoduc. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    let button = UIButton(type: UIButton.ButtonType.custom)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.randomColor()
        view.addSubview(button)
        button.addTarget(self, action: #selector(buttonTapped), for: UIControl.Event.touchUpInside)
        // Do any additional setup after loading the view, typically from a nib.
        
        
        
        let buttonHeight: CGFloat = 50
        let buttonWidth: CGFloat = 100
        button.layer.cornerRadius = buttonHeight/2
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor.white.cgColor
        button.backgroundColor = UIColor.black
        button.setTitle("Tap me!", for: UIControl.State.normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        
        let widthConstraint = NSLayoutConstraint(item: button, attribute: .width, relatedBy: .equal,
                                                 toItem: nil, attribute: .notAnAttribute, multiplier: 1.0, constant: buttonWidth)
        
        let heightConstraint = NSLayoutConstraint(item: button, attribute: .height, relatedBy: .equal,
                                                  toItem: nil, attribute: .notAnAttribute, multiplier: 1.0, constant: buttonHeight)
        button.addConstraint(widthConstraint)
        button.addConstraint(heightConstraint)
        
        let xConstraint = NSLayoutConstraint(item: button, attribute: .centerX, relatedBy: .equal, toItem: view, attribute: .centerX, multiplier: 1, constant: 0)
        
        let yConstraint = NSLayoutConstraint(item: button, attribute: .centerY, relatedBy: .equal, toItem: view, attribute: .centerY, multiplier: 1, constant: 0)
        
        view.addConstraint(xConstraint)
        view.addConstraint(yConstraint)
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

