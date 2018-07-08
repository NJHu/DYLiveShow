//
//  DYLiveShow.swift
//  Pods
//
//  Created by HuXuPeng on 2018/7/7.
//

import UIKit
import SwiftyJSON

struct DYLiveShow {
    var room_id: String
    var room_src: String
    var room_name: String
    var owner_uid: String
    var hn: String
    var nickname: String
    var url: String
    init(jsonData: JSON) {
        room_id = jsonData["room_id"].stringValue
        room_src = jsonData["room_src"].stringValue
        room_name = jsonData["room_name"].stringValue
        owner_uid = jsonData["owner_uid"].stringValue
        hn = jsonData["hn"].stringValue
        nickname = jsonData["nickname"].stringValue
        url = jsonData["url"].stringValue
    }
}
