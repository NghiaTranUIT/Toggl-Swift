//
//  WorkspaceCellView.swift
//  DesktopNoDependency
//
//  Created by Nghia Tran on 10/18/18.
//  Copyright © 2018 com.nsproxy.proxy. All rights reserved.
//

import Cocoa
import TogglCore

final class WorkspaceCellView: NSTableCellView {

    func update(_ workspace: Workspace) {
        textField?.stringValue = workspace.name
    }
}
