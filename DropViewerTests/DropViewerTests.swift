//
//  DropViewerTests.swift
//  DropViewerTests
//
//  Created by Ajaypal Singh on 11/4/21.
//

import XCTest
@testable import DropViewer

class DropViewerTests: XCTestCase {

    var moviesData: Movies!

    override func setUpWithError() throws {
        super.setUp()
        let data = try getData(fromJSON: "movies")
        moviesData = try JSONDecoder().decode(Movies.self, from: data)
    }

    override func tearDownWithError() throws {
        moviesData = nil
        super.tearDown()
    }

    func testSearchResponse() throws {

        XCTAssertEqual(moviesData.title, "Movies")

        let detail = moviesData.moviesList.first

        XCTAssertEqual(detail?.title, "Avengers")
        XCTAssertEqual(detail?.imageUrl, "https://upload.wikimedia.org/wikipedia/en/0/0d/Avengers_Endgame_poster.jpg")
        XCTAssertEqual(detail?.rating, 8.8)
        XCTAssertEqual(detail?.releaseDate, "24 April 2019")
    }

}

