//
//  SearchItemCell.swift
//  gutax
//
//  Created by Илья Акулов on 18.12.2023.
//

import SnapKit
import UIKit

class SearchItemCell: UICollectionViewCell {
//    MARK: - Public
    func configure(with info: FeedItemsSearchCellInfo) {
        name.attributedPlaceholder = NSAttributedString(
            string: info.name,
            attributes: [NSAttributedString.Key.foregroundColor: #colorLiteral(red: 0.4875565171, green: 0.4875565767, blue: 0.4875565171, alpha: 1)])

        
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

    
    private let name: UITextField = {
        let textField = UITextField()
        textField.backgroundColor = #colorLiteral(red: 0.9626654983, green: 0.9626654983, blue: 0.9626654983, alpha: 1)
        textField.layer.masksToBounds = true
        textField.layer.cornerRadius = 5
        return textField
    }()
    
    private let button: UIButton = {
        let button = UIButton(type: .system)
        button.tintColor = .black
        button.backgroundColor = #colorLiteral(red: 0.9626654983, green: 0.9626654983, blue: 0.9626654983, alpha: 1)
        button.layer.masksToBounds = true
        button.layer.cornerRadius = 15
        button.tintColor = #colorLiteral(red: 0.4875565171, green: 0.4875565767, blue: 0.4875565171, alpha: 1)
        button.setImage(UIImage(systemName: "heart.fill"), for: .normal)
        return button
    }()
    
}

//MARK: - Private method

private extension SearchItemCell {
    func initialize() {
        contentView.addSubview(name)
        name.snp.makeConstraints { make in
            make.leading.equalTo(contentView.snp.leading).inset(15)
            make.centerY.equalTo(contentView.snp.centerY)
            make.height.equalTo(35)
            make.width.equalTo(305)
        }
        
        contentView.addSubview(button)
        button.snp.makeConstraints { make in
            make.size.equalTo(30)
            make.trailing.equalTo(contentView.snp.trailing).inset(15)
            make.centerY.equalTo(name.snp.centerY)
        }
    }
}

