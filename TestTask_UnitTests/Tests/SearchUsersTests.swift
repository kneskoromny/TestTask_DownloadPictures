//
//  SearchUsersTests.swift
//  TestTask_DownloadPicturesTests
//
//  Created by Кирилл Нескоромный on 21.11.2021.
//

import XCTest
@testable import TestTask_DownloadPictures

class SearchUsersTests: XCTestCase {
    
    var sut: [User]!

    override func setUpWithError() throws {
        super.setUp()
        
        let data = try getData(fromJSON: "User")
        sut = try JSONDecoder().decode([User].self, from: data)
    }

    override func tearDownWithError() throws {
        sut = nil
        super.tearDown()
    }

    func test_JSONMapping() {
        XCTAssertNotNil(sut)
        XCTAssertEqual(sut.count, 10)
        XCTAssertEqual(sut.first?.name, "Leanne Graham")
        XCTAssertEqual(sut.first?.address.city, "Gwenborough")
        XCTAssertEqual(sut.first?.company.name, "Romaguera-Crona")
    }

}
