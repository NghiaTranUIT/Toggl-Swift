//
//  Result.swift
//  TogglCore
//
//  Created by Nghia Tran on 10/28/18.
//  Copyright © 2018 com.nsproxy.proxy. All rights reserved.
//

import Foundation

/// Helper Generic Result<T> enum in order to encapsulate the state of the response
/// It coule be Error
/// Or sucess
/// It cooperates well with Networking Service
///
/// - success: The success value
/// - error: The error value
public enum Result<T> {

    case success(T)
    case error(Error)
}
