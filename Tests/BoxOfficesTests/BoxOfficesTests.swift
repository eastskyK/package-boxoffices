import XCTest
@testable import BoxOffices

final class BoxOfficesTests: XCTestCase {
    func test_fetchDailyTop10() async throws {
        let boxOffices = BoxOffices(key: "3a9f6520d722beed4230998b40404c78")
        let result = await boxOffices.fetchDailyTop10()
        let topMovies = try result.get()
        
        XCTAssertEqual(topMovies.count, 10)
    }
}
