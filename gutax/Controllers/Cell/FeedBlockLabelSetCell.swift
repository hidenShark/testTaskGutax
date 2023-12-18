//
//  FeedBlockLabelSetCell.swift
//  gutax
//
//  Created by Илья Акулов on 18.12.2023.
//

import SnapKit
import UIKit

class FeedBlockLabelSetCell: UITableViewCell {
//    MARK: - Public
    func configure(with info: BlockLabelCellInfo) {
        self.items = info
        colletionView.reloadData()
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
    
//    MARK: - Private properties
    private var colletionView: UICollectionView!
    private var items: BlockLabelCellInfo = []
    
    
}

//MARK: - Private method

private extension FeedBlockLabelSetCell {
    func initialize() {
        let layout = UICollectionViewFlowLayout()
        colletionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        colletionView.register(BlockLabelItemCell.self, forCellWithReuseIdentifier: String(describing: BlockLabelItemCell.self))
        colletionView.delegate = self
        colletionView.dataSource = self
        contentView.addSubview(colletionView)
        colletionView.snp.makeConstraints { make in
//            make.edges.equalToSuperview()
            make.leading.equalTo(contentView.snp.leading).inset(15)
            make.bottom.top.trailing.equalToSuperview()
            make.height.equalTo(50)
        }
    }
}

//MARK: - UICollectionViewDataSource
extension FeedBlockLabelSetCell: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        items.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: String(describing: BlockLabelItemCell.self), for: indexPath) as! BlockLabelItemCell
        cell.configure(with: items[indexPath.item])
        return cell
    }
}

//MARK: - UICollectionViewDelegateFlowLayout
extension FeedBlockLabelSetCell: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(width: frame.size.width, height: 50)
    }
}

