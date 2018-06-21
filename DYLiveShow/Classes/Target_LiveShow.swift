//
//  DYTarget_Trends.swift
//  DYTrends
//
//  Created by HuXuPeng on 2018/6/7.
//

import UIKit
import NJKit

@objc class Target_LiveShow: NSObject {

    @objc func Action_mainViewController(params: [String: AnyObject]) -> UIViewController? {
        
        let childController = DYLiveShowViewController()
        let nav = NJNavigationController(rootViewController: childController)
        
        childController.tabBarItem.image = UIImage.nj_image(name: "btn_home_normal", bundleClass: Target_LiveShow.self)
        childController.tabBarItem.selectedImage = UIImage.nj_image(name: "btn_home_selected", bundleClass: Target_LiveShow.self)
        childController.tabBarItem.title = "直播"
        childController.tabBarItem.titlePositionAdjustment = UIOffset(horizontal: 0, vertical: -3);
        
        return nav
    }
}
