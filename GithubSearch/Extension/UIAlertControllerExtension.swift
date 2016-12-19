//
//  UIAlertControllerExtension.swift
//  GithubSearch
//
//  Created by Er on 12/19/16.
//  Copyright © 2016 NativeSolutions. All rights reserved.
//

import UIKit

extension UIViewController {
    
    func presentAlertWithTitle(title: String, message: String) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "Ok", style: .default, handler: nil)
        alertController.addAction(okAction)
        self.present(alertController, animated: true, completion: nil)
    }
}
