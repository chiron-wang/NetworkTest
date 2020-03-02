//
//  SongTableViewCell.swift
//  NetworkTest
//
//  Created by mikewang on 2020/3/1.
//  Copyright © 2020 mikewang. All rights reserved.
//

import UIKit
import AVFoundation

class SongTableViewCell: UITableViewCell {
    
    static let shared = SongTableViewCell()
    
    var song: Song?
    var player: AVAudioPlayer =  AVAudioPlayer()
    
    @IBOutlet weak var coverImageView: UIImageView!
    @IBOutlet weak var trackLabel: UILabel!
    @IBOutlet weak var releaseLabel: UILabel!
        
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    
    // MARK: - IBAction
    
    @IBAction func playButtonPressed(_ sender: UIButton) {
        guard let soundUrl = self.song?.previewUrl, let soundData = try? Data(contentsOf: soundUrl) else { return }
        
        do {
            SongTableViewCell.shared.player = try AVAudioPlayer(data: soundData)
            SongTableViewCell.shared.player.prepareToPlay()
            SongTableViewCell.shared.player.volume = 1.0
            SongTableViewCell.shared.player.play()
        } catch {
            print(error.localizedDescription)
        }
    }
    
    @IBAction func stopButtonPressed(_ sender: UIButton) {
        SongTableViewCell.shared.player.stop()
    }
    
}
