//
//  FeedPromoCellInfo.swift
//  gutax
//
//  Created by Илья Акулов on 18.12.2023.
//

import Foundation
import UIKit


struct FeedItemPromoCellInfo {
    let image: UIImage
    let name: String
    let weight: String
    let sale: String
    let novely: String?
    
}

typealias FeedPromoCellInfo = [FeedItemPromoCellInfo]
