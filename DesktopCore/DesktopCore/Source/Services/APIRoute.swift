//
//  APIRoute.swift
//  DesktopCore
//
//  Created by Nghia Tran on 10/17/18.
//  Copyright © 2018 com.nsproxy.proxy. All rights reserved.
//

import Foundation

// MARK: - APIRoute
public enum APIRoute {

    case loginEmail(LoginEmailParameter)
    case loginAPIToken(LoginTokenParameter)
    case loginWithSession(LoginTokenParameter)
    case project
}
