//
//  Parameters.swift
//  DesktopCore
//
//  Created by Nghia Tran on 10/17/18.
//  Copyright © 2018 com.nsproxy.proxy. All rights reserved.
//

import Foundation

public protocol ParameterConvertible {

    func toParam() -> [String: Any]
}

public struct LoginEmailParameter {

    let email: String
    let password: String
}

public struct LoginTokenParameter {

    let apiToken: String
}
