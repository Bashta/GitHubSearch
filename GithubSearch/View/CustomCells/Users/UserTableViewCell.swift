//
//  UserTableViewCell.swift
//  GithubSearch
//
//  Created by Er on 12/16/16.
//  Copyright © 2016 NativeSolutions. All rights reserved.
//

import AlamofireImage

final class UserTableViewCell: UITableViewCell {
    static let rueseIdentifier = "UserTableViewCell"
    static let nib = UINib(nibName: "UserTableViewCell", bundle: nil)
    
    @IBOutlet fileprivate weak var userImageView: UIImageView?
    @IBOutlet fileprivate weak var userNameLabel: UILabel?
    
    var user: GitHubUser? {
        didSet {
            setupCell()
        }
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        
        userImageView?.image = nil
        userNameLabel?.text = nil
    }
}

private extension UserTableViewCell {
    //MARK: - Cell Setup
    func setupCell() {
        UIImage.fetchImageWith(urlString: user!.avatarUrl!) { [weak self] image in
            self?.userImageView?.image = image
        }
        userNameLabel?.text = user?.login
    }
}
