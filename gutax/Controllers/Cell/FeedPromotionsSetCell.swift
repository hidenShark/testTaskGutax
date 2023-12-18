//
//  FeedPromotionsSetCell.swift
//  gutax
//
//  Created by Илья Акулов on 18.12.2023.
//

import SnapKit
import UIKit

class FeedPromotionsSetCell: UITableViewCell {
    //    MARK: - Public
    func conigure(with info: FeedPromoCellInfo) {
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
        static let collectionViewHeight: CGFloat = 208
        static let cellWidth: CGFloat = 102
        static let cellHeight: CGFloat = 208
    }
    
    //   MARK: - Private properties
    private var collectionView: UICollectionView!
    private var items: FeedPromoCellInfo = []
}

//MARK: - Private method

private extension FeedPromotionsSetCell {
    func initialize() {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.register(PromotionsItemCell.self, forCellWithReuseIdentifier: String(describing: PromotionsItemCell.self))
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
extension FeedPromotionsSetCell: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        items.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: String(describing: PromotionsItemCell.self), for: indexPath) as! PromotionsItemCell
        cell.configure(with: items[indexPath.item])
        cell.contentView.layer.cornerRadius = 12
        cell.contentView.backgroundColor = #colorLiteral(red: 0.9626654983, green: 0.9626654983, blue: 0.9626654983, alpha: 1)
        return cell
    }
}

//MARK: - UICollectionViewDelegateFlowLayout
extension FeedPromotionsSetCell: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(width: UIConstants.cellWidth, height: UIConstants.cellHeight)
    }
}

