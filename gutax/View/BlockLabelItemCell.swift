//
//  BlockLabelItemCell.swift
//  gutax
//
//  Created by Илья Акулов on 18.12.2023.
//

import Foundation
import UIKit

class BlockLabelItemCell: UICollectionViewCell {
//    MARK: - Public
    func configure(with info: ItemsBlockLabelCellInfo) {
        nameLabel.text = info.nameLabel
        allWatchButton.setTitle(info.nameButton, for: .normal) 
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
        static let widthButton: CGFloat = 103
        static let heightButton: CGFloat = 25
        static let indentLeftLabel: CGFloat = 15
        static let indentRightButton: CGFloat = 15
    }
    
    
//    MARK: - Private properties
    private let nameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 25)
        return label
    }()
    
    private let allWatchButton: UIButton = {
        let button = UIButton()
        button.titleLabel?.font = UIFont.systemFont(ofSize: 12)
        
        
        button.layer.cornerRadius = 12
        button.layer.masksToBounds = true
        button.backgroundColor = #colorLiteral(red: 0.9558447003, green: 0.9558447003, blue: 0.9558447003, alpha: 1)
        button.setTitleColor(.black, for: .normal)
        return button
    }()
    
}

//MARK: - Private method
extension BlockLabelItemCell {
    func initialize() {
        contentView.addSubview(nameLabel)
        nameLabel.snp.makeConstraints { make in
            make.leading.equalTo(contentView.snp.leading).inset(UIConstants.indentLeftLabel)
            make.centerY.equalTo(contentView.snp.centerY)
        }
        
        contentView.addSubview(allWatchButton)
        allWatchButton.snp.makeConstraints { make in
            make.width.equalTo(UIConstants.widthButton)
            make.height.equalTo(UIConstants.heightButton)
            make.trailing.equalTo(contentView.snp.trailing).inset(UIConstants.indentRightButton)
            make.centerY.equalTo(contentView.snp.centerY)
        }
    }
}
