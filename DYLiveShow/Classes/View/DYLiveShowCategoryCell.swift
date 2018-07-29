//
//  DYLiveShowCategoryCell.swift
//  DYLiveShow
//
//  Created by HuXuPeng on 2018/7/8.
//

import UIKit
import SnapKit
import AlamofireImage

class DYLiveShowCategoryCell: UICollectionViewCell {
    private let containterView = UIView()
    private let categoryImageView = UIImageView()
    private let categoryNameLabel = UILabel()
    public var liveShowCategory: DYLiveShowCategory? {
        willSet {
            categoryImageView.image = UIImage.nj_image(name: "live_cell_default_phone", bundleClass: DYLiveShowCategoryCell.self)
            if let imageUrlStr = newValue?.game_icon as? String, let imageUrl = URL(string: imageUrlStr) {
                categoryImageView.af_setImage(withURL: imageUrl)
            }
            categoryNameLabel.text = newValue?.game_name
        }
    }
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupUI()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
    }
}

extension DYLiveShowCategoryCell {
    private func setupUI() {
        contentView.addSubview(containterView)
        containterView.addSubview(categoryImageView)
        containterView.addSubview(categoryNameLabel)
        containterView.backgroundColor = UIColor.white
        categoryImageView.clipsToBounds = true
        categoryImageView.contentMode = .scaleAspectFill
        categoryNameLabel.font = UIFont.systemFont(ofSize: 12)
        categoryNameLabel.textColor = UIColor.lightGray
        categoryNameLabel.textAlignment = .center
        
        containterView.snp.makeConstraints { (make) in
            make.edges.equalToSuperview().inset(1.0 / UIScreen.main.scale)
        }
        categoryImageView.snp.makeConstraints { (make) in
            make.top.equalTo(containterView.snp.top).offset(3)
            make.left.equalTo(containterView.snp.left).offset(10)
            make.right.equalTo(containterView.snp.right).offset(-10)
            make.height.equalTo(categoryImageView.snp.width)
        }
        categoryNameLabel.snp.makeConstraints { (make) in
            make.left.equalToSuperview()
            make.right.equalToSuperview()
            make.bottom.equalToSuperview()
            make.top.equalTo(categoryImageView.snp.bottom)
        }
    }
}
