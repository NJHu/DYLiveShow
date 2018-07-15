//
//  DYLiveShowCategoryController.swift
//  Pods
//
//  Created by HuXuPeng on 2018/7/7.
//

import UIKit
import NJKit
import MJRefresh

class DYLiveShowListNormalController: NJRefreshCollectionViewController {
    
    private var liveShowListViewModel = DYLiveShowListViewModel()
    public var idOrName = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let layout = UICollectionViewFlowLayout()
        collectionView.collectionViewLayout = layout
        layout.itemSize = CGSize(width: floor(UIScreen.main.bounds.width * 0.5 - 5.0), height: floor(UIScreen.main.bounds.width * 0.5 * 0.62))
        layout.minimumLineSpacing = 10
        layout.minimumInteritemSpacing = 5
        layout.scrollDirection = .vertical
        
        collectionView.register(UINib(nibName: "DYLiveShowCommonCell", bundle: Bundle(for: DYLiveShowCommonCell.self)), forCellWithReuseIdentifier: "DYLiveShowCommonCell")
    }
    override func loadData(isMore: Bool) {
        liveShowListViewModel.loadCommonLiveShows(idOrName, isMore: isMore) {[weak self] (response: NJResponse, hasMore: Bool) in
            self?.endHeaderFooterRefreshing()
            
            if response.error != nil {
                print(response.errorMsg)
                return
            }
            
            self?.collectionView.reloadData()
            self?.collectionView.mj_footer.state = hasMore ? MJRefreshState.idle : MJRefreshState.noMoreData
        }
    }
}

extension DYLiveShowListNormalController {
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return liveShowListViewModel.liveShowList.count
    }
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "DYLiveShowCommonCell", for: indexPath) as! DYLiveShowCommonCell
        
        cell.liveShow = liveShowListViewModel.liveShowList[indexPath.item]
        
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        collectionView.deselectItem(at: indexPath, animated: true)
        let webVc = NJWebViewController()
        webVc.gotoUrl = liveShowListViewModel.liveShowList[indexPath.item].url
        navigationController?.pushViewController(webVc, animated: true)
    }
}
