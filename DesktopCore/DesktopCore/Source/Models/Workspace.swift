//
//  Workspace.swift
//  DesktopCore
//
//  Created by Nghia Tran on 10/18/18.
//  Copyright © 2018 com.nsproxy.proxy. All rights reserved.
//

import Foundation

/// Represent for workspace
public struct Workspace: JSONDecodable {

    // MARK: - Variable
    public let id: Int
    public let name: String

    // MARK: - JSONDecodable
    public static func decode(_ json: [String : Any]) -> Workspace? {
        guard let id = json["id"] as? Int,
            let name = json["name"] as? String else { return nil }
        return Workspace(id: id, name: name)
    }
}
