//
//  AppDelegate.swift
//  DesktopNoDependency
//
//  Created by Nghia Tran on 10/16/18.
//  Copyright © 2018 com.nsproxy.proxy. All rights reserved.
//

import Cocoa

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {

    static var shared: AppDelegate {
        return NSApp.delegate as! AppDelegate
    }

    // MARK: - Variable
    lazy var app: Application = Application.default()

    // MARK: - Public
    func applicationDidFinishLaunching(_ aNotification: Notification) {
        app.start()
    }

    func applicationWillTerminate(_ aNotification: Notification) {
        // Insert code here to tear down your application
    }
}

