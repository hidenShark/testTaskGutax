//
//  PromotionsItemCell.swift
//  gutax
//
//  Created by Илья Акулов on 18.12.2023.
//

import SnapKit
import UIKit

class PromotionsItemCell: UICollectionViewCell {
//    MARK: - Public
    func configure(with info: FeedItemPromoCellInfo) {
        imageView.image = info.image
        namePromoLabel.text = info.name
        weightLabel.text = info.weight
        saleLabel.text = info.sale
        novelyLabel.text = info.novely
    }
//    MARK: - Init
    override init(frame: CGRect) {
        super.init(frame: frame)
        initialize()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
//    MARK: - Private constants
    private enum UIConstants {
        static let imageSize: CGFloat = 102
    }
    
//    MARK: - Private properties
    private let imageView: UIImageView = {
        let view = UIImageView()
        return view
    }()
    
    private let namePromoLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 12)
        label.numberOfLines = 0
        return label
    }()
    
    private let weightLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 12)
        label.textColor = #colorLiteral(red: 0.4875565171, green: 0.4875565767, blue: 0.4875565171, alpha: 1)
        return label
    }()
    
    private let saleLabel: UILabel = {
        let label = UILabel()
        label.backgroundColor = #colorLiteral(red: 1, green: 0.2855299115, blue: 0.1874670088, alpha: 1)
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 12)
        label.layer.masksToBounds = true
        label.layer.cornerRadius = 6
        
        return label
    }()
    
    private let novelyLabel: UILabel = {
        let label = UILabel()
        label.backgroundColor = #colorLiteral(red: 1, green: 0.6641581655, blue: 0.1321404278, alpha: 1)
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 12)
        label.layer.masksToBounds = true
        label.layer.cornerRadius = 6
        return label
    }()
}

//MARK: - Private method
private extension PromotionsItemCell {
    func initialize() {
        contentView.addSubview(imageView)
        imageView.snp.makeConstraints { make in
            make.size.equalTo(UIConstants.imageSize)
        }
        
        contentView.addSubview(namePromoLabel)
        namePromoLabel.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview()
            make.top.equalTo(imageView.snp.bottom).offset(5)
        }
        
        contentView.addSubview(weightLabel)
        weightLabel.snp.makeConstraints { make in
            make.top.equalTo(namePromoLabel.snp.bottom).offset(5)
            make.left.equalTo(contentView.snp.left).inset(5)
        }
        contentView.addSubview(saleLabel)
        saleLabel.snp.makeConstraints { make in
            make.top.equalTo(contentView.snp.top).inset(5)
            make.left.equalTo(contentView.snp.left).inset(5)
        }
        
        contentView.addSubview(novelyLabel)
        novelyLabel.snp.makeConstraints { make in
            make.top.equalTo(contentView.snp.top).inset(5)
            make.right.equalTo(contentView.snp.right).inset(5)
        }
    }
}



