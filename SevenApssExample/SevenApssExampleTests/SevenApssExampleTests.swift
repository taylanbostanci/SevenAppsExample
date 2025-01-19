//
//  SevenApssExampleTests.swift
//  SevenApssExampleTests
//
//  Created by TaylanBostanci on 19.01.2025.
//

import XCTest
@testable import SevenApssExample

final class UserRepositoryTests: XCTestCase {
    
    var userRepository: UserRepository!
    var mockAPIClient: MockAPIClient!
    
    override func setUp() {
        super.setUp()
        mockAPIClient = MockAPIClient()
        userRepository = UserRepository(apiClient: mockAPIClient)
    }
    
    override func tearDown() {
        userRepository = nil
        mockAPIClient = nil
        super.tearDown()
    }
    
    // MARK: - Test Fetch Users Success
    func testFetchUsersSuccess() {
        
        let totalUsers = [
            UserResponseModel(
                id: 1,
                name: "Leanne Graham",
                username: "Bret",
                email: "Sincere@april.biz",
                phone: "1-770-736-8031 x56442",
                website: "hildegard.org"
            ),
            UserResponseModel(
                id: 2,
                name: "Ervin Howell",
                username: "Antonette",
                email: "Shanna@melissa.tv",
                phone: "010-692-6593 x09125",
                website: "anastasia.net"
            ),
            UserResponseModel(
                id: 3,
                name: "Clementine Bauch",
                username: "Samantha",
                email: "Nathan@yesenia.net",
                phone: "1-463-123-4447",
                website: "ramiro.info"
            ),
            UserResponseModel(
                id: 4,
                name: "Patricia Lebsack",
                username: "Karianne",
                email: "Julianne.OConner@kory.org",
                phone: "493-170-9623 x156",
                website: "kale.biz"
            ),
            UserResponseModel(
                id: 5,
                name: "Chelsey Dietrich",
                username: "Kamren",
                email: "Lucio_Hettinger@annie.ca",
                phone: "(254)954-1289",
                website: "demarco.info"
            ),
            UserResponseModel(
                id: 6,
                name: "Mrs. Dennis Schulist",
                username: "Leopoldo_Corkery",
                email: "Karley_Dach@jasper.info",
                phone: "1-477-935-8478 x6430",
                website: "ola.org"
            ),
            UserResponseModel(
                id: 7,
                name: "Kurtis Weissnat",
                username: "Elwyn.Skiles",
                email: "Telly.Hoeger@billy.biz",
                phone: "210.067.6132",
                website: "elvis.io"
            ),
            UserResponseModel(
                id: 8,
                name: "Nicholas Runolfsdottir V",
                username: "Maxime_Nienow",
                email: "Sherwood@rosamond.me",
                phone: "586.493.6943 x140",
                website: "jacynthe.com"
            ),
            UserResponseModel(
                id: 9,
                name: "Glenna Reichert",
                username: "Delphine",
                email: "Chaim_McDermott@dana.io",
                phone: "(775)976-6794 x41206",
                website: "conrad.com"
            ),
            UserResponseModel(
                id: 10,
                name: "Clementina DuBuque",
                username: "Moriah.Stanton",
                email: "Rey.Padberg@karina.biz",
                phone: "024-648-3804",
                website: "ambrose.net"
            )
        ]
        
        let mockData: Data
        do {
            mockData = try JSONEncoder().encode(totalUsers)
        } catch {
            XCTFail("Failed to encode mock users: \(error)")
            return
        }
        
        mockAPIClient.mockResult = .success(mockData)
        let expectation = self.expectation(description: "Fetch Users Success")
        
        userRepository.fetchUsers { result in
            switch result {
            case .success(let users):
                XCTAssertEqual(users, totalUsers)
            case .failure(let error):
                XCTFail("Expected success but got failure with error: \(error)")
            }
            expectation.fulfill()
        }
        waitForExpectations(timeout: 1.0, handler: nil)
    }
}
