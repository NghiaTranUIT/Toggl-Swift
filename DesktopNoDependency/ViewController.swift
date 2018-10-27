//
//  ViewController.swift
//  DesktopNoDependency
//
//  Created by Nghia Tran on 10/16/18.
//  Copyright © 2018 com.nsproxy.proxy. All rights reserved.
//

import Cocoa
import TogglCore

final class ViewController: NSViewController {

    // MARK: - Variable
    private lazy var adapter: WorkspaceTableViewAdapter = {
        return WorkspaceTableViewAdapter(tableView: tableView)
    }()
    private lazy var viewModel: LoginViewModelType = {
        return LoginViewModel(network: AppDelegate.shared.app.network)
    }()

    @IBOutlet weak var tableView: NSTableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        initCommon()
        viewModel.login(apiToken: Constants.APIToken) {[weak self] result in
            guard let strongSelf = self else { return }

            switch result {
            case .error(let error):
                print("Error \(error)")
            case .success(let user):
                print("User \(user)")

                // Update
                strongSelf.adapter.update(user.workspaces)
            }
        }
    }

    private func initCommon() {
        tableView.dataSource = adapter
        tableView.delegate = adapter
    }
}

