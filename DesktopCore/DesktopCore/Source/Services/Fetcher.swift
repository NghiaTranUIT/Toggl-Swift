//
//  Fetcher.swift
//  DesktopCore
//
//  Created by Nghia Tran on 10/17/18.
//  Copyright © 2018 com.nsproxy.proxy. All rights reserved.
//

import Foundation

/// Fetcheable is general protocol in order to fetch data from URLRequest
/// We can introduce StubFetcher when testing, which is adopted from Fetcher
/// to provide stub JSON data
public protocol Fetchable {

    func request(_ urlRequest: URLRequest, block: @escaping (Data?, URLResponse?, Error?) -> Void)
}

/// Extension URLSession with Fetchable
extension URLSession: Fetchable {

    /// Request the data from Internet
    /// By default, it will use DataTask
    ///
    /// - Parameters:
    ///   - urlRequest: URLRequest instance
    ///   - block: Complete block after DataDask has finished
    public func request(_ urlRequest: URLRequest, block: @escaping (Data?, URLResponse?, Error?) -> Void) {
        let task = dataTask(with: urlRequest) { (data, response, error) in
            block(data, response, error)
        }
        task.resume()
    }
}
