//
//  UsersFooterView.swift
//  GithubSearch
//
//  Created by Er on 12/18/16.
//  Copyright © 2016 NativeSolutions. All rights reserved.
//

import UIKit

final class UsersFooterView: UIView {
    
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupView()
        self.activityIndicator?.startAnimating()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
}

private extension UsersFooterView {
    //MARK: - View Setup
    func setupView() {
        fromNib()
    }
}
