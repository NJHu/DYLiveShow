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

class DYLiveShowViewController: NJViewController {
    let headerView = UIView()
    private let searchBarView = NJDYSearchBarView.searchBarView()
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "直播"
        nj_isBackActionBtnHidden = true
        nj_navigationBar.isHidden = true
        view.addSubview(headerView)
        headerView.snp.makeConstraints { (make) in
            make.top.left.right.equalToSuperview()
            make.height.equalTo(88 + UIApplication.shared.statusBarFrame.height)
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
