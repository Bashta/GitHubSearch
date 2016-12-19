//
//  UserDetailsViewController.swift
//  GithubSearch
//
//  Created by Er on 12/19/16.
//  Copyright © 2016 NativeSolutions. All rights reserved.
//

import UIKit
import SVProgressHUD
import MessageUI

final class UserDetailsViewController: UIViewController {
    static let storyboardId = "UserDetailsViewController"
    
    //MARK: - Propertires
    @IBOutlet fileprivate weak var userImageView: UIImageView?
    @IBOutlet fileprivate weak var userEmailButton: UIButton?
    @IBOutlet fileprivate weak var userFollowersLabel: UILabel?
    
    fileprivate var user: GitHubDetailedUser?
    
    var username: String?

    //MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
    }
    
    //MARK: - Action Buttons
    @IBAction func sendEmailButtoTapped(_ sender: UIButton) {
        sendEmail()
    }
}

extension UserDetailsViewController: MFMailComposeViewControllerDelegate {
    //MARK: - Email Handling
    func sendEmail() {
        if MFMailComposeViewController.canSendMail() {
            let mail = MFMailComposeViewController()
            mail.mailComposeDelegate = self
            mail.setToRecipients([user?.emailAdress ?? ""])
            mail.setMessageBody("<p>Got any cat gifs?</p>", isHTML: true)
            
            present(mail, animated: true)
        } else {
            self.presentAlertWithTitle(title: "Ooops", message: "Mail app can not launch at the given moment")
        }
    }
    
    func mailComposeController(_ controller: MFMailComposeViewController, didFinishWith result: MFMailComposeResult, error: Error?) {
        controller.dismiss(animated: true)
    }
}

private extension UserDetailsViewController {
    //MARK: - UI Setup
    func setupUI() {
        self.title = "User Details"
        fetchUserDetails()
    }
    
    //MARK: - API Comunication
    func fetchUserDetails() {
        guard let username = username else {
            return
        }
        SVProgressHUD.show()
        UserApi.sharedInstance.fetchUserWith(username: username) { [weak self] user in
            SVProgressHUD.dismiss()
            guard let user = user else {
                return
            }
            
            self?.user = user
            self?.setUserInformationWith(user)

            if let url = user.avatarUrl {
                self?.setPicturWith(urlString: url)
            }
        }
    }

    //MARK: - Helers
    func setPicturWith(urlString: String) {
        UIImage.fetchImageWith(urlString: urlString) { [weak self] image in
            self?.userImageView?.image = image
        }
    }
    
    func setUserInformationWith(_ user: GitHubDetailedUser) {
        userEmailButton?.setTitle(user.emailAdress ?? "Absent Email", for: UIControlState.normal)
        userFollowersLabel?.text =  user.followers == nil ? "Followers not available ATM" : String(describing: "\(user.followers!) Followers")
    }
}
