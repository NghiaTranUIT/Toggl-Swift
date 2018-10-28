//
//  HTTPMethod.swift
//  TogglCore
//
//  Created by Nghia Tran on 10/27/18.
//  Copyright © 2018 com.nsproxy.proxy. All rights reserved.
//

import Foundation

/// HTTPMethod convenience
enum HTTPMethod: String {

    case get
    case post
    case head

    /// Convert method to Uppercase string
    var method: String {
        return self.rawValue.uppercased()
    }
}
