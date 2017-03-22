//
//  DetailViewController.swift
//  Another-Music-Player
//
//  Created by Tommie on 3/22/17.
//  Copyright © 2017 Watchanan. All rights reserved.
//

import UIKit
import AVFoundation

class DetailViewController: UIViewController {
    
    var name: String = ""
    var artist: String = ""
    var lyrics: String = ""
    var cover: String = ""
    
    @IBOutlet weak var nameLabel: UINavigationItem!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var lyricsLabel: UILabel!
    
    var player = AVAudioPlayer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let audioPath = Bundle.main.path(forResource: name, ofType: "mp3")
        do {
            try player = AVAudioPlayer(contentsOf: URL(fileURLWithPath: audioPath!))
        }
        catch {
            // error
        }
        nameLabel.title = name
        imageView.image = UIImage(named: cover)
        lyricsLabel.text = lyrics
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func PressBack(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func Play(_ sender: Any) {
        player.play()
    }
    
    @IBAction func Pause(_ sender: Any) {
        player.pause()
    }
    @IBAction func Stop(_ sender: Any) {
        player.stop()
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
