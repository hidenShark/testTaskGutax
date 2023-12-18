//
//  ViewController.swift
//  gutax
//
//  Created by Илья Акулов on 17.12.2023.
//

import UIKit
import SnapKit



protocol ViewControllerDelegate: AnyObject {
    func didTapButtonMenu()
}

class ViewController: UIViewController {
    
    weak var delegate: ViewControllerDelegate?

    override func viewDidLoad() {
        super.viewDidLoad()
        initialize()
    }

    func makeLeftBarButtonItems() -> [UIBarButtonItem] {
        
        let button: UIButton = UIButton.systemButton(with: UIImage(systemName: "chevron.down")!, target: self, action: nil)
        button.tintColor = #colorLiteral(red: 0.4875565171, green: 0.4875565767, blue: 0.4875565171, alpha: 1)
        let sideMenuButton = UIButton.systemButton(with: UIImage(systemName: "text.justify") ?? UIImage(), target: self, action: #selector(menuButton))
        sideMenuButton.tintColor = #colorLiteral(red: 0.4875565171, green: 0.4875565767, blue: 0.4875565171, alpha: 1)
        let addressButtonItem = UIBarButtonItem(title: "Пискунова,24", style: .plain, target: self, action: nil)
        let sideMenuButtonItem = UIBarButtonItem(customView: sideMenuButton)
        let dropDownButtonItem = UIBarButtonItem(customView: button)
        addressButtonItem.tintColor = .black
        return [sideMenuButtonItem, addressButtonItem, dropDownButtonItem]
    }
    
    //MARK: - Selector button
    @objc func menuButton() {
        delegate?.didTapButtonMenu()
    }
    
    //MARK: - Private properties
    private let tableView = UITableView()
    private var items: [FeedItemType] = [
        .search([
            FeedItemsSearchCellInfo(name: "Поиск товаров")
        ]),
        .section([
            FeedItemCellInfo(image: UIImage(named: "image 169") ?? UIImage(), name: "Летний пикник", weight: nil),
            FeedItemCellInfo(image: UIImage(named: "image 170") ?? UIImage(), name: "Летний обед", weight: nil),
            FeedItemCellInfo(image: UIImage(named: "image 172") ?? UIImage(), name: "На завтрак", weight: nil),
            FeedItemCellInfo(image: UIImage(named: "image 173") ?? UIImage(), name: "На ужин", weight: nil),
            FeedItemCellInfo(image: UIImage(named: "image 169") ?? UIImage(), name: "Летний пикник", weight: nil),
            FeedItemCellInfo(image: UIImage(named: "image 170") ?? UIImage(), name: "Летний обед", weight: nil),
            FeedItemCellInfo(image: UIImage(named: "image 172") ?? UIImage(), name: "На завтрак", weight: nil)
        ]),
        .banner([
        FeedItemBannerCellInfo(image: UIImage(named: "image 149") ?? UIImage(), smallLabel: "В честь открытия", bigLabel: "Скидка 20%"),
        FeedItemBannerCellInfo(image: UIImage(named: "image 149") ?? UIImage(), smallLabel: "В честь открытия", bigLabel: "Скидка 20%"),
        FeedItemBannerCellInfo(image: UIImage(named: "image 149") ?? UIImage(), smallLabel: "В честь открытия", bigLabel: "Скидка 20%"),
        FeedItemBannerCellInfo(image: UIImage(named: "image 149") ?? UIImage(), smallLabel: "В честь открытия", bigLabel: "Скидка 20%"),
        FeedItemBannerCellInfo(image: UIImage(named: "image 149") ?? UIImage(), smallLabel: "В честь открытия", bigLabel: "Скидка 20%"),
        FeedItemBannerCellInfo(image: UIImage(named: "image 149") ?? UIImage(), smallLabel: "В честь открытия", bigLabel: "Скидка 20%"),
        FeedItemBannerCellInfo(image: UIImage(named: "image 149") ?? UIImage(), smallLabel: "В честь открытия", bigLabel: "Скидка 20%")
        ]),
        .promotionsLabel([
            ItemsBlockLabelCellInfo(nameLabel: "Акции", nameButton: "Смотреть все")
        ]),
        .promotions([
            FeedItemPromoCellInfo(image: UIImage(named: "image 199") ?? UIImage(), name: "Черные спагетти с морепродуктами(большая порция)", weight: "230 г", sale: "-35%", novely: "Новинка"),
            FeedItemPromoCellInfo(image: UIImage(named: "Group 19252") ?? UIImage(), name: "Казаречче с индейкой и томатами", weight: "230 г", sale: "-25%", novely: nil),
            FeedItemPromoCellInfo(image: UIImage(named: "Group 19260") ?? UIImage(), name: "Равиоли с грибами", weight: "230 г", sale: "-35%", novely: nil),
            FeedItemPromoCellInfo(image: UIImage(named: "image 199") ?? UIImage(), name: "Черные спагетти с морепродуктами(большая порция)", weight: "230 г", sale: "-35%", novely: "Новинка"),
            FeedItemPromoCellInfo(image: UIImage(named: "Group 19252") ?? UIImage(), name: "Казаречче с индейкой и томатами", weight: "230 г", sale: "-35%", novely: nil),
            FeedItemPromoCellInfo(image: UIImage(named: "Group 19260") ?? UIImage(), name: "Равиоли с грибами", weight: "230 г", sale: "-35%", novely: nil),
            FeedItemPromoCellInfo(image: UIImage(named: "image 199") ?? UIImage(), name: "Черные спагетти с морепродуктами(большая порция)", weight: "230 г", sale: "-35%", novely: "Новинка")
        ]),
        .promotionsLabel([
            ItemsBlockLabelCellInfo(nameLabel: "Каталог", nameButton: "Смотреть все")
        ]),
        .catalog([
            FeedItemCatalogCellInfo(image: UIImage(named: "image 189") ?? UIImage(), name: "Наборы"),
            FeedItemCatalogCellInfo(image: UIImage(named: "image 188") ?? UIImage(), name: "Пицца"),
            FeedItemCatalogCellInfo(image: UIImage(named: "image 183") ?? UIImage(), name: "Паста"),
            FeedItemCatalogCellInfo(image: UIImage(named: "Group 19252") ?? UIImage(), name: "Ризотто"),
            FeedItemCatalogCellInfo(image: UIImage(named: "image 199") ?? UIImage(), name: "Салаты"),
            FeedItemCatalogCellInfo(image: UIImage(named: "image 182") ?? UIImage(), name: "Полу фабрикаты"),
            FeedItemCatalogCellInfo(image: UIImage(named: "image 185") ?? UIImage(), name: "Десерты"),
            FeedItemCatalogCellInfo(image: UIImage(named: "image 187") ?? UIImage(), name: "Добавки к блюдам"),
            FeedItemCatalogCellInfo(image: UIImage(named: "image 186") ?? UIImage(), name: "Напитки")
        ])
    ]
}

//MARK: - Private method

private extension ViewController {
    func initialize() {
        navigationItem.leftBarButtonItems = makeLeftBarButtonItems()
        view.backgroundColor = .white
        
        
        tableView.dataSource = self
        tableView.separatorColor = .clear
        tableView.register(FeedSearchSetCell.self, forCellReuseIdentifier: String(describing: FeedSearchSetCell.self))
        tableView.register(FeedSectionSetCell.self, forCellReuseIdentifier: String(describing: FeedSectionSetCell.self))
        tableView.register(FeedPromotionsSetCell.self, forCellReuseIdentifier: String(describing: FeedPromotionsSetCell.self))
        tableView.register(FeedBlockLabelSetCell.self, forCellReuseIdentifier: String(describing: FeedBlockLabelSetCell.self))
        tableView.register(FeedBannerSetCell.self, forCellReuseIdentifier: String(describing: FeedBannerSetCell.self))
        tableView.register(FeedCatalogSetCell.self, forCellReuseIdentifier: String(describing: FeedCatalogSetCell.self))
        view.addSubview(tableView)
        tableView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let item = items[indexPath.row]
        switch item {
        case .search(let search):
            let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: FeedSearchSetCell.self), for: indexPath) as! FeedSearchSetCell
            cell.configure(with: search)
            return cell
        case .section(let section):
            let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: FeedSectionSetCell.self), for: indexPath) as! FeedSectionSetCell
            cell.conigure(with: section)
            return cell
        case .promotions(let promotions):
            let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: FeedPromotionsSetCell.self), for: indexPath) as! FeedPromotionsSetCell
            cell.conigure(with: promotions)
            return cell
        case .promotionsLabel(let promotionsLabel):
            let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: FeedBlockLabelSetCell.self), for: indexPath) as! FeedBlockLabelSetCell
            cell.configure(with: promotionsLabel)
            return cell
        case .banner(let banner):
            let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: FeedBannerSetCell.self), for: indexPath) as! FeedBannerSetCell
            cell.configure(with: banner)
            return cell
        case .catalog(let catalog):
            let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: FeedCatalogSetCell.self), for: indexPath) as! FeedCatalogSetCell
            cell.configure(with: catalog)
            return cell
        }
    }
}
