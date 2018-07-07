//
//  DYLiveShowCategoryController.swift
//  Pods
//
//  Created by HuXuPeng on 2018/7/7.
//

import UIKit
import NJKit

class DYLiveCommonCategoryController: NJRefreshCollectionViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.register(UINib(nibName: "DYLiveShowCommonCell", bundle: Bundle(for: DYLiveShowCommonCell.self)), forCellWithReuseIdentifier: "DYLiveShowCommonCell")
        let layout = UICollectionViewFlowLayout()
        collectionView.collectionViewLayout = layout
        layout.itemSize = CGSize(width: floor(UIScreen.main.bounds.width * 0.5 - 5.0), height: floor(UIScreen.main.bounds.width * 0.5 * 0.62))
        layout.minimumLineSpacing = 10
        layout.minimumInteritemSpacing = 5
        layout.scrollDirection = .vertical
    }
}

extension DYLiveCommonCategoryController {
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "DYLiveShowCommonCell", for: indexPath)
        
        return cell
    }
}
