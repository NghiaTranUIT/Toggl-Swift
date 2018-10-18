//
//  StubFetcher.swift
//  DesktopCoreTests
//
//  Created by Nghia Tran on 10/17/18.
//  Copyright © 2018 com.nsproxy.proxy. All rights reserved.
//

import Foundation
import DesktopCore

struct StubFetcher: Fetchable {

    func request(_ urlRequest: URLRequest, block: @escaping (Data?, URLResponse?, Error?) -> Void) {
        class Test {}
        let path = Bundle.init(for: Test.self).path(forResource: "User", ofType: "json")!
        let data = try! Data(contentsOf: URL(fileURLWithPath: path))
        block(data, nil, nil)
    }
}

struct FailStubFetcher: Fetchable {

    func request(_ urlRequest: URLRequest, block: @escaping (Data?, URLResponse?, Error?) -> Void) {
        block(nil, nil, NetworkingError.invalidURL)
    }
}
