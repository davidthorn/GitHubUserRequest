import XCTest

@testable import GitHubUserRequest

class GitHubUserRequestTests: XCTestCase {
    
    func testLoadingUser() {

        let request = GitHubUserRequest(name: "davidthorn")

        let user = request.load()

        XCTAssertNotNil(user , "the user object must not be nil")

    
    }

    func testRepos() {

        let request = GitHubUserRequest(name: "davidthorn")

        let repos = request.repos

        XCTAssertEqual(repos.count , 0 )

        XCTAssertNotNil(request.user)

    
    }


    static var allTests = [
        ("testLoadingUser", testLoadingUser),
        ("testRepos" , testRepos)
    ]
}
