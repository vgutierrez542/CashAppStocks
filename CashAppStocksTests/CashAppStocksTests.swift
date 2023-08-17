//
//  CashAppStocksTests.swift
//  CashAppStocksTests
//
//  Created by Victor Gutierrez on 8/16/23.
//

import XCTest
@testable import CashAppStocks

final class CashAppStocksTests: XCTestCase {

    private let correctJson = "https://storage.googleapis.com/cash-homework/cash-stocks-api/portfolio.json"
    private let malformedJson = "https://storage.googleapis.com/cash-homework/cash-stocks-api/portfolio_malformed.json"
    private let emptyJson = "https://storage.googleapis.com/cash-homework/cash-stocks-api/portfolio_empty.json"

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testCorrectJsonDecoding() throws {
        let expectation = self.expectation(description: "Fetch correct JSON")
        guard let url = URL(string: correctJson) else {
            XCTFail("Invalid URL")
            return
        }

        URLSession.shared.dataTask(with: url) { (data, response, error) in
            XCTAssertNil(error)
            XCTAssertNotNil(data)
            
            let decoder = JSONDecoder()
            do {
                let portfolio = try decoder.decode(Portfolio.self, from: data!)
                XCTAssertNotNil(portfolio)
                XCTAssertFalse(portfolio.stocks.isEmpty)
            } catch {
                XCTFail("Decoding failed with error: \(error)")
            }
            
            expectation.fulfill()
        }.resume()
        
        waitForExpectations(timeout: 10, handler: nil)
    }

    func testMalformedJsonDecoding() throws {
        let expectation = self.expectation(description: "Fetch malformed JSON")
        guard let url = URL(string: malformedJson) else {
            XCTFail("Invalid URL")
            return
        }

        URLSession.shared.dataTask(with: url) { (data, response, error) in
            XCTAssertNil(error)
            XCTAssertNotNil(data)
            
            let decoder = JSONDecoder()
            do {
                let _ = try decoder.decode(Portfolio.self, from: data!)
                XCTFail("Decoding should not succeed for malformed JSON")
            } catch {
                // Expected failure
            }
            
            expectation.fulfill()
        }.resume()
        
        waitForExpectations(timeout: 10, handler: nil)
    }

    func testEmptyJsonDecoding() throws {
        let expectation = self.expectation(description: "Fetch empty JSON")
        guard let url = URL(string: emptyJson) else {
            XCTFail("Invalid URL")
            return
        }

        URLSession.shared.dataTask(with: url) { (data, response, error) in
            XCTAssertNil(error)
            XCTAssertNotNil(data)
            
            let decoder = JSONDecoder()
            do {
                let portfolio = try decoder.decode(Portfolio.self, from: data!)
                XCTAssertNotNil(portfolio)
                XCTAssertTrue(portfolio.stocks.isEmpty)
            } catch {
                XCTFail("Decoding failed with error: \(error)")
            }
            
            expectation.fulfill()
        }.resume()
        
        waitForExpectations(timeout: 10, handler: nil)
    }
}

