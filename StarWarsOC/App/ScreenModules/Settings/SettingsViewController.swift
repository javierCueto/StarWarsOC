//
//  SettingsViewController.swift
//  StarWarsOC
//
//  Created by Jose Javier Cueto Mejia on 06/10/22.
//

import UIKit

@objc
public protocol SettingsViewControllerDelegate {
    func didFinish()
}

@objcMembers

final class SettingsViewController: UIViewController {
    
    // MARK: Public Properties
    private weak var delegate: SettingsViewControllerDelegate?
    // MARK: Pivate Properties
    
    // MARK: Life Cycle
     init(delegate: SettingsViewControllerDelegate?) {
        self.delegate = delegate
        super.init(nibName: nil, bundle: nil)
         title = "Hello World"
         navigationItem.leftBarButtonItem = UIBarButtonItem(image: .remove, style: .done, target: self, action: #selector(closeView))
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
     override func viewDidLoad() {
         view.backgroundColor = .white
        title = "Settings"
    }
    
    // MARK: Helpers
    @objc
    private func closeView() {
        delegate?.didFinish()
    }
    
    // MARK: Extensions
}
