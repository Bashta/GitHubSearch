//
//  UIViewExtension.swift
//  GithubSearch
//
//  Created by Er on 12/18/16.
//  Copyright © 2016 NativeSolutions. All rights reserved.
//

import UIKit
import PureLayout

extension UIView {
    
    @discardableResult
    func fromNib<T : UIView>() -> T? {
        guard let view = Bundle.main.loadNibNamed(String(describing: type(of: self)), owner: self, options: nil)?[0] as? T else {
            // xib not loaded, or it's top view is of the wrong type
            return nil
        }
        self.addSubview(view)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.autoPinEdgesToSuperviewEdges()
        return view
    }
}
