//
//  ViewController.swift
//  NetworkTest
//
//  Created by mikewang on 2020/2/22.
//  Copyright © 2020 mikewang. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let fullSize = UIScreen.main.bounds.size
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configUI()
        
        
        
        //        print(Thread.isMainThread)
        //        let urlStr = "https://wakelandtheatre.files.wordpress.com/2013/11/final-poster.jpg"
        //        if let url = URL(string: urlStr) {
        //            let task = URLSession.shared.dataTask(with: url) {
        //                (data, response, error) in
        //                if let data = data {
        //                    print(Thread.isMainThread)
        //                    let image = UIImage(data: data)
        //                    print("get image")
        //                }
        //            }
        //
        //            task.resume()
        //        }
        //        print(Thread.isMainThread)
        
    }
    
    private func configUI() {
        let button1 = UIButton(type: .system)
        button1.setTitle("Photo Wall", for: .normal)
        button1.widthAnchor.constraint(equalToConstant: self.view.frame.width).isActive = true
        button1.heightAnchor.constraint(equalToConstant: 50).isActive = true
        button1.backgroundColor = .yellow
        button1.addTarget(self, action: #selector(ViewController.GoPhoto), for: .touchUpInside)
        
        let button2 = UIButton(type: .system)
        button2.setTitle("Photo Wall2", for: .normal)
        button2.widthAnchor.constraint(equalToConstant: self.view.frame.width).isActive = true
        button2.heightAnchor.constraint(equalToConstant: 50).isActive = true
        button2.backgroundColor = .lightGray
        
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.distribution = .equalSpacing
        stackView.alignment = .center
        stackView.spacing = 5.0
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        stackView.addArrangedSubview(button1)
        stackView.addArrangedSubview(button2)
        view.addSubview(stackView)
        
        stackView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        stackView.centerYAnchor.constraint(equalTo: self.view.centerYAnchor).isActive = true
    }
    
    
    
    @objc func GoPhoto() {
        let photoVC = PhotoViewController(nibName: String(describing: PhotoViewController.self), bundle: nil)
        photoVC.title = "PhotoImageDownload"
        navigationController?.pushViewController(photoVC, animated: true)
    }
    
    
}

