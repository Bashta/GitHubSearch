//
//  DataManager.swift
//  GithubSearch
//
//  Created by Er on 12/19/16.
//  Copyright © 2016 NativeSolutions. All rights reserved.
//

import Foundation

final class DataManager {
    static let sharedInstance = DataManager()
    fileprivate var defaults = UserDefaults(suiteName: GlobalConstants.AppGroups.defaultAppGroupName)
    
}

extension DataManager {
    //MARK: - Save methods
    func updateUserOfTheDayWith(name: String, pictureUrl: String) {
        defaults?.set(name, forKey: GlobalConstants.Defaults.nameKey)
        defaults?.set(pictureUrl, forKey: GlobalConstants.Defaults.urlKey)
        defaults?.set(Date(), forKey: GlobalConstants.Defaults.lastUpdated)
        defaults?.synchronize()
    }
    
    //MARK: -Fetch Methods
    func getTodaysUser() -> (name: String?, url: String?) {
        return (defaults?.value(forKey: GlobalConstants.Defaults.nameKey) as! String?, defaults?.value(forKey: GlobalConstants.Defaults.urlKey) as! String?)
    }
}
