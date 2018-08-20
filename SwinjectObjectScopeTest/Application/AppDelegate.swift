//
//  AppDelegate.swift
//  SwinjectObjectScopeTest
//
//  Created by m3g0byt3 on 19/08/2018.
//  Copyright © 2018 m3g0byt3. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    #if swift(>=4.2)
    func application(
        _ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
    ) -> Bool {
        return true
    }
    #else
    func application(
        _ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?
    ) -> Bool {
        return true
    }
    #endif
}
