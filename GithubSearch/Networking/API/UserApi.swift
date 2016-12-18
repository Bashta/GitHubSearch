//
//  UserApi.swift
//  GithubSearch
//
//  Created by Er on 12/16/16.
//  Copyright © 2016 NativeSolutions. All rights reserved.
//

import Alamofire
import AlamofireObjectMapper

final class UserApi {
    
    /// Singleton instance
    static let sharedInstance = UserApi()
    
}

extension UserApi {
    //MARK: - Fetch Users API
    
    func getUsersWith(language: String, completion:@escaping (_ users: [GitHubUser]) -> Void) {
        Alamofire.request(UsersRouter.GetUsersWithLangage(language)).responseObject { (response: DataResponse<FetchedUsers>) in
            completion(response.result.value?.users ?? [])
        }
    }
    
    func getUsersWith(language: String, page: Int, perPage: Int, completion:@escaping (_ users: [GitHubUser]) -> Void) {
        Alamofire.request(UsersRouter.GetUserWithLanguage(language, page, perPage)).responseObject { (response: DataResponse<FetchedUsers>) in
            completion(response.result.value?.users ?? [])
        }
    }
}
