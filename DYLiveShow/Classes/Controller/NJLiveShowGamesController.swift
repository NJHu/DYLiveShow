//
//  NJLiveShowCategorysViewController.swift
//  DYLiveShow
//
//  Created by HuXuPeng on 2018/7/8.
//

import UIKit
import NJKit
import SwiftyJSON
import MJRefresh

class NJLiveShowGamesController: NJRefreshCollectionViewController {
    
    private var categoryList: [DYLiveShowCategory] = [DYLiveShowCategory]()
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        title = "游戏"
    }
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let layout = UICollectionViewFlowLayout()
        collectionView.collectionViewLayout = layout
        let lineCount = 4
        let colMargin = 0
        let itemWidth = UIScreen.main.bounds.width
        layout.itemSize = CGSize(width: floor(UIScreen.main.bounds.width * 0.25), height: floor(UIScreen.main.bounds.width * 0.25 * 1.2))
        layout.minimumLineSpacing = 3
        layout.minimumInteritemSpacing = 0
        layout.scrollDirection = .vertical
        
        collectionView.register(DYLiveShowCategoryCell.self, forCellWithReuseIdentifier: "DYLiveShowCategoryCell")
    }
    override func loadData(isMore: Bool) {
        let url = "http://open.douyucdn.cn/api/RoomApi/game"
        NJNetworkTool.sharedTool.GET(url, parameters: nil) {[weak self] (response: NJResponse) in
            self?.endHeaderFooterRefreshing()
            self?.collectionView.mj_footer.state = MJRefreshState.noMoreData
            
            if response.error != nil {
                print(response.errorMsg)
                return
            }
            
            let jsonData = JSON.init(response.responseObject)
            
            guard jsonData["error"].intValue == 0 else {
                response.statusCode = jsonData["error"].intValue
                response.errorMsg = "错误码" + jsonData["error"].stringValue
                response.error = NJNetworkToolError.serverWrong
                print(jsonData["error"])
                return
            }
            
            var tempList = [DYLiveShowCategory]()
            for (index, jsonValue) in jsonData["data"].arrayValue.enumerated() {
                tempList.append(DYLiveShowCategory(jsonData: jsonValue))
            }
            
            self?.categoryList = tempList
            
            self?.collectionView.reloadData()
        }
    }
}

extension NJLiveShowGamesController {
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return categoryList.count
    }
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "DYLiveShowCategoryCell", for: indexPath) as! DYLiveShowCategoryCell
        cell.liveShowCategory = categoryList[indexPath.item]
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        collectionView.deselectItem(at: indexPath, animated: true)
        
        let liveShowCategory = categoryList[indexPath.item];
        let listVc = DYLiveShowListNormalController()
        listVc.title = liveShowCategory.game_name
        listVc.idOrName = liveShowCategory.short_name
        navigationController?.pushViewController(listVc, animated: true)
    }
}
