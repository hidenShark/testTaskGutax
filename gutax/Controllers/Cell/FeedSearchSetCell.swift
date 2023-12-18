//
//  FeedSearchSetCell.swift
//  gutax
//
//  Created by Илья Акулов on 18.12.2023.
//

import SnapKit
import UIKit

class FeedSearchSetCell: UITableViewCell {
//    MARK: - Public
    func configure(with info: FeedSearchCellInfo) {
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
        static let cellWidth: CGFloat = 375
        static let cellHeight: CGFloat = 60
        static let collectionViewHeight: CGFloat = 60
    }
    
//    MARK: - Private properties
    private var collectionView: UICollectionView!
    private var items: FeedSearchCellInfo = []
}

//MARK: - Private method
private extension FeedSearchSetCell {
    func initialize() {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.register(SearchItemCell.self, forCellWithReuseIdentifier: String(describing: SearchItemCell.self))
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
extension FeedSearchSetCell: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        items.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: String(describing: SearchItemCell.self), for: indexPath) as! SearchItemCell
//        cell.configure(with: items[indexPath.item])
        cell.configure(with: items[indexPath.item])
//        cell.contentView.layer.cornerRadius = 12
//        cell.contentView.backgroundColor = #colorLiteral(red: 0.7237852216, green: 0.7675782442, blue: 0.7828778625, alpha: 1)
//        cell.contentView.backgroundColor =
        return cell
    }
}

extension FeedSearchSetCell: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(width: UIConstants.cellWidth, height: UIConstants.cellHeight)
    }
}

