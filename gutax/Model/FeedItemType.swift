//
//  FeedItemType.swift
//  gutax
//
//  Created by Илья Акулов on 18.12.2023.
//

enum FeedItemType {
    case search(FeedSearchCellInfo)
    case section(FeedCellInfo)
    case banner(FeedBannerCellInfo)
    case promotionsLabel(BlockLabelCellInfo)
    case promotions(FeedPromoCellInfo)
    case catalog(FeedCatalogCellInfo)
}
