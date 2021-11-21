//
//  Extension + XCTestCase.swift
//  TestTask_DownloadPicturesTests
//
//  Created by Кирилл Нескоромный on 21.11.2021.
//

import XCTest

extension XCTestCase {
  enum TestError: Error {
    case fileNotFound
  }
  
  func getData(fromJSON fileName: String) throws -> Data {
    let bundle = Bundle(for: type(of: self))
    guard let url = bundle.url(forResource: fileName, withExtension: "json") else {
      XCTFail("Missing File: \(fileName).json")
      throw TestError.fileNotFound
    }
    do {
      let data = try Data(contentsOf: url)
      return data
    } catch {
      throw error
    }
  }
}
