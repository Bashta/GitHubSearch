//
//  UIImageExtension.swift
//  GithubSearch
//
//  Created by Er on 12/17/16.
//  Copyright © 2016 NativeSolutions. All rights reserved.
//

import Alamofire

extension UIImage {
    static func fetchImageWith(urlString: String, completion: @escaping (_ image: UIImage?) -> Void) {
        Alamofire.request(urlString).responseImage { response in
            guard let image = response.result.value else {
                return completion(nil)
            }
            completion(image.af_imageRoundedIntoCircle())
        }
    }
}
