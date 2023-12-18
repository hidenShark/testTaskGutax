//
//  FeedCatalogSetCell.swift
//  gutax
//
//  Created by Илья Акулов on 18.12.2023.
//

import SnapKit
import UIKit

class FeedCatalogSetCell: UITableViewCell {
//    MARK: - Public
    func configure(with info: FeedCatalogCellInfo) {
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
        static let cellWidth: CGFloat = 108
        static let cellHeight: CGFloat = 135
        static let collectionViewHeight: CGFloat = 445
    }
    
//    MARK: - Private properties
    private var collectionView: UICollectionView!
    private var items: FeedCatalogCellInfo = []
}

//MARK: - Private method
private extension FeedCatalogSetCell {
    func initialize() {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.register(CatalogItemCell.self, forCellWithReuseIdentifier: String(describing: CatalogItemCell.self))
        collectionView.dataSource = self
        collectionView.delegate = self
        contentView.addSubview(collectionView)
        collectionView.snp.makeConstraints { make in
//            make.edges.equalToSuperview()
            make.leading.equalTo(contentView.snp.leading).inset(15)
            make.trailing.equalTo(contentView.snp.trailing).inset(15)
            make.bottom.top.equalToSuperview()
            make.height.equalTo(UIConstants.collectionViewHeight)
        }
    }
}

//MARK: - UICollectionViewDataSource
extension FeedCatalogSetCell: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        items.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: String(describing: CatalogItemCell.self), for: indexPath) as! CatalogItemCell
        cell.configure(with: items[indexPath.item])
        cell.contentView.layer.cornerRadius = 12
        cell.contentView.backgroundColor = #colorLiteral(red: 0.9988346696, green: 0.7553412318, blue: 0.7156443, alpha: 1)
//        cell.contentView.backgroundColor =
        return cell
    }
}

extension FeedCatalogSetCell: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(width: UIConstants.cellWidth, height: UIConstants.cellHeight)
    }
}
