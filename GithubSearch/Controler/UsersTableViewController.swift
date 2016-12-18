//
//  ViewController.swift
//  GithubSearch
//
//  Created by Er on 12/16/16.
//  Copyright © 2016 NativeSolutions. All rights reserved.
//

import UIKit

final class UsersTableViewController: UITableViewController {
    
    fileprivate var dataSource: [GitHubUser] = []
    fileprivate var currentPage: Int = 1
    fileprivate var isFetchingUsers = false
    
    fileprivate var footerView: UIView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupController()
        setupUI()

        fetchUsersWith(language: GlobalConstants.UserControllerDefaults.defaultLanguage,
                       page: currentPage,
                       perPage: GlobalConstants.UserControllerDefaults.userBulckFetch)
        
    }
}

extension UsersTableViewController {
    //MARK: - UITableViewDelegate
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: false)
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: UserTableViewCell.rueseIdentifier) else {
            return 100
        }
        
        return cell.bounds.size.height
    }
    
    override func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        if indexPath.row + 1 == dataSource.count && isFetchingUsers == false {
            fetchUsersWith(language: GlobalConstants.UserControllerDefaults.defaultLanguage,
                           page: currentPage,
                           perPage: GlobalConstants.UserControllerDefaults.userBulckFetch)
        }
    }
}

extension UsersTableViewController {
    //MARK: - UITableViewDataSource
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSource.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: UserTableViewCell.rueseIdentifier, for: indexPath) as? UserTableViewCell else {
            return UITableViewCell()
        }
        
        cell.user = dataSource[indexPath.row]
        return cell
    }
}

private extension UsersTableViewController {
    //MARK: - Controller Setup
    func setupController() {
        tableView.register(UserTableViewCell.nib, forCellReuseIdentifier: UserTableViewCell.rueseIdentifier)
    }
    
    func setupUI() {
        footerView = UsersFooterView(frame: CGRect(origin: CGPoint.zero, size: CGSize(width: self.view.bounds.width, height: 40)))
        tableView.tableFooterView = footerView
    }

    //MARK: - API Comunications
    func fetchUsersWith(language: String, page: Int, perPage: Int) {
        shouldHideLoader(false)
        
        isFetchingUsers = true
        UserApi.sharedInstance.getUsersWith(language: language, page: page, perPage: perPage) { [weak self] users in
            if !users.isEmpty {
                self?.addUsers(users)
            }
            self?.shouldHideLoader(true)
            self?.isFetchingUsers = false
        }
    }
    
    //MARK: - Helpers
    func addUsers(_ users: [GitHubUser]) {
        dataSource.append(contentsOf: users)
        currentPage += 1
        reloadTableView(self.tableView)
    }
    
    func shouldHideLoader(_ bool: Bool) {
        tableView.tableFooterView?.isHidden = bool
    }

    func reloadTableView(_ tableView: UITableView) {
        let contentOffset = tableView.contentOffset
        tableView.reloadData()
        tableView.layoutIfNeeded()
        tableView.setContentOffset(contentOffset, animated: false)
    }
}
