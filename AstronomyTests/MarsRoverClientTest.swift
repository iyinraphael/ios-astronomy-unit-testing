//
//  MarsRoverClientTest.swift
//  AstronomyTests
//
//  Created by Iyin Raphael on 2/11/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import XCTest
@testable import Astronomy


class MarsRoverClientTest: XCTestCase {
    
    /**
     What we'll be testing
     - Does fetchMarsRover  decode when giving the right string
     - In retropect does fetchPhotos get valid MarsRover type to decode and fetch photos
     - Are we getting the correct url in both use cases
     - Is the completion handler called if the networking fails
     - Is the completion handler called if the data is bad
     - Is the completion handler called if the data is good
     **/
    
    func testFetchMarsRover(){
        
        let mock = MockDataLoader()
        mock.data = validRoverJSON
        
        let marsRoverClient = MarsRoverClient(networkLoader: mock)
        let expect  = expectation(description: "wait for network call")
        
        marsRoverClient.fetchMarsRover(named: "Curiosity") { (marsRover, error) in
            XCTAssertNil(error)
            XCTAssertEqual(marsRover?.name, "Curiosity")
            XCTAssertEqual(marsRover?.maxSol, 10)
            XCTAssertEqual(marsRover?.numberOfPhotos, 4156)
            XCTAssertTrue(marsRover?.solDescriptions.count == 5, "Expecting photos array with five objects")
            expect.fulfill()
        }
        
        wait(for: [expect], timeout: 4)
        
    }

    func testFetchPhotos(){
        
    }
    
    func testGettingUrl() {
        
    }
    
    func testCompletionForFailedNetworking() {
        
    }
    
    func testCompletionForBadData() {
        
    }
    
    func testCompletionForGoodData() {
        
    }
    
    
}
