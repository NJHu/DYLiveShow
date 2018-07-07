//
//  DYTrendsViewController.swift
//  Alamofire
//
//  Created by HuXuPeng on 2018/6/16.
//

import UIKit
import NJKit
import NJDYSearchBarView
import SnapKit

class DYLiveShowViewController: NJTitlesListsController {
    let headerView = UIView()
    private let searchBarView = NJDYSearchBarView.searchBarView()
    override open var contentViewY: Double {
        return Double(44 + UIApplication.shared.statusBarFrame.height + 30)
    }
    override open var contentViewSize: CGSize {
        return CGSize(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height - CGFloat(contentViewY) - tabBarController!.tabBar.bounds.height)
    }
    override open var titleBtnNormalColor: UIColor {
        return UIColor.white
    }
    override open var titleBtnSelectedColor: UIColor {
        return UIColor.red
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // navBar
        self.navigationItem.title = "直播"
        nj_isBackActionBtnHidden = true
        nj_navigationBar.isHidden = true
        
        setupHeaderView()
        titleScrollView.frame.origin = CGPoint(x: 0, y: 44 + UIApplication.shared.statusBarFrame.height)
        titleScrollView.backgroundColor = UIColor.orange
    }
    open override func nj_addChildControllers() {
        let 分类 = DYLiveCommonCategoryController()
        分类.title = "分类"
        addChildViewController(分类)
        let 全部 = DYLiveCommonCategoryController()
        全部.title = "全部"
        addChildViewController(全部)
        let 推荐 = DYLiveCommonCategoryController()
        推荐.title = "推荐"
        addChildViewController(推荐)
        let 刺激战场 = DYLiveCommonCategoryController()
        刺激战场.title = "刺激战场"
        addChildViewController(刺激战场)
        let 绝地求生 = DYLiveCommonCategoryController()
        绝地求生.title = "绝地求生"
        addChildViewController(绝地求生)
        let 测试 = DYLiveCommonCategoryController()
        测试.title = "测试"
        addChildViewController(测试)
        let dota2 = DYLiveCommonCategoryController()
        dota2.title = "dota2"
        addChildViewController(dota2)
        let 星秀 = DYLiveCommonCategoryController()
        星秀.title = "星秀"
        addChildViewController(星秀)
        let 音频直播 = DYLiveCommonCategoryController()
        音频直播.title = "音频直播"
        addChildViewController(音频直播)
        let 颜值 = DYLiveCommonCategoryController()
        颜值.title = "颜值"
        addChildViewController(颜值)
        let 热门游戏 = DYLiveCommonCategoryController()
        热门游戏.title = "热门游戏"
        addChildViewController(热门游戏)
    }
}

// MARK:- headerUI
extension DYLiveShowViewController {
    func setupHeaderView() -> Void {
        view.addSubview(headerView)
        headerView.snp.makeConstraints { (make) in
            make.top.left.right.equalToSuperview()
            make.height.equalTo(44 + UIApplication.shared.statusBarFrame.height)
        }
        headerView.backgroundColor = UIColor.orange
        headerView.addSubview(searchBarView)
        
        searchBarView.snp.makeConstraints { (maker) in
            maker.left.right.equalToSuperview()
            maker.height.equalTo(44)
            maker.top.equalToSuperview().offset(UIApplication.shared.statusBarFrame.height)
        }
    }
}
