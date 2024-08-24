//
//  Menu.swift
//  speaky
//
//  Created by lee on 8/29/22.
//

import Foundation
import UIKit

class Menu: UITableViewController {
    let voices:[Voice] = [Voice.fred, Voice.alex, Voice.nicki, Voice.aaron, Voice.samantha]
    
//    override func viewDidLoad() {
//        self.tableView.delegate = self
//
//        self.tableView.dataSource = self
//    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return voices.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        
        cell.textLabel?.text = "\(voices[indexPath.row])"
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let voice = voices[indexPath.row]
        
        let speaker = SpeakerPerson()
        
        speaker.voice = voice
        
        Model.shared.speaker = speaker
    }
}
