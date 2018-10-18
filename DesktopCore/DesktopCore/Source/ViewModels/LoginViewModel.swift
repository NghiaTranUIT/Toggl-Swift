//
//  LoginViewModel.swift
//  DesktopCore
//
//  Created by Nghia Tran on 10/17/18.
//  Copyright © 2018 com.nsproxy.proxy. All rights reserved.
//

import Foundation

public protocol LoginViewModelType {

    func login(email: String, password: String)
}

public final class LoginViewModel: LoginViewModelType {

    // MARK: - Variable
    private let network: NetworkServiceType

    // MARK: - Init
    public init(network: NetworkServiceType) {
        self.network = network
    }

    // MARK: - Public
    public func login(email: String, password: String) {
        let route = APIRoute.login(LoginParameter(email: email, password: password))
        network.request(route, type: User.self) { (result) in
            switch result {
            case .error(let error):
                print("Error \(error)")
            case .success(let user):
                print("User \(user)")
            }
        }
    }
}
