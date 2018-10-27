//
//  APIRoute+URLRequestConvertible.swift
//  TogglCore
//
//  Created by Nghia Tran on 10/27/18.
//  Copyright © 2018 com.nsproxy.proxy. All rights reserved.
//

import Foundation

// MARK: - URLRequestConvertible
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
