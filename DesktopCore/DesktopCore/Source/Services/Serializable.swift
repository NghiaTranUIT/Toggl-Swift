//
//  Serializable.swift
//  DesktopCore
//
//  Created by Nghia Tran on 10/17/18.
//  Copyright © 2018 com.nsproxy.proxy. All rights reserved.
//

import Foundation

public protocol Serializable {

    func serialize<T: JSONDecodable>(_ data: Data, type: T.Type) -> APIResponse<T>?
}

public final class JSONSerializer: Serializable {

    public init() {

    }

    public func serialize<T: JSONDecodable>(_ data: Data, type: T.Type) -> APIResponse<T>? {
        guard let jsonObj = try? JSONSerialization.jsonObject(with: data, options: JSONSerialization.ReadingOptions.allowFragments),
        let json = jsonObj as? [String: Any] else { return nil }
        print("JSON \(json)")
        return APIResponse<T>.decode(json)
    }
}
