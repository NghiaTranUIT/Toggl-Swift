//
//  APIRoute.swift
//  DesktopCore
//
//  Created by Nghia Tran on 10/17/18.
//  Copyright © 2018 com.nsproxy.proxy. All rights reserved.
//

import Foundation

protocol URLRequestConvertible {

    func toRequest() throws -> URLRequest
}

struct Header {

    let key: String
    let value: String
}

enum HTTPMethod: String {

    case get
    case post
    case head

    var method: String {
        return self.rawValue.uppercased()
    }
}

protocol RouteType {

    var baseURL: String { get }
    var path: String { get}
}

public enum APIRoute {

    case loginEmail(LoginEmailParameter)
    case loginAPIToken(LoginTokenParameter)
    case project
}

extension APIRoute: RouteType {

    var baseURL: String {
        return "https://www.toggl.com/api/v8"
    }

    var path: String {
        switch self {
        case .loginEmail,
             .loginAPIToken:
            return "/me"
        case .project:
            return "/project"
        }
    }

    var httpMethod: HTTPMethod {
        return .get
    }

    var parameter: [String: Any]? {
        return nil
    }

    var headers: [Header] {
        var defaultHeaders = [Header(key: "Content-Type", value: "application/json")]
        switch self {
        case .loginEmail(let param):
            let combination = "\(param.email):\(param.password)"
            let header = HeaderBuilder.buildAuthorization(with: combination)
            defaultHeaders.append(header)
        case .loginAPIToken(let param):
            let combination = "\(param.apiToken):api_token"
            let header = HeaderBuilder.buildAuthorization(with: combination)
            defaultHeaders.append(header)
        default:
            break
        }
        return defaultHeaders
    }
}

extension APIRoute: URLRequestConvertible {

    func toRequest() throws -> URLRequest {
        guard let url = URL(string: "\(baseURL)\(path)") else {
            throw NetworkingError.invalidURL
        }

        var urlRequest = URLRequest(url: url)

        // Header
        headers.forEach {
            urlRequest.addValue($0.value, forHTTPHeaderField: $0.key)
        }

        // Body
        if let param = parameter {
            do {
                let data = try JSONSerialization.data(withJSONObject: param, options: [])
                urlRequest.httpBody = data
            } catch {
                throw NetworkingError.invalidJSONParam
            }
        }

        return urlRequest
    }
}
