//
//  SongTableViewController.swift
//  NetworkTest
//
//  Created by mikewang on 2020/3/1.
//  Copyright © 2020 mikewang. All rights reserved.
//

import UIKit
import AVFoundation

class SongTableViewController: UITableViewController {
    
    static let shared = SongTableViewController()
    
    var songs: [Song]?
    var songTitles:[String]?
    
    struct propertyKeys {
        static let SongCellName = "SongTableViewCell"
        static let SongCellId = "SongCell"
    }
    
    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let urlStr = "https://itunes.apple.com/search?term=swift&media=music"
        getSongJSON(urlStr)
        
        tableView.register(UINib(nibName: propertyKeys.SongCellName, bundle: nil), forCellReuseIdentifier: propertyKeys.SongCellId)
        
    }
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return songTitles?.count ?? 1
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        guard let titles = songTitles else { return "Any" }
        
        return titles[section]
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        guard let songs = songs, let titles = songTitles else { return 0 }
                
        let filterSongs = songs.filter { (song) -> Bool in
            song.artistName == titles[section].description
        }
        
        return filterSongs.count
    }
    
    private func configure(cell: SongTableViewCell, forItemAt indexPath: IndexPath) {
        guard let songs = songs, let titles = songTitles else { return }
        let filterSongs = songs.filter { (song) -> Bool in
            song.artistName == titles[indexPath.section].description
        }
        
        let song = filterSongs[indexPath.row]
        cell.song = song
        
        SongTableViewController.shared.fetImage(song.artworkUrl100) { (image) in
            guard let image = image else { return }
            DispatchQueue.main.async {
                if cell.song?.trackId == song.trackId {
                    let dateFormatter = DateFormatter()
                    dateFormatter.dateFormat = "yyyy/MM/dd"
                    let release = dateFormatter.string(from: song.releaseDate)
                    
                    cell.releaseLabel.text = release
                    cell.trackLabel.text = song.trackName
                    cell.coverImageView.image = image
                }
            }
        }
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: propertyKeys.SongCellId, for: indexPath) as! SongTableViewCell
        
        if songs != nil {
            configure(cell: cell, forItemAt: indexPath)
        }
        
        return cell
    }
    
    /*
     // Override to support conditional editing of the table view.
     override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
     // Return false if you do not want the specified item to be editable.
     return true
     }
     */
    
    /*
     // Override to support editing the table view.
     override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
     if editingStyle == .delete {
     // Delete the row from the data source
     tableView.deleteRows(at: [indexPath], with: .fade)
     } else if editingStyle == .insert {
     // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
     }
     }
     */
    
    /*
     // Override to support rearranging the table view.
     override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {
     
     }
     */
    
    /*
     // Override to support conditional rearranging of the table view.
     override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
     // Return false if you do not want the item to be re-orderable.
     return true
     }
     */
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    
    // MARK: - Functional Methods
    
    func getSongJSON(_ urlStr: String) {
        if let url = URL(string: urlStr) {
            URLSession.shared.dataTask(with: url) { (data, response, error) in
                let decoder = JSONDecoder()
                decoder.dateDecodingStrategy = .iso8601
                
                if let data = data, let songResults = try? decoder.decode(SongResults.self, from: data) {
                    self.songs = songResults.results.removingDuplicates()
                    
                    let groupedName = Dictionary(grouping: self.songs!, by: { $0.artistName })
                    self.songTitles = Array(groupedName.keys)
                                        
                    DispatchQueue.main.async {
                        self.tableView.reloadData()
                    }
                } else {
                    print("error")
                }
            }.resume()
        }
    }
    
    func fetImage(_ url: URL?, completionHandler: @escaping (UIImage?) -> Void) {
        if let url = url {
            URLSession.shared.dataTask(with: url) { (data, response, error) in
                if let data = data, let image = UIImage(data: data) {
                    completionHandler(image)
                } else {
                    completionHandler(nil)
                }
            }.resume()
        }
    }
    
}
