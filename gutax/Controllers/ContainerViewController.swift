//
//  ContainerViewController.swift
//  gutax
//
//  Created by Илья Акулов on 17.12.2023.
//

import UIKit

class ContainerViewController: UIViewController {
    
    enum MenuState {
        case opened
        case closed
    }
    
    private var menuState: MenuState = .closed
    
    let controller = ViewController()
    let menuViewController = MenuViewController()
    var navVC: UINavigationController?

    override func viewDidLoad() {
        super.viewDidLoad()

        addChildsVC()
    }
    

    
    private func addChildsVC() {
        
        addChild(menuViewController)
        view.addSubview(menuViewController.view)
        menuViewController.didMove(toParent: self)
        
        controller.delegate = self
        let navVC = UINavigationController(rootViewController: controller)
        addChild(navVC)
        view.addSubview(navVC.view)
        navVC.didMove(toParent: self)
        self.navVC = navVC
    }

}

extension ContainerViewController: ViewControllerDelegate {
    
    func didTapButtonMenu() {
        switch menuState {
        case .closed:
            
            UIView.animate(withDuration: 0.5,
                           delay: 0,
                           usingSpringWithDamping: 0.8,
                           initialSpringVelocity: 0,
                           options: .curveEaseInOut) {
                self.navVC?.view.frame.origin.x = self.controller.view.frame.size.width - 50
            } completion: { [weak self] done in
                if done {
                    self?.menuState = .opened
                }
            }
            
        case .opened:
            
            UIView.animate(withDuration: 0.5,
                           delay: 0,
                           usingSpringWithDamping: 0.8,
                           initialSpringVelocity: 0,
                           options: .curveEaseInOut) {
                self.navVC?.view.frame.origin.x = 0
            } completion: { [weak self] done in
                if done {
                    self?.menuState = .closed
                }
            }
        }
    }
}
