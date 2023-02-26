//
//  ViewController.swift
//  IntrinsicContentSize
//
//  Created by Shah Md Imran Hossain on 26/2/23.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setupViews()
    }

    func setupViews() {
        let label = makeLabel(withText: "label One")
        
        view.addSubview(label)
        
        // here, we are pinning the label at top and leading anchor
        // we are not defining any size
        // but label will auto adjust it's size with it's content size, label's default intrinsic size is it's content size
        label.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 8).isActive = true
        label.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 8).isActive = true
        
        // setting own width and height, that way it will override default intrinsic content size
//        label.heightAnchor.constraint(equalToConstant: 100).isActive = true
//        label.widthAnchor.constraint(equalToConstant: 200).isActive = true
        
        // we can also add a trailing anchor for overriding the default intrinsic content size
//        view.trailingAnchor.constraint(equalTo: label.trailingAnchor, constant: 8).isActive = true
    }
}

// MARK: - Factory methods

extension ViewController {
    func makeLabel(withText text: String) -> UILabel {
        let label = BigLabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = text
        label.font = UIFont.systemFont(ofSize: 32)
        label.backgroundColor = .yellow
        
        return label
    }
}

// overridding default intrinsic content size of label
class BigLabel: UILabel {
    // overridding the parent class variable intrinsicContentSize
    override var intrinsicContentSize: CGSize {
        return CGSize(width: 200, height: 300)
    }
}

