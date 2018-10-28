//
//  NetworkService+Extension.swift
//  DesktopCore
//
//  Created by Nghia Tran on 10/22/18.
//  Copyright © 2018 com.nsproxy.proxy. All rights reserved.
//

import Foundation

/// Convenience extension
extension NetworkServiceType {

    /// Login with email and password
    ///
    /// - Parameters:
    ///   - email: Email of the account
    ///   - password: password
    ///   - complete: Complete block, which wraps Result<User> model
    public func login(email: String, password: String, complete: @escaping (Result<User>) -> Void) {
        let route = APIRoute.loginEmail(LoginEmailParameter(email: email, password: password))
        request(route, type: User.self, complete: complete)
    }
    
    /// Login with API token
    ///
    /// - Parameters:
    ///   - apiToken: API Token from Toggl
    ///   - complete: Complete block, which wraps Result<User> model
    public func login(apiToken: String, complete: @escaping (Result<User>) -> Void) {
        let route = APIRoute.loginAPIToken(LoginTokenParameter(apiToken: apiToken))
        request(route, type: User.self, complete: complete)
    }

    /// Login with session
    ///
    /// - Parameters:
    ///   - apiToken: API Token from Toggl
    ///   - complete: Complete block, which wraps Result<User> model
    public func loginSession(apiToken: String, complete: @escaping (Result<User>) -> Void) {
        let route = APIRoute.loginWithSession(LoginTokenParameter(apiToken: apiToken))
        request(route, type: User.self, complete: complete)
    }
}
