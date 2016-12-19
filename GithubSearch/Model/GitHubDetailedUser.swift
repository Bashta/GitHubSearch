//
//  GitHubDetailedUser.swift
//  GithubSearch
//
//  Created by Er on 12/19/16.
//  Copyright © 2016 NativeSolutions. All rights reserved.
//

import ObjectMapper

final class GitHubDetailedUser: Mappable {

    var id: Int?
    var login: String?
    var avatarUrl: String?
    var gravatar_id: Int?
    var createdAt: Date?
    var emailAdress: String?
    var followers: Int?

    required init?(map: Map){
        
    }

    func mapping(map: Map) {
        id <- map["id"]
        login <- map["login"]
        avatarUrl <- map["avatar_url"]
        createdAt <- map["created_at"]
        emailAdress <- map["email"]
        followers <- map["followers"]
    }
}
