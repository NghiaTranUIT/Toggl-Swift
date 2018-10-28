//
//  LoginViewModel.swift
//  DesktopCore
//
//  Created by Nghia Tran on 10/17/18.
//  Copyright © 2018 com.nsproxy.proxy. All rights reserved.
//

import Foundation

// MARK: - LoginViewModelType
public protocol LoginViewModelType {

    func login(email: String, password: String, complete: @escaping (Result<User>) -> Void)
    func login(apiToken: String, complete: @escaping (Result<User>) -> Void)
    func loginWithSession(apiToken: String, complete: @escaping (Result<User>) -> Void)
}

// MARK: - LoginViewModel
public final class LoginViewModel: LoginViewModelType {

    // MARK: - Variable
    private let network: NetworkServiceType

    // MARK: - Init
    public init(network: NetworkServiceType) {
        self.network = network
    }

    // MARK: - Public

    /// Login with email and password
    ///
    /// - Parameters:
    ///   - email: Email of the account
    ///   - password: password
    ///   - complete: Complete block, which wraps Result<User> model
    public func login(email: String, password: String, complete: @escaping (Result<User>) -> Void) {
        network.login(email: email, password: password) { (result) in
            DispatchQueue.main.async {
                complete(result)
            }
        }
    }

    /// Login with API token
    ///
    /// - Parameters:
    ///   - apiToken: API Token from Toggl
    ///   - complete: Complete block, which wraps Result<User> model
    public func login(apiToken: String, complete: @escaping (Result<User>) -> Void) {
        network.login(apiToken: apiToken) { (result) in
            DispatchQueue.main.async {
                complete(result)
            }
        }
    }

    /// Login with session
    ///
    /// - Parameters:
    ///   - apiToken: API Token from Toggl
    ///   - complete: Complete block, which wraps Result<User> model
    public func loginWithSession(apiToken: String, complete: @escaping (Result<User>) -> Void) {
        network.loginSession(apiToken: apiToken) { (result) in
            DispatchQueue.main.async {
                complete(result)
            }
        }
    }
}
