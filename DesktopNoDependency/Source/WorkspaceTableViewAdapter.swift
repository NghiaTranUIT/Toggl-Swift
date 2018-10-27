//
//  WorkspaceTableViewAdapter.swift
//  DesktopNoDependency
//
//  Created by Nghia Tran on 10/18/18.
//  Copyright © 2018 com.nsproxy.proxy. All rights reserved.
//

import Foundation
import Cocoa
import TogglCore

final class WorkspaceTableViewAdapter: NSObject {

    struct Constants {
        static let WorkspaceCellID = NSUserInterfaceItemIdentifier("WorkspaceCellView")
    }

    // MARK: - Variable
    private let tableView: NSTableView
    fileprivate var workspaces: [Workspace] = [] {
        didSet {
            tableView.reloadData()
        }
    }

    // MARK: - Init
    init(tableView: NSTableView) {
        self.tableView = tableView
        super.init()
        let nib = NSNib(nibNamed: NSNib.Name("WorkspaceCellView"), bundle: nil)
        tableView.register(nib, forIdentifier: Constants.WorkspaceCellID)
    }

    // MARK: - Public
    func update(_ workspaces: [Workspace]) {
        self.workspaces = workspaces
    }
}

extension WorkspaceTableViewAdapter: NSTableViewDataSource, NSTableViewDelegate {

    func numberOfRows(in tableView: NSTableView) -> Int {
        return workspaces.count
    }

    func tableView(_ tableView: NSTableView, viewFor tableColumn: NSTableColumn?, row: Int) -> NSView? {
        let cell = tableView.makeView(withIdentifier: Constants.WorkspaceCellID, owner: self) as! WorkspaceCellView

        let workspace = workspaces[row]
        cell.update(workspace)

        return cell
    }
}
