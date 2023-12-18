//
//  FeedBannerSetCell.swift
//  gutax
//
//  Created by Илья Акулов on 18.12.2023.
//

import SnapKit
import UIKit

class FeedBannerSetCell: UITableViewCell {
//    MARK: - Public
    func configure(with info: FeedBannerCellInfo) {
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
        static let cellWidth: CGFloat = 290
        static let cellHeight: CGFloat = 115
        static let collectionViewHeight: CGFloat = 115
    }
        
//    MARK: - Private properties
    private var collectionView: UICollectionView!
    private var items: FeedBannerCellInfo = []
}

//MARK: - Private method
private extension FeedBannerSetCell {
    func initialize() {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.register(BannerItemCell.self, forCellWithReuseIdentifier: String(describing: BannerItemCell.self))
        collectionView.dataSource = self
        collectionView.delegate = self
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
extension FeedBannerSetCell: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        items.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: String(describing: BannerItemCell.self), for: indexPath) as! BannerItemCell
        cell.configure(with: items[indexPath.item])
        cell.contentView.layer.cornerRadius = 12
        return cell
    }
}

//MARK: - UICollectionViewDelegateFlowLayout
extension FeedBannerSetCell: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(width: UIConstants.cellWidth, height: UIConstants.cellHeight)
    }
}
