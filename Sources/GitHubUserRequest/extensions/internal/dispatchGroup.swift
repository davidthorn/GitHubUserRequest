import Foundation
import Dispatch


extension GitHubUserRequest {

    internal var group: DispatchGroup {

       if self._dispatchGroup == nil {
            self._dispatchGroup = DispatchGroup()
        }

        return self._dispatchGroup!

    }

}