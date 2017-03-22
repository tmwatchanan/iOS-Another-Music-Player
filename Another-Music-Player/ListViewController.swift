//
//  ListViewController.swift
//  Another-Music-Player
//
//  Created by Tommie on 3/22/17.
//  Copyright © 2017 Watchanan. All rights reserved.
//

import UIKit

class ListViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var selectedRow = 1
    
    struct Song {
        var name: String
        var artist: String
        var lyrics: String
        var cover: String
    
        init(name: String, artist: String, lyrics: String, cover: String)
        {
            self.name = name
            self.artist = artist
            self.lyrics = lyrics
            self.cover = cover
        }
    }
    
    var SongList:[Song] = []
    let song1:Song = Song(name: "Hello", artist: "Adele", lyrics: "Lyrics", cover: "Hello")
    let song2:Song = Song(name: "ComeToMe", artist: "Avicii", lyrics: "Lyrics", cover: "ComeToMe")
    let song3:Song = Song(name: "ColdWater", artist: "Justin Bieber", lyrics: "Lyrics", cover: "ColdWater")
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        SongList.append(song1)
        SongList.append(song2)
     }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectedRow = indexPath.row
        performSegue(withIdentifier: "DetailSegueIdentifier", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "DetailSegueIdentifier" {
            let destView = segue.destination as! DetailViewController
            destView.name = SongList[selectedRow].name
            destView.artist = SongList[selectedRow].artist
            destView.lyrics = SongList[selectedRow].lyrics
            destView.cover = SongList[selectedRow].cover
        }
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return SongList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ListCell") as! MainTableViewCell
        cell.noLabel.text = String(indexPath.row + 1)
        cell.nameLabel.text = SongList[indexPath.row].name
        return cell
    }
    
    
    
    
    @IBAction func PressLogout(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
}
