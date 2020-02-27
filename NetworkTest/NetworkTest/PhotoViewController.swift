//
//  PhotoViewController.swift
//  NetworkTest
//
//  Created by mikewang on 2020/2/25.
//  Copyright © 2020 mikewang. All rights reserved.
//

import UIKit

class PhotoViewController: UIViewController {
    
    @IBOutlet weak var imageView1: UIImageView!
    @IBOutlet weak var imageView2: UIImageView!
    @IBOutlet weak var imageView3: UIImageView!
    @IBOutlet weak var imageView4: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let urlStr1 = "https://wakelandtheatre.files.wordpress.com/2013/11/final-poster.jpg"
        let urlStr2 = "https://wakelandtheatre.files.wordpress.com/2018/05/dsm-whs-2018.jpg"
        let urlStr3 = "https://wakelandtheatre.files.wordpress.com/2017/11/chickfila.jpg"
        let urlStr4 = "https://wakelandtheatre.files.wordpress.com/2017/05/theatrebanquetcopy.jpg"
        SetImage(urlStr1, imageView: imageView1)
        SetImage(urlStr2, imageView: imageView2)
        SetImage(urlStr3, imageView: imageView3)
        SetImage(urlStr4, imageView: imageView4)
    }
    
    func SetImage(_ imageUrl: String, imageView: UIImageView) {
        if let url = URL(string: imageUrl) {
            let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
                if let data = data {
                    DispatchQueue.main.async {
                        imageView.image = UIImage(data: data)
                    }
                }
            }
            task.resume()
        }
    }


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
