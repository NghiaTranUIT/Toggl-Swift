//
//  NetworkServiceTests.swift
//  DesktopCoreTests
//
//  Created by Nghia Tran on 10/17/18.
//  Copyright © 2018 com.nsproxy.proxy. All rights reserved.
//

import XCTest
@testable import TogglCore

class NetworkServiceTests: XCTestCase {

    private var network: NetworkServiceType!

    override func setUp() {

    }

    override func tearDown() {

    }

    func testLoginEmailSuccess() {

        // Given
        network = NetworkService(fetcher: StubFetcher(), serializer: JSONSerializer())
        let email = "john.doe@gmail.com"
        let password = "123"
        let givenUser = User(email: "john.doe@gmail.com", fullName: "John Doe", workspaces: [])

        // When
        let route = APIRoute.loginEmail(LoginEmailParameter(email: email, password: password))
        network.request(route, type: User.self) { (result) in

            // Then
            switch result {
            case .error:
                XCTFail("The networking service was fail")
            case .success(let user):
                XCTAssertEqual(user, givenUser)
            }
        }
    }

    func testLoginAPISuccess() {

        // Given
        network = NetworkService(fetcher: StubFetcher(), serializer: JSONSerializer())
        let givenUser = User(email: "john.doe@gmail.com", fullName: "John Doe", workspaces: [])

        // When
        let route = APIRoute.loginAPIToken(LoginTokenParameter(apiToken: "api"))
        network.request(route, type: User.self) { (result) in

            // Then
            switch result {
            case .error:
                XCTFail("The networking service was fail")
            case .success(let user):
                XCTAssertEqual(user, givenUser)
            }
        }
    }

    func testLoginSessionSuccess() {

        // Given
        network = NetworkService(fetcher: StubFetcher(), serializer: JSONSerializer())
        let givenUser = User(email: "john.doe@gmail.com", fullName: "John Doe", workspaces: [])

        // When
        let route = APIRoute.loginWithSession(LoginTokenParameter(apiToken: "api"))
        network.request(route, type: User.self) { (result) in

            // Then
            switch result {
            case .error:
                XCTFail("The networking service was fail")
            case .success(let user):
                XCTAssertEqual(user, givenUser)
            }
        }
    }

    func testLoginErrorBecauseSerializer() {

        // Given
        network = NetworkService(fetcher: FailStubFetcher(), serializer: JSONSerializer())
        let email = "john.doe@gmail.com"
        let password = "123"

        // When
        let route = APIRoute.loginEmail(LoginEmailParameter(email: email, password: password))
        network.request(route, type: User.self) { (result) in

            // Then
            switch result {
            case .error:
               XCTAssertTrue(true)
            case .success:
                XCTFail()
            }
        }
    }
}
