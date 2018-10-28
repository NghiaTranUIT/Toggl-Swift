//
//  APIRoute.swift
//  DesktopCore
//
//  Created by Nghia Tran on 10/17/18.
//  Copyright © 2018 com.nsproxy.proxy. All rights reserved.
//

import Foundation

// MARK: - APIRoute
/// All Toggl Route could be represent here
/// It's convenience way to modularize the route
/// One of benefit is that it hides the Business Login and abstract the Networking Layer in caller-side
///
/// It's a minimal version of Moya https://github.com/Moya/Moya
public enum APIRoute {

    case loginEmail(LoginEmailParameter)
    case loginAPIToken(LoginTokenParameter)
    case loginWithSession(LoginTokenParameter)
    case project
}
