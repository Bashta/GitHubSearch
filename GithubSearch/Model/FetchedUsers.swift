//
//  GitHubUser.swift
//  GithubSearch
//
//  Created by Er on 12/16/16.
//  Copyright © 2016 NativeSolutions. All rights reserved.
//

import ObjectMapper

final class FetchedUsers: Mappable {
    
    var users: [GitHubUser]?
    var totalCount: Int?
    var incompleteResults: Bool?
    
    required init?(map: Map){
        
    }
    
    func mapping(map: Map) {
        users <- map["items"]
        totalCount <- map["total_count"]
        incompleteResults <- map["incomplete_results"]
    }
}
