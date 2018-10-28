//
//  StubFetcher.swift
//  DesktopCoreTests
//
//  Created by Nghia Tran on 10/17/18.
//  Copyright © 2018 com.nsproxy.proxy. All rights reserved.
//

import Foundation
import TogglCore

struct StubFetcher: Fetchable {

    func request(_ urlRequest: URLRequest, block: @escaping (Data?, URLResponse?, Error?) -> Void) {
        let data = try! Data(fileName: "User")
        block(data, nil, nil)
    }
}

struct FailStubFetcher: Fetchable {

    func request(_ urlRequest: URLRequest, block: @escaping (Data?, URLResponse?, Error?) -> Void) {
        block(nil, nil, NetworkingError.invalidURL)
    }
}

struct FailStatusCodeFetcher: Fetchable {

    func request(_ urlRequest: URLRequest, block: @escaping (Data?, URLResponse?, Error?) -> Void) {
        let response = HTTPURLResponse(url: urlRequest.url!, statusCode: 400, httpVersion: "1.0", headerFields: [:])
        block(nil, response, nil)
    }
}
