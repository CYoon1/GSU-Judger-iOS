//
//  GSU_JudgerTests.swift
//  GSU-JudgerTests
//
//  Created by Christopher Yoon on 11/16/23.
//

import XCTest
@testable import GSU_Judger

final class GSU_JudgerTests: XCTestCase {
    func testGetProjects() throws {
        let testProjects = DataManager().projects
        XCTAssertNotNil(testProjects)
    }
    func testGetEvents() throws {
        let testEvents = DataManager().events
        XCTAssertNotNil(testEvents)
        
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        measure {
            // Put the code you want to measure the time of here.
        }
    }

}
