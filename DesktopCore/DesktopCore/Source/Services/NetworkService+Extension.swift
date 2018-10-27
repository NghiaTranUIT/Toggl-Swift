//
//  NetworkService+Extension.swift
//  DesktopCore
//
//  Created by Nghia Tran on 10/22/18.
//  Copyright © 2018 com.nsproxy.proxy. All rights reserved.
//

import Foundation

extension NetworkServiceType {

    public func login(email: String, password: String, complete: @escaping (Result<User>) -> Void) {
        let route = APIRoute.loginEmail(LoginEmailParameter(email: email, password: password))
        request(route, type: User.self, complete: complete)
    }
    
    public func login(apiToken: String, complete: @escaping (Result<User>) -> Void) {
        let route = APIRoute.loginAPIToken(LoginTokenParameter(apiToken: apiToken))
        request(route, type: User.self, complete: complete)
    }

    public func loginSession(apiToken: String, complete: @escaping (Result<User>) -> Void) {
        let route = APIRoute.loginWithSession(LoginTokenParameter(apiToken: apiToken))
        request(route, type: User.self, complete: complete)
    }
}
