//
//  SearchAlbumsTests.swift
//  TestTask_DownloadPicturesTests
//
//  Created by Кирилл Нескоромный on 21.11.2021.
//

import XCTest
@testable import TestTask_DownloadPictures

class SearchAlbumsTests: XCTestCase {
    
    var sut: [Album]!

    override func setUpWithError() throws {
        super.setUp()
        
        let data = try getData(fromJSON: "Album")
        sut = try JSONDecoder().decode([Album].self, from: data)
    }

    override func tearDownWithError() throws {
        sut = nil
        super.tearDown()
    }

    func test_JSONMapping() {
        XCTAssertNotNil(sut)
        XCTAssertEqual(sut.count, 100)
        XCTAssertEqual(sut.first?.userID, 1)
        XCTAssertEqual(sut.first?.id, 1)
        XCTAssertEqual(sut.first?.title, "quidem molestiae enim")
    }

}
