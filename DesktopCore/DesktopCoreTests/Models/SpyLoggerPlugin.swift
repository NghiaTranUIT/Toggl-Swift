//
//  SpyLoggerPlugin.swift
//  TogglCore
//
//  Created by Nghia Tran on 10/28/18.
//  Copyright © 2018 com.nsproxy.proxy. All rights reserved.
//

import Foundation
import TogglCore

class SpyLoggerPlugin: PluginType {

    var isCall = false

    func process(_ urlRequest: URLRequest) -> URLRequest {
        isCall = true
        return urlRequest
    }
}
