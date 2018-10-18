//
//  Navigator.swift
//  DesktopNoDependency
//
//  Created by Nghia Tran on 10/17/18.
//  Copyright © 2018 com.nsproxy.proxy. All rights reserved.
//

import Foundation

protocol NavigatorType {

    func present(_ scene: Scene, transition: Transition)
}

enum Scene {

    case login
    case project
}

enum Transition {

    case rootController
    case pushDetail
}

final class Navigator: NavigatorType {

    func present(_ scene: Scene, transition: Transition) {

    }
}
