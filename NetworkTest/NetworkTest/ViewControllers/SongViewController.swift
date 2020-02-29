//
//  SongViewController.swift
//  NetworkTest
//
//  Created by mikewang on 2020/2/28.
//  Copyright © 2020 mikewang. All rights reserved.
//

import UIKit
import AVFoundation

class SongViewController: UIViewController {
    
    var taylorSong: Song?
    var player: AVAudioPlayer?
    var soundData: Data?

    @IBOutlet weak var artistLabel: UILabel!
    @IBOutlet weak var coverImageView: UIImageView!
    @IBOutlet weak var releaseLabel: UILabel!
    
    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        testGetSongs()

        let urlStr = "https://itunes.apple.com/search?term=swift&media=music"
        
        if let url = URL(string: urlStr) {
            URLSession.shared.dataTask(with: url) { (data, response, error) in
                let decoder = JSONDecoder()
                decoder.dateDecodingStrategy = .iso8601
                
                if let data = data, let songResults = try? decoder.decode(SongResults.self, from: data) {
                    let filterResult = songResults.results.filter { (song) -> Bool in
                        song.artistName == "Taylor Swift"
                    }
                    self.taylorSong = filterResult.randomElement()
                    self.SetImage(self.taylorSong?.artworkUrl100)
                    DispatchQueue.main.async {
                        self.artistLabel.text = self.taylorSong?.artistName
                        self.releaseLabel.text = self.taylorSong?.releaseDate.description
                    }
                    guard let soundUrl = self.taylorSong?.previewUrl else { return }
                    self.soundData = try? Data(contentsOf: soundUrl)
                } else {
                    print("error")
                }
            }.resume()
        }
    }

    // MARK: - IBAction
    
    @IBAction func playButtonPressed(_ sender: UIButton) {
        guard let soundData = soundData else { return }
        
        do {
            player = try AVAudioPlayer(data: soundData)
            player?.prepareToPlay()
            player?.volume = 1.0
            player?.play()
        } catch {
            print(error.localizedDescription)
        }
    }
    
    
    @IBAction func stopButtonPressed(_ sender: UIButton) {
        guard let player = player else { return }
        player.stop()
    }
    
    // MARK: - Functional Methods
    
    func SetImage(_ url: URL?) {
        if let url = url {
            let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
                if let data = data {
                    DispatchQueue.main.async {
                        self.coverImageView.image = UIImage(data: data)
                    }
                }
            }
            task.resume()
        }
    }
    
    func testGetSongs() {
        guard let data = NSDataAsset(name: "songs")?.data else {
            print("data not exist")
            return
        }
        do {
            let decoder = JSONDecoder()
            let result = try decoder.decode(SongResults.self, from: data)
            print(result)
        } catch {
            print(error)
        }
    }
    
}
