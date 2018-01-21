import Foundation
import Dispatch
import DataRequest
import GitHubUser

extension GitHubUserRequest {

    fileprivate func apiUrl(for name: String) -> String {
        return "https://api.github.com/users/\(name)"
    }

    internal var workItem: DispatchWorkItem {

        let urlString = self.apiUrl(for: self.name) 

        return DispatchWorkItem {
            
            let task = DataRequest.from(url: urlString) { result in

                do {

                    switch result {
                        case .success(let data):

                            let jsonDecoder = JSONDecoder()
                            self.user = try jsonDecoder.decode(GitHubUser.self, from: data)

                        case .fail(let _error):

                            throw _error
                    }

           
                } catch let _error {
                    self.error = _error
                }

                self.group.leave()

            }

            guard let runnable = task else {
                self.group.leave()
                fatalError("task cannot start")
            }

            runnable.resume()
        }

    }


}