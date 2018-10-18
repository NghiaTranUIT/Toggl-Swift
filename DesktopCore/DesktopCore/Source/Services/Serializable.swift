//
//  Serializable.swift
//  DesktopCore
//
//  Created by Nghia Tran on 10/17/18.
//  Copyright © 2018 com.nsproxy.proxy. All rights reserved.
//

import Foundation

public protocol Serializable {

    func serialize<T: JSONDecodable>(_ data: [String: Any], type: T.Type) -> APIResponse<T>?
}

public final class JSONSerializer: Serializable {

    public init() {

    }

    public func serialize<T: JSONDecodable>(_ data: [String : Any], type: T.Type) -> APIResponse<T>? {
        return APIResponse<T>.decode(data)
    }
}
