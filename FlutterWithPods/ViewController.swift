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
    }

    @IBAction func button1Tapped(_ sender: Any) {
        let controller = FlutterViewController()
        controller.setInitialRoute("/home")
        navigationController?.pushViewController(controller, animated: true)
        
        let methodChannel = FlutterMethodChannel(name: "com.takecian.flutter/method", binaryMessenger: controller)
        methodChannel.setMethodCallHandler({ [weak self] (call: FlutterMethodCall, result: FlutterResult) -> Void in
            switch call.method {
            case "get":
                let randomValue = Int.random(in: 1..<10)
                result(randomValue)
            case "back":
                self?.navigationController?.popViewController(animated: true)
            default:
                break
            }
        })
    }
    
    
    @IBAction func button2Tapped(_ sender: Any) {
        let controller = FlutterViewController()
        controller.setInitialRoute("/sample")
        navigationController?.pushViewController(controller, animated: true)
        
        let methodChannel = FlutterMethodChannel(name: "com.takecian.flutter/method", binaryMessenger: controller)
        methodChannel.setMethodCallHandler({ [weak self] (call: FlutterMethodCall, result: FlutterResult) -> Void in
            switch call.method {
            case "get":
                let randomValue = Int.random(in: 1..<10)
                result(randomValue)
            case "back":
                self?.navigationController?.popViewController(animated: true)
            default:
                break
            }
        })
    }
}
