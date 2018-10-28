//
//  NetworkService.swift
//  DesktopCore
//
//  Created by Nghia Tran on 10/17/18.
//  Copyright © 2018 com.nsproxy.proxy. All rights reserved.
//

import Foundation

public protocol NetworkServiceType {

    func request<T: JSONDecodable>(_ route: APIRoute, type: T.Type, complete: @escaping (Result<T>) -> Void)
}

public enum NetworkingError: Error {
    case invalidURL
    case invalidJSONParam
    case serverError(Error)
    case invalidJSON
}



public final class NetworkService: NetworkServiceType {

    // MARK: - Variable
    private let fetcher: Fetchable
    private let serializer: Serializable
    private let plugins: [PluginType]

    // MARK: - Init
    public init(fetcher: Fetchable, serializer: Serializable, plugins: [PluginType] = []) {
        self.fetcher = fetcher
        self.serializer = serializer
        self.plugins = plugins
    }

    // MARK: - Public
    public func request<T: JSONDecodable>(_ route: APIRoute, type: T.Type, complete: @escaping (Result<T>) -> Void) {

        // Get request
        var urlRequest: URLRequest!
        do {
            urlRequest = try route.toRequest()
        }
        catch let error {
            complete(Result.error(error))
            return
        }

        // Plugins
        plugins.forEach { $0.process(urlRequest) }
        
        // Fetch
        fetcher.request(urlRequest) {[weak self] (data, response, error) in
            guard let strongSelf = self else { return }

            // Error
            if let error = error {
                complete(Result.error(error))
                return
            }

            // Status code
            if let urlResponse = response as? HTTPURLResponse {
                guard 200..<300 ~= urlResponse.statusCode else {
                    let error = NSError(domain: "com.toggl", code: urlResponse.statusCode, userInfo: nil)
                    complete(Result.error(NetworkingError.serverError(error)))
                    return
                }
            }

            // Serialize
            guard let data = data,
            let apiResponse = strongSelf.serializer.serialize(data, type: type) else {
                complete(Result.error(NetworkingError.invalidJSON))
                return
            }

            // Success
            complete(Result<T>.success(apiResponse.data))
        }
    }
}
