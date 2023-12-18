//
//  MenuViewController.swift
//  gutax
//
//  Created by Илья Акулов on 17.12.2023.
//

import UIKit

class MenuViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    enum MenuOption: String, CaseIterable {
        case myAddress = "Мои адреса"
        case myOrders = "Мои заказы"
        case favorites = "Избраное"
        case naws = "Новости"
        case coupons = "Купоны"
        case aboutUs = "О нас"
        case inviteFriends = "Пригласить друзей"
        case settings = "Настройки"
    }
    
    private let tableView: UITableView = {
        let tableView = UITableView()
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        tableView.backgroundColor = .clear
        tableView.separatorColor = .clear
        return tableView
    }()
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        tableView.frame = CGRect(x: 0, y: view.safeAreaInsets.top, width: view.bounds.size.width, height: view.bounds.size.height)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(tableView)
        view.backgroundColor = #colorLiteral(red: 0.9558447003, green: 0.9558447003, blue: 0.9558447003, alpha: 1)
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return MenuOption.allCases.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = MenuOption.allCases[indexPath.row].rawValue
        cell.backgroundColor = .clear
        cell.contentView.backgroundColor = .clear
        return cell
    }
}
