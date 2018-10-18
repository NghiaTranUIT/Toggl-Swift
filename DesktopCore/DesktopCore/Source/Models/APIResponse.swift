//
//  APIResponse.swift
//  DesktopCore
//
//  Created by Nghia Tran on 10/17/18.
//  Copyright © 2018 com.nsproxy.proxy. All rights reserved.
//

import Foundation

struct Constants {
    static let Since = "since"
    static let Data = "data"
}

public struct APIResponse<T: JSONDecodable>: JSONDecodable {

    let since: TimeInterval
    let data: T

    public static func decode(_ json: [String : Any]) -> APIResponse<T>? {
        guard let since = json[Constants.Since] as? TimeInterval,
            let data = json[Constants.Data] as? [String: Any],
            let obj = T.decode(data) else {
                return nil
        }
        return APIResponse(since: since, data: obj)
    }
}
