//
//  URLRequestConvertible.swift
//  TogglCore
//
//  Created by Nghia Tran on 10/27/18.
//  Copyright © 2018 com.nsproxy.proxy. All rights reserved.
//

import Foundation

protocol URLRequestConvertible {

    func toRequest() throws -> URLRequest
}
