//
//  FeedCellInfo.swift
//  gutax
//
//  Created by Илья Акулов on 18.12.2023.
//

import Foundation
import UIKit

struct FeedItemCellInfo {
    let image: UIImage
    let name: String
    let weight: String?
}

typealias FeedCellInfo = [FeedItemCellInfo]
