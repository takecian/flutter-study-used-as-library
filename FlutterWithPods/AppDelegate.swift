//
//  AppDelegate.swift
//  FlutterWithPods
//
//  Created by Fujiki Takeshi on 2018/12/25.
//  Copyright © 2018 takecian. All rights reserved.
//

import UIKit
import Flutter
import FlutterPluginRegistrant // Only if you have Flutter Plugins.

@UIApplicationMain
class AppDelegate: FlutterAppDelegate {

    // Only if you have Flutter plugins.
    override func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        GeneratedPluginRegistrant.register(with: self);
        return super.application(application, didFinishLaunchingWithOptions: launchOptions);
    }

}
