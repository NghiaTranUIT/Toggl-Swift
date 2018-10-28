//
//  HeaderBuilder.swift
//  DesktopCore
//
//  Created by Nghia Tran on 10/22/18.
//  Copyright © 2018 com.nsproxy.proxy. All rights reserved.
//

import Foundation

/// Convenience class to build Header
struct HeaderBuilder {

    /// Build Authorization Header easily
    /// The text will convert to Base64, then combining to Basic <Base64String>
    ///
    /// - Parameter text: The input
    /// - Returns: The Authorization Header
    static func buildAuthorization(with text: String) -> Header {
        let encodedString = text.data(using: String.Encoding.utf8)!.base64EncodedString()
        let value = "Basic \(encodedString)"
        return Header(key: "Authorization", value: value)
    }
}
