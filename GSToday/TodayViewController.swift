//
//  TodayViewController.swift
//  GSToday
//
//  Created by Er on 12/19/16.
//  Copyright © 2016 NativeSolutions. All rights reserved.
//

import UIKit
import NotificationCenter
import Alamofire

final class TodayViewController: UIViewController, NCWidgetProviding {
        
    @IBOutlet fileprivate weak var userNameLabel: UILabel?
    @IBOutlet fileprivate weak var userImageView: UIImageView?

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }

    func widgetPerformUpdate(completionHandler: (@escaping (NCUpdateResult) -> Void)) {
        completionHandler(NCUpdateResult.newData)
    }
}

private extension TodayViewController {
    //MARK: - UI Setup
    func setupUI() {
        userNameLabel?.text = DataManager.sharedInstance.getTodaysUser().name
        if let url = DataManager.sharedInstance.getTodaysUser().url {
            UIImage.fetchImageWith(urlString: url, completion: { [weak self] image in
                self?.userImageView?.image = image?.af_imageRoundedIntoCircle()
            })
        }
    }
}
