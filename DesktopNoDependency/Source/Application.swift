//
//  Application.swift
//  DesktopNoDependency
//
//  Created by Nghia Tran on 10/17/18.
//  Copyright © 2018 com.nsproxy.proxy. All rights reserved.
//

import Foundation
import TogglCore

final class Application {

    // MARK: - Variable
    let network: NetworkServiceType
    let navigator: NavigatorType

    // MARK: - Init
    init(network: NetworkServiceType, navigator: NavigatorType) {
        self.network = network
        self.navigator = navigator
    }

    class func `default`() -> Application {
        let urlSession = URLSession(configuration: .default)
        let jsonSerializer = JSONSerializer()
        let network = NetworkService(fetcher: urlSession, serializer: jsonSerializer)
        let navigator = Navigator()
        let app = Application(network: network, navigator: navigator)
        return app
    }

    // MARK: - Public
    func start() {
        navigator.present(.login, transition: Transition.pushDetail)
    }
}
