//
//  Serializable.swift
//  DesktopCore
//
//  Created by Nghia Tran on 10/17/18.
//  Copyright © 2018 com.nsproxy.proxy. All rights reserved.
//

import Foundation


/// General Serializable protocol
/// We could adopt this protocl in order to provide many type of serializer
/// Ex: JSON or XML or Thrift
public protocol Serializable {

    func serialize<T: JSONDecodable>(_ data: Data, type: T.Type) -> APIResponse<T>?
}

/// JSONSerializer is responsible for serializing the JSON to proper model
public final class JSONSerializer: Serializable {

    // MARK: - init
    public init() {}

    // MARK: - Public

    /// Main func to serialize the Data to proper model
    ///
    /// - Parameters:
    ///   - data: Data from File or Internet
    ///   - type: The type your need to parse, which is adopted JSONDecodable
    /// - Returns: APIResponse Model
    public func serialize<T: JSONDecodable>(_ data: Data, type: T.Type) -> APIResponse<T>? {
        guard let jsonObj = try? JSONSerialization.jsonObject(with: data, options: JSONSerialization.ReadingOptions.allowFragments),
        let json = jsonObj as? [String: Any] else { return nil }
        print("JSON \(json)")
        return APIResponse<T>.decode(json)
    }
}
