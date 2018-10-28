//
//  JSONSerializerTests.swift
//  TogglCoreTests
//
//  Created by Nghia Tran on 10/28/18.
//  Copyright © 2018 com.nsproxy.proxy. All rights reserved.
//

import XCTest
@testable import TogglCore

class JSONSerializerTests: XCTestCase {

    // MARK: - Variable
    private var jsonSerializer: JSONSerializer!

    override func setUp() {
        jsonSerializer = JSONSerializer()
    }

    override func tearDown() {

    }

    func testJSONSerializerParseUserJSONSuccess() {

        // Given
        let data = try! Data(fileName: "User")
        let givenUser = User(email: "john.doe@gmail.com", fullName: "John Doe", workspaces: [])

        // When
        let response = jsonSerializer!.serialize(data, type: User.self)

        // Then
        XCTAssertNotNil(response)
        XCTAssertEqual(response!.data, givenUser)
    }

    func testJSONSerializerParseJSONFailWithIncorrectType() {

        // Given
        let data = try! Data(fileName: "User")

        // When
        let response = jsonSerializer!.serialize(data, type: Workspace.self)

        // Then
        XCTAssertNil(response)
    }
}
