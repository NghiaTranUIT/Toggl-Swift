//
//  ViewController.swift
//  DesktopNoDependency
//
//  Created by Nghia Tran on 10/16/18.
//  Copyright © 2018 com.nsproxy.proxy. All rights reserved.
//

import Cocoa
import DesktopCore

class ViewController: NSViewController {

    private lazy var viewModel: LoginViewModelType = {
        return LoginViewModel(network: AppDelegate.shared.app.network)
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        viewModel.login(email: "vinhnghiatran@gmail.com", password: "fitpIh-bivzuh-2qaxfu")
    }

    override var representedObject: Any? {
        didSet {
        // Update the view, if already loaded.
        }
    }


}

