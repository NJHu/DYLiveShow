//
//  DYLiveShowCommonCell.swift
//  Pods
//
//  Created by HuXuPeng on 2018/7/7.
//

import UIKit
import AlamofireImage

class DYLiveShowCommonCell: UICollectionViewCell {
    @IBOutlet weak var liveCoverImageView: UIImageView!
    @IBOutlet weak var nickNameLabel: UILabel!
    @IBOutlet weak var huoLabel: UILabel!
    @IBOutlet weak var roomNameLabel: UILabel!
    @IBOutlet weak var locationBtn: UIButton!
    var liveShow: DYLiveShow? {
        didSet {
            nickNameLabel.text = liveShow?.nickname
            huoLabel.text = liveShow?.hn
            roomNameLabel.text = liveShow?.room_name
            if let imageUrl = URL(string: liveShow?.room_src ?? "") {
                liveCoverImageView.af_setImage(withURL: imageUrl)
            }
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

extension DYLiveShowCommonCell {

    private func setupUI() {
        
    }
}
