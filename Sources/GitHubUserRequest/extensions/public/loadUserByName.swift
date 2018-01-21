import DataRequest
import GitHubUser

extension  GitHubUserRequest {
    
    /**
    *   Loads a GitHubUser using the name provided
    *
    *
    */
    public func load() -> GitHubUser? {

       guard self.user == nil else {
           return self.user
       }

        // keep a private copy of the group
        self.group.enter()

        self.queue.async(execute: self.workItem)
       
        self.group.wait()

        guard self.error == nil , let gitUser = self.user else {
            print(self.error!)
            return nil
        }

        return gitUser
    }

  
}

