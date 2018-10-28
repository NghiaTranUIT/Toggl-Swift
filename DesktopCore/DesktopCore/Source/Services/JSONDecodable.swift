//
//  JSONDecodable.swift
//  DesktopCore
//
//  Created by Nghia Tran on 10/17/18.
//  Copyright © 2018 com.nsproxy.proxy. All rights reserved.
//

import Foundation

/// Responsible for decode json to model
public protocol JSONDecodable {

    static func decode(_ json: [String: Any]) -> Self?
}
