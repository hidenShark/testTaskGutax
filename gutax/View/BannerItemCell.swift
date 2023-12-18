//
//  BannerItemCell.swift
//  gutax
//
//  Created by Илья Акулов on 18.12.2023.
//

import SnapKit
import UIKit

class BannerItemCell: UICollectionViewCell {
    
//    MARK: - Public
    func configure(with info: FeedItemBannerCellInfo) {
        imageView.image = info.image
        smallLabel.text = info.smallLabel
        bigLabel.text = info.bigLabel
    }
    
//    MARK: - Init
    override init(frame: CGRect) {
        super .init(frame: frame)
        initialize()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
//    MARK: - Private constants
    private enum UIConstants {
        
    }
    
//    MARK: - Private properties
    private let imageView: UIImageView = {
        let view = UIImageView()
        view.layer.masksToBounds = true
        view.layer.cornerRadius = 12
        return view
    }()
    
    private let smallLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 15)
        label.textColor = .white
        return label
    }()
    
    private let bigLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 25)
        label.textColor = .white
        return label
    }()
}

//MARK: - Private method
private extension BannerItemCell {
    func initialize() {
        contentView.addSubview(imageView)
        imageView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        contentView.addSubview(smallLabel)
        smallLabel.snp.makeConstraints { make in
            make.left.equalTo(contentView.snp.left).inset(15)
            make.bottom.equalTo(contentView.snp.bottom).inset(45)
        }
        
        contentView.addSubview(bigLabel)
        bigLabel.snp.makeConstraints { make in
            make.left.equalTo(contentView.snp.left).inset(15)
            make.top.equalTo(smallLabel.snp.bottom)
        }
    }
}

