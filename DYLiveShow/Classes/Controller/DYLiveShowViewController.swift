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
    override var firstShowIndex: Int {
        return 1
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
    override func nj_addChildControllers() {
        
        let categorys = [ ["全部": ""], ["颜值": "yz"], ["刺激战场": "jdqscjzc"], ["DOTA2": "DOTA2"], ["军事": "js"], ["DOTA": "DOTA"],
                         ["绝地求生": "jdqs"], ["王者荣耀": "wzry"], ["英雄联盟": "LOL"], ["二次元": "ecy"], ["DNF": "DNF"],
                         ["穿越火线": "CF"], ["星娱": "xingyu"], ["棋牌娱乐": "qipai"], ["户外": "HW"], ["鱼教": "yj"], ["美食": "ms"], ["企鹅直播": "qezb"], ["数码科技": "smkj"], ["脱口秀": "tkx"], ["颜值横屏": "XX"]]
        
        addChildViewController(NJLiveShowCategorysController())
        
        for dict in categorys {
            let vc = DYLiveShowListNormalController()
            vc.title = dict.first!.key
            vc.idOrName = dict.first!.value
            addChildViewController(vc)
        }
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

