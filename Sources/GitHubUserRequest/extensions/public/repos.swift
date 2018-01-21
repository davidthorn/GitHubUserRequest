import DataRequest
import GitHubUser

extension  GitHubUserRequest {

    public var repos: [JSON] {
        
        let _repos: [JSON] = []

        if self.user == nil {
            self.user = self.load()
        }

        guard let user = self.user else {
            return _repos
        }

        do {

            let data = try DataRequest.sync(url:user.urls.repos) 

            print("we have data")

            let repoString = String(data: data , encoding: .utf8)!
            print(repoString)

            return _repos

        } catch {
            return _repos
        }

       // guard let data = DataRequest.loadSync(url: self.reposUrl) else { return _repos }

        //guard let jsonArray = data as? [JSON] else { return _repos }

        //return jsonArray

    }

}

