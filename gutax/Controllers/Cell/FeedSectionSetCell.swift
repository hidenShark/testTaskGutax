//
//  FeedSectionSetCell.swift
//  gutax
//
//  Created by Илья Акулов on 18.12.2023.
//

import SnapKit
import UIKit

class FeedSectionSetCell: UITableViewCell {
    
    //    MARK: - Public
    func conigure(with info: FeedCellInfo) {
        self.items = info
        collectionView.reloadData()
    }
    
    //    MARK: - Init
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        initialize()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //    MARK: - Private constants
    private enum UIConstants {
        static let collectionViewHeight: CGFloat = 90
        static let cellWidth: CGFloat = 88
        static let cellHeight: CGFloat = 88
    }
    
    //    MARK: - Private properties
    private var collectionView: UICollectionView!
    private var items: FeedCellInfo = []
    
}

// MARK: - Private method
private extension FeedSectionSetCell {
    func initialize() {
        
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.register(SectionItemCell.self, forCellWithReuseIdentifier: String(describing: SectionItemCell.self))
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.showsHorizontalScrollIndicator = false
        contentView.addSubview(collectionView)
        collectionView.snp.makeConstraints { make in
//            make.edges.equalToSuperview()
            make.leading.equalTo(contentView.snp.leading).inset(15)
            make.bottom.top.trailing.equalToSuperview()
            make.height.equalTo(UIConstants.collectionViewHeight)
        }
    }
}

//MARK: - UICollectionViewDataSource
extension FeedSectionSetCell: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        items.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: String(describing: SectionItemCell.self), for: indexPath) as! SectionItemCell
        cell.configure(with: items[indexPath.item])
        return cell
    }
}

//MARK: - UICollectionViewDelegateFlowLayout
extension FeedSectionSetCell: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(width: UIConstants.cellWidth, height: UIConstants.cellHeight)
    }
}
