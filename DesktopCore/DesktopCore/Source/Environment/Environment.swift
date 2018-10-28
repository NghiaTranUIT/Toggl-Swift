//
//  Environment.swift
//  TogglCore
//
//  Created by Nghia Tran on 10/28/18.
//  Copyright © 2018 com.nsproxy.proxy. All rights reserved.
//

import Foundation

/// Environment for networking
struct Environment {

    static let `default` = Environment(host: "https://www.toggl.com/api/v8")

    // MARK: - Variable
    let host: String
}
