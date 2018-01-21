import GitHubUser
import Dispatch

public class GitHubUserRequest {

    internal var name: String

    public var user: GitHubUser?    

    internal var error: Error?

    internal var _dispatchGroup: DispatchGroup?

    internal var _dispatchQueue: DispatchQueue?

    public init(name: String) {
        self.name = name
    }

}