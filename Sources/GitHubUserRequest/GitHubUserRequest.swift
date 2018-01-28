import Foundation
import GitHubUser
import DataRequest
import CodableExtensions

public class GitHubUserRequest {

    /// The name of the github's users account
    internal var name: String

    /// Default constructor
    ///
    /// - Parameters:
    ///     - name: String the name of the users github account
    public init(name: String) {
        self.name = name
    }

    /// The API URL String from Githubs api which needs to be called for this requesz
    internal var apiUrl: String {
        return "api.github.com/users/\(name)".asSecureURLString
    }

    /// Loads the GitHubUser synchronously
    /// 
    /// - Returns:
    ///     - GitHubUser if the request was completed successfully
    ///     - nil when not successful
    public func load() -> GitHubUser? {
        guard let data = self.apiUrl.syncURLRequest.value else { return nil }
        return GitHubUser.decode(withJsonData: data) as? GitHubUser
    }

    /// Loads the GitHubUser asynchronously using a completion handler
    ///
    /// - Parameters:
    ///     - completion: @escaping (GitHubUser?) -> Void
    public func async( _ completion: @escaping (GitHubUser?) -> Void ) {
        self.apiUrl.urlAsyncRequest { result in
            guard let data = result.value else {
                return completion(nil)
            }

            let user = GitHubUser.decode(withJsonData: data) as? GitHubUser
            completion(user)
        }
    }

}