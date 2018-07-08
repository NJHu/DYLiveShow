//
//  DYLiveShowCategory.swift
//  DYLiveShow
//
//  Created by HuXuPeng on 2018/7/8.
//

import UIKit
import SwiftyJSON

struct DYLiveShowCategory {
    var cate_id: String
    var game_name: String
    var short_name: String
    var game_url: String
    var game_src: String
    var game_icon: String
    
    init(jsonData: JSON) {
        cate_id = jsonData["jsonData"].stringValue
        game_name = jsonData["game_name"].stringValue
        short_name = jsonData["short_name"].stringValue
        game_url = jsonData["game_url"].stringValue
        game_src = jsonData["game_src"].stringValue
        game_icon = jsonData["game_icon"].stringValue
    }
}
