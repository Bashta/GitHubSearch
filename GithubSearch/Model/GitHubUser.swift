//
//  GitHubUser.swift
//  GithubSearch
//
//  Created by Er on 12/17/16.
//  Copyright © 2016 NativeSolutions. All rights reserved.
//

import ObjectMapper

final class GitHubUser: Mappable {
    
    var id: Int?
    var login: String?
    var avatarUrl: String?
    var gravatar_id: Int?
    
    required init?(map: Map){
        
    }
    
    func mapping(map: Map) {
        id <- map["id"]
        login <- map["login"]
        avatarUrl <- map["avatar_url"]
    }
}
