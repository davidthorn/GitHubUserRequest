import Foundation
import Dispatch


extension GitHubUserRequest {

    fileprivate var queueLabel: String {

        return "davidthorn.githubuserrequest.load.queue"

    }

    fileprivate var attributes: DispatchQueue.Attributes {
        return .concurrent
    }

    /// The dispatch queue to use to carry out any concurrent tasks
    ///
    /// - Parameter label: the name of the queueu
    /// - Paramter attributes: the attributes
    internal var queue: DispatchQueue {
    
        guard let _queue = self._dispatchQueue else {
            self._dispatchQueue = DispatchQueue(label: self.queueLabel , attributes: self.attributes )
            return self._dispatchQueue!
        }

        return _queue
    
    }

}