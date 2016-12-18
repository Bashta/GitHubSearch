//
//  UserRouter.swift
//  GithubSearch
//
//  Created by Er on 12/16/16.
//  Copyright © 2016 NativeSolutions. All rights reserved.
//

import Alamofire

enum UsersRouter: URLRequestConvertible {
    static let baseURLString = "https://api.github.com/"
    static var OAuthToken: String?
    
    case GetUsersWithLangage(String)
    case GetUserWithLanguage(String,Int,Int)
    
    var method: Alamofire.HTTPMethod {
        switch self {
        case .GetUsersWithLangage:
            return .get
        case .GetUserWithLanguage(_,_,_):
            return .get
        }
    }
    
    var path: String {
        switch self {
        case .GetUsersWithLangage(_):
            return "search/users"
        case .GetUserWithLanguage(_,_,_):
            return "search/users"
        }
    }
    
    func asURLRequest() throws -> URLRequest {
        let url = URL(string: UsersRouter.baseURLString)!
        var urlRequest = URLRequest(url: url.appendingPathComponent(path))
        urlRequest.httpMethod = method.rawValue
        
        if let token = UsersRouter.OAuthToken {
            urlRequest.setValue("Bearer \(token)", forHTTPHeaderField: "Authorization")
        }
        
        switch self {
        case .GetUsersWithLangage(let language):
            let param = ["q" : language]
            return try Alamofire.URLEncoding.default.encode(urlRequest, with: param)
        case .GetUserWithLanguage(let language, let page, let perPage):
            let params: [String: Any] = ["q": language, "page": page, "per_page": perPage]
            return try Alamofire.URLEncoding.default.encode(urlRequest, with: params)
        }
    }
}
