//
//  CatalogItemCell.swift
//  gutax
//
//  Created by Илья Акулов on 18.12.2023.
//

import SnapKit
import UIKit

class CatalogItemCell: UICollectionViewCell {
//    MARK: - Public
    func configure(with info: FeedItemCatalogCellInfo) {
        imageView.image = info.image
        name.text = info.name
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
        static let offset: CGFloat = 10
    }
    
//    MARK: - Private properties
    private let imageView: UIImageView = {
        let view = UIImageView()
        return view
    }()
    
    private let name: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "HelveticaNeue-Bold", size: 14)
        label.numberOfLines = 0
        label.textAlignment = .center
        return label
    }()
}

//MARK: - Private method

private extension CatalogItemCell {
    func initialize() {
        contentView.addSubview(imageView)
        imageView.snp.makeConstraints { make in
            make.centerX.equalTo(contentView.snp.centerX)
            make.top.equalTo(contentView.snp.top).inset(5)
        }
        
        contentView.addSubview(name)
        name.snp.makeConstraints { make in
            make.width.equalTo(88)
            make.centerX.equalTo(contentView.snp.centerX)
            make.bottomMargin.equalTo(contentView.snp.bottomMargin).inset(UIConstants.offset)
        }
    }
}
