//
//  DYTrendsViewController.swift
//  Alamofire
//
//  Created by HuXuPeng on 2018/6/16.
//

import UIKit
import NJKit

class DYLiveShowViewController: NJViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "直播"
        nj_isBackActionBtnHidden = true
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.navigationController?.pushViewController(NJViewController(), animated: true)
    }
}
