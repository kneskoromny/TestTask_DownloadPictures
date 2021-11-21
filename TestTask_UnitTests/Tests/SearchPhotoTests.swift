//
//  SearchPhotoTests.swift
//  TestTask_DownloadPicturesTests
//
//  Created by Кирилл Нескоромный on 21.11.2021.
//

import XCTest
@testable import TestTask_DownloadPictures

class SearchPhotoTests: XCTestCase {
    
    var sut: [Photo]!

    override func setUpWithError() throws {
        super.setUp()
        
        let data = try getData(fromJSON: "Photo")
        sut = try JSONDecoder().decode([Photo].self, from: data)
    }

    override func tearDownWithError() throws {
        sut = nil
        super.tearDown()
    }

    func test_JSONMapping() {
        XCTAssertNotNil(sut)
        XCTAssertEqual(sut.count, 10)
        XCTAssertEqual(sut.first?.title, "accusamus beatae ad facilis cum similique qui sunt")
        XCTAssertEqual(sut.first?.url, "https://via.placeholder.com/600/92c952")
        XCTAssertEqual(sut.first?.thumbnailURL, "https://via.placeholder.com/150/92c952")
    }

}
