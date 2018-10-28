//
//  Data+Exts.swift
//  TogglCore
//
//  Created by Nghia Tran on 10/28/18.
//  Copyright © 2018 com.nsproxy.proxy. All rights reserved.
//

import Foundation
import TogglCore

extension Data {

    init(fileName: String, type: String = "json") throws {
        class Test { }
        let path = Bundle(for: Test.self).path(forResource: fileName, ofType: type)!
        try self.init(contentsOf: URL(fileURLWithPath: path))
    }
}
