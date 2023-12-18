//
//  SectionItemCell.swift
//  gutax
//
//  Created by Илья Акулов on 18.12.2023.
//

import SnapKit
import UIKit

class SectionItemCell: UICollectionViewCell {
//    MARK: - Public
    func configure(with info: FeedItemCellInfo) {
        imageView.image = info.image
        nameSectionLabel.text = info.name
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
        static let imageSize: CGFloat = 65
    }
    
//    MARK: - Private properties
    private let imageView: UIImageView = {
        let view = UIImageView()
        return view
    }()
    
    private let nameSectionLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 12)
        label.textAlignment = .center
        return label
    }()
}

//  MARK: - Private method
private extension SectionItemCell {
    func initialize() {
        contentView.addSubview(imageView)
        imageView.snp.makeConstraints { make in
            make.size.equalTo(UIConstants.imageSize)
            make.centerX.equalTo(contentView.snp.centerX)
        }

        contentView.addSubview(nameSectionLabel)
        nameSectionLabel.snp.makeConstraints { make in
            make.leading.trailing.bottom.equalToSuperview()
            make.top.equalTo(imageView.snp.bottom).offset(5)
        }
    }
}
