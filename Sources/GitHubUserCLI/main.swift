import GitHubUser
import GitHubUserRequest
import Foundation
import DataRequest

var arguments = CommandLine.arguments

// appName github-user-cli
let _ = arguments.removeFirst()

let accessToken = arguments.filter { argument in
    return argument.contains("--access_token")
}

arguments = arguments.filter{ argument in
    return !argument.contains("--access_token")
}

if accessToken.count == 1 {
    DataRequest.accessToken = accessToken[0].components(separatedBy: "=")[1]
}


guard arguments.count >= 1 else {
    print("incorrect parameters length")
    exit(2)
}

let name = arguments.removeFirst() 

let request = GitHubUserRequest(name: name)

guard let user = request.load() else {
    print("could not load user")
    exit(2)
}

guard arguments.count > 0  else { exit(3) }

let cmd = arguments.removeFirst()

switch cmd {
    
     case "urls":

        let encoder = JSONEncoder()
        encoder.outputFormatting = .prettyPrinted

        let data = try encoder.encode(user.urls)
        print(String(data: data, encoding: .utf8)!)
     
     case "json":

        let encoder = JSONEncoder()
        encoder.outputFormatting = .prettyPrinted

        let data = try encoder.encode(user)
        print(String(data: data, encoding: .utf8)!)
   
    case "id":

        print("User  Id  of: \(user.id)")
    
    case "repos":
        let repos = request.repos

        repos.forEach { repo in

            guard let name = repo["name"] as? String else { return }
            print("repo name: \(name)")

        }

    case "reposUrl":
        
        print("Repos Url: \(user.urls.repos)")

    case "publicRepos":
        
        print("Public Repos Count: \(user.publicRepos)")

    default: break

}



