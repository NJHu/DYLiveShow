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
    
    private let searchBarView = NJDYSearchBarView.searchBarView()
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "直播"
        nj_isBackActionBtnHidden = true
        nj_navigationBar.isHidden = true
        view.addSubview(searchBarView)
        searchBarView.makeco
    }
}
