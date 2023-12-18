//
//  FeedBannerCellInfo.swift
//  gutax
//
//  Created by Илья Акулов on 18.12.2023.
//

import Foundation
import UIKit

struct FeedItemBannerCellInfo {
    let image: UIImage?
    let smallLabel: String?
    let bigLabel: String?
}

typealias FeedBannerCellInfo = [FeedItemBannerCellInfo]
