//
//  NetworkServiceTests.swift
//  DesktopCoreTests
//
//  Created by Nghia Tran on 10/17/18.
//  Copyright © 2018 com.nsproxy.proxy. All rights reserved.
//

import XCTest
@testable import DesktopCore

class NetworkServiceTests: XCTestCase {

    private var network: NetworkServiceType!

    override func setUp() {

    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testLoginSuccess() {

        // Given
        network = NetworkService(fetcher: StubFetcher(), serializer: JSONSerializer())
        let email = "john.doe@gmail.com"
        let password = "123"
        let givenUser = User(email: "john.doe@gmail.com", fullName: "John Doe")

        // When
        let route = APIRoute.login(LoginParameter(email: email, password: password))
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
        let route = APIRoute.login(LoginParameter(email: email, password: password))
        network.request(route, type: User.self) { (result) in

            // Then
            switch result {
            case .error(let error):
               XCTAssertTrue(true)
            case .success(let user):
                XCTFail()
            }
        }
    }
}
