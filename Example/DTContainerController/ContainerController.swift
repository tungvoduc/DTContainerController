//
//  ContainerController.swift
//  DTContainerController
//
//  Created by Admin on 22/09/2017.
//  Copyright © 2017 CocoaPods. All rights reserved.
//

import UIKit
import DTContainerController

class ContainerController: DTContainerController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        show(ViewController(), animated: false, completion: nil)
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */
    
}

