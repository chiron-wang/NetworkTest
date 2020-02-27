//
//  MemeViewController.swift
//  NetworkTest
//
//  Created by mikewang on 2020/2/27.
//  Copyright © 2020 mikewang. All rights reserved.
//

import UIKit

class MemeViewController: UIViewController {
    @IBOutlet weak var idLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView!    
    @IBOutlet weak var captionLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        GetMemeData()
    }
    
    func GetMemeData() {
        if let url = URL(string: "https://some-random-api.ml/meme") {
            let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
                let decoder = JSONDecoder()
                decoder.dateDecodingStrategy = .iso8601
                
                if let data = data, let memeResult = try? decoder.decode(Meme.self, from: data) {
                    self.SetImage(memeResult.image)
                    DispatchQueue.main.async {
                        self.idLabel.text = memeResult.id.description
                        self.captionLabel.text = memeResult.category
                    }
                }
            }
            task.resume()
        }
    }
    
    func SetImage(_ url: URL) {
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            if let data = data {
                DispatchQueue.main.async {
                    self.imageView.image = UIImage(data: data)
                }
            }
        }
        task.resume()
    }

}
