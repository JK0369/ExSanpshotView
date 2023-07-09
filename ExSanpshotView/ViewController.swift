//
//  ViewController.swift
//  ExSanpshotView
//
//  Created by 김종권 on 2023/07/09.
//

import UIKit

class ViewController: UIViewController {
    private var snapshotView: UIView?
    private let button: UIButton = {
        let button = UIButton()
        button.setTitle("button", for: .normal)
        button.setTitleColor(.systemBlue, for: .normal)
        button.setTitleColor(.blue, for: .highlighted)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(button)
        NSLayoutConstraint.activate([
            button.heightAnchor.constraint(equalToConstant: 200),
            button.widthAnchor.constraint(equalToConstant: 300),
            button.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            button.centerXAnchor.constraint(equalTo: view.centerXAnchor),
        ])
        
        button.addTarget(self, action: #selector(tap), for: .touchUpInside)
    }
    
    @objc private func tap() {
        guard snapshotView == nil else { return }
        snapshotView = button.snapshotView(afterScreenUpdates: true)
        
        snapshotView!.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(snapshotView!)
        NSLayoutConstraint.activate([
            snapshotView!.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 60),
            snapshotView!.heightAnchor.constraint(equalToConstant: 200),
            snapshotView!.widthAnchor.constraint(equalToConstant: 300),
            snapshotView!.centerXAnchor.constraint(equalTo: view.centerXAnchor),
        ])
    }
}
