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
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.distribution = .equalSpacing
        stackView.alignment = .center
        stackView.spacing = 5.0
        stackView.translatesAutoresizingMaskIntoConstraints = false
                
        let selectors = [
            #selector(ViewController.GoPhoto),
            #selector(ViewController.GoMeme),
            #selector(ViewController.GoSong),
            #selector(ViewController.GoSongTB)
        ]
        let titles = [
            "Photo Wall",
            "MemeApi",
            "ItunesSongApi",
            "SongTableView"
        ]
        
        for i in 0...3 {
            let button = UIHelper.createButton(title: titles[i], target: self, selector: selectors[i])
            button.widthAnchor.constraint(equalToConstant: self.view.frame.width).isActive = true
            button.heightAnchor.constraint(equalToConstant: 50).isActive = true
            stackView.addArrangedSubview(button)
        }
        
        view.addSubview(stackView)
        
        stackView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        stackView.centerYAnchor.constraint(equalTo: self.view.centerYAnchor).isActive = true
        
        GoSongTB()
    }
    
    
    
    @objc func GoPhoto() {
        let photoVC = PhotoViewController(nibName: String(describing: PhotoViewController.self), bundle: nil)
        photoVC.title = "PhotoImageDownload"
        navigationController?.pushViewController(photoVC, animated: true)
    }
    
    @objc func GoMeme() {
        let memeVC = MemeViewController(nibName: String(describing: MemeViewController.self), bundle: nil)
        memeVC.title = "MemeApi"
        navigationController?.pushViewController(memeVC, animated: true)
    }
    
    @objc func GoSong() {
        let songVC = SongViewController(nibName: String(describing: SongViewController.self), bundle: nil)
        songVC.title = "ItunesSongApi"
        navigationController?.pushViewController(songVC, animated: true)
    }
    
    @objc func GoSongTB() {
        let songsTBVC = SongTableViewController(nibName: String(describing: SongTableViewController.self), bundle: nil)
        songsTBVC.title = "SongTableView"
        navigationController?.pushViewController(songsTBVC, animated: true)
    }
    
    
}

