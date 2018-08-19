//
//  DYCommonLiveShowViewModel.swift
//  Pods
//
//  Created by HuXuPeng on 2018/7/7.
//

import UIKit
import NJKit
import SwiftyJSON

let baseUrl = "http://open.douyucdn.cn/api/RoomApi/live"

class DYLiveShowListViewModel: NSObject {
    var liveShowList: [DYLiveShow] = [DYLiveShow]()
}

extension DYLiveShowListViewModel {
    func loadCommonLiveShows(_ IDOrName: String?, isMore: Bool = false, completion: @escaping (_ response: NJResponse, _ hasMore: Bool) -> ()) -> Void {
        
        var urlStr = baseUrl
        if let idOrName = IDOrName {
            if idOrName.lengthOfBytes(using: String.Encoding.utf8) > 0 {
                urlStr += "/" + idOrName
            }
        }
        
        let offsetTemp = isMore ? (liveShowList.count) : 0
        
        NJNetworkTool.sharedTool.GET(urlStr, parameters:["offset": offsetTemp, "limit": 16]) {[weak self] (response: NJResponse) in
            
            guard response.error == nil && response.responseObject != nil else {
                completion(response, true)
                return
            }
            
            let jsonData = JSON.init(response.responseObject)
            
            guard jsonData["error"].intValue == 0 else {
                response.statusCode = jsonData["error"].intValue
                response.errorMsg = "错误码" + jsonData["error"].stringValue
                response.error = NJNetworkToolError.serverWrong
                completion(response, true)
                return
            }
            
            if !isMore {
                self?.liveShowList.removeAll()
            }
            
            for (index, jsonValue) in jsonData["data"].arrayValue.enumerated() {
                self?.liveShowList.append(DYLiveShow(jsonData: jsonValue))
            }
            completion(response, true)
        }
    }
}
