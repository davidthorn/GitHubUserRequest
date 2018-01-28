import XCTest
import CodableExtensions
import GitHubUser
import Dispatch

@testable import GitHubUserRequest

class GitHubUserRequestTests: XCTestCase {
    
    /// Tests loading a GithubUser user synchronously
    func testLoadingUser() {

        let request = GitHubUserRequest(name: "davidthorn")
        let user = request.load()
        XCTAssertNotNil(user , "the user object must not be nil")
    
    }

    /// Tests loading the user asynchronously
    func testLoadingGitHubUserAsync() {

        let group = DispatchGroup()

        group.enter()

        let request = GitHubUserRequest(name: "davidthorn")

        request.async { user in

            XCTAssertNotNil(user)
            group.leave()
        }

        group.wait()

    }

    static var allTests = [
        ("testLoadingUser", testLoadingUser),
        (
            "Test loading the user async",
            testLoadingGitHubUserAsync
        )
    ]
}
