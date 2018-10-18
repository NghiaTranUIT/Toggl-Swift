//
//  User.swift
//  DesktopCore
//
//  Created by Nghia Tran on 10/17/18.
//  Copyright © 2018 com.nsproxy.proxy. All rights reserved.
//

import Foundation

public struct User: JSONDecodable {

    struct Constants {
        static let Email = "email"
        static let Fullname = "fullname"
    }

    public let email: String
    public let fullName: String

    public static func decode(_ json: [String : Any]) -> User? {
        guard let email = json[Constants.Email] as? String,
            let fullname = json[Constants.Fullname] as? String else { return nil }
        return User(email: email, fullName: fullname)
    }
}

extension User: Equatable {

    public static func == (lhs: User, rhs: User) -> Bool {
        return lhs.email == rhs.email &&
            lhs.fullName == rhs.fullName
    }
}
