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

public enum APIRoute {

    case login(LoginParameter)
    case project

    var baseURL: String {
        return "https://www.toggl.com/api/v8"
    }

    var path: String {
        switch self {
        case .login:
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
        case .login(let param):
            let combination = "\(param.email):\(param.password)"
            let encodedString = combination.data(using: String.Encoding.utf8)!.base64EncodedString()
            let value = "Basic \(encodedString)"
            defaultHeaders.append(Header(key: "Authorization", value: value))
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
