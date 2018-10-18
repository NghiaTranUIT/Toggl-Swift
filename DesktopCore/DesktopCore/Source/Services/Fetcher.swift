//
//  Fetcher.swift
//  DesktopCore
//
//  Created by Nghia Tran on 10/17/18.
//  Copyright © 2018 com.nsproxy.proxy. All rights reserved.
//

import Foundation

public protocol Fetchable {

    func request(_ urlRequest: URLRequest, block: @escaping (Data?, URLResponse?, Error?) -> Void)
}

extension URLSession: Fetchable {

    public func request(_ urlRequest: URLRequest, block: @escaping (Data?, URLResponse?, Error?) -> Void) {
        let task = dataTask(with: urlRequest) { (data, response, error) in
            block(data, response, error)
        }
        task.resume()
    }
}
