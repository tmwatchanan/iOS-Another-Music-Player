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
    
    let tmpLyrics = "Hello, It's me I was wondering if after all these years you'd like to meet to go over everything They say that time's supposed to heal you But I ain't done much healing \n Hello, can you hear me? I'm in California dreaming about who we used to be When we were younger and free I've forgotten how it felt before the world fell at our feet There's such a difference between us And a million miles \n\n Hello from the other side I must've called a thousand times to tell you I'm sorry, for everything that I've done But when I call you never seem to be home \n\n Hello from the outside At least I can say that I've tried to tell you I'm sorry, for breaking your heart But it don't matter, it clearly doesn't tear you apart anymore \n\n Hello, how are you? It's so typical of me to talk about myself I'm sorry, I hope that you're well Did you ever make it out of that town Where nothing ever happened? It's no secret That the both of us are running out of time \n\n Hello from the other side I must've called a thousand times to tell you I'm sorry, for everything that I've done But when I call you never seem to be home \n\n Hello from the outside At least I can say that I've tried to tell you I'm sorry, for breaking your heart But it don't matter, it clearly doesn't tear you apart anymore \n\n Ooooohh, anymore \n Ooooohh, anymore \n Ooooohh, anymore \n Anymore \n\n Hello from the other side I must've called a thousand times to tell you I'm sorry, for everything that I've done But when I call you never seem to be home \n\n Hello from the outside At least I can say that I've tried to tell you I'm sorry, for breaking your heart But it don't matter, it clearly doesn't tear you apart anymore"
    
    var SongList:[Song] = []
    let song1:Song = Song(name: "Hello", artist: "Adele", lyrics: tmpLyrics, cover: "Hello")
    let song2:Song = Song(name: "ComeToMe", artist: "Avicii", lyrics: tmpLyrics, cover: "ComeToMe")
    let song3:Song = Song(name: "ColdWater", artist: "Justin Bieber", lyrics: "Lyrics", cover: "ColdWater")
    let song4:Song = Song(name: "WhereThemGirlsArt", artist: "David Guetta Feat Flo Rida & Nicki Minaj", lyrics: tmpLyrics, cover: "WhereThemGirlsAt")
    let song5:Song = Song(name: "BlowYourMind", artist: "Dua Lipa", lyrics: tmpLyrics, cover:"BlowYourMind")
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        SongList.append(song1)
        SongList.append(song2)
        SongList.append(song3)
        SongList.append(song4)
        SongList.append(song5)
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
