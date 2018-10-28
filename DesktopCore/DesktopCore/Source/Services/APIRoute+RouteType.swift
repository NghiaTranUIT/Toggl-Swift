//
//  APIRoute+RouteType.swift
//  TogglCore
//
//  Created by Nghia Tran on 10/27/18.
//  Copyright © 2018 com.nsproxy.proxy. All rights reserved.
//

import Foundation

// MARK: - RouteType
extension APIRoute: RouteType {

    /// Base URL of Toggl
    /// We can change the enviroment in runtime
    /// Ex: Staging, Production, ...
    var baseURL: String {
        return Environment.default.host
    }

    /// Path for each route
    var path: String {
        switch self {
        case .loginEmail,
             .loginAPIToken:
            return "/me"
        case .project:
            return "/project"
        case .loginWithSession:
            return "/sessions"
        }
    }

    /// HTTP method
    var httpMethod: HTTPMethod {
        switch self {
        case .loginWithSession:
            return .post
        default:
            return .get
        }
    }

    /// Parameter
    /// It will serialize to JSON Data
    var parameter: [String: Any]? {
        return nil
    }

    /// Headers of request
    var headers: [Header] {
        var defaultHeaders = [Header(key: "Content-Type", value: "application/json")]
        switch self {
        case .loginEmail(let param):
            let combination = "\(param.email):\(param.password)"
            let header = HeaderBuilder.buildAuthorization(with: combination)
            defaultHeaders.append(header)
        case .loginAPIToken(let param),
             .loginWithSession(let param):
            let combination = "\(param.apiToken):api_token"
            let header = HeaderBuilder.buildAuthorization(with: combination)
            defaultHeaders.append(header)
        default:
            break
        }
        return defaultHeaders
    }
}
