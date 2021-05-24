//
//  ViewController.swift
//  Shields
//
//  Created by 纽扣软件 on 2021/5/24.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let shields = Shields(frame: CGRect(x: 0, y: 0, width: 320, height: 40), style: .ShieldsLogo)
        shields.cornerRadius = 20
        shields.configWithJsonFilePath(jsonPath: Bundle.main.path(forResource: "shields", ofType: "json")!)
        shields.center = self.view.center
        view.addSubview(shields)
    }

}

