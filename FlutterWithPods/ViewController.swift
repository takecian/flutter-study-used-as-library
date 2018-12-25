//
//  ViewController.swift
//  FlutterWithPods
//
//  Created by Fujiki Takeshi on 2018/12/25.
//  Copyright © 2018 takecian. All rights reserved.
//

import UIKit
import Flutter

class ViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        let button = UIButton(type: .custom)
        button.addTarget(self, action: #selector(handleButtonAction), for: .touchUpInside)
        button.setTitle("Press me", for: .normal)
        button.frame = CGRect(x: 80.0, y: 210.0, width: 160.0, height: 40.0)
        button.backgroundColor = UIColor.blue
        self.view.addSubview(button)
    }

    @objc func handleButtonAction() {
        let flutterViewController = FlutterViewController()
        self.present(flutterViewController, animated: false, completion: nil)
    }
}
