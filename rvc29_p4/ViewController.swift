//
//  ViewController.swift
//  rvc29_p4
//
//  Created by Rafael Chaves on 10/24/19.
//  Copyright © 2019 Rafael Chaves. All rights reserved.
//

import UIKit

protocol ChangeSongDetailsDelegate: class {
    func changeSongName(song: Song, to newName: String)
    func changeArtistName(song: Song, to newName: String)
    func changeAlbumName(song: Song, to newName: String)
}

class ViewController: UIViewController {
    
    var tableView: UITableView!
    let reuseIdentifier = "songCellReuse"
    let cellHeight: CGFloat = 50
    var playlist: [Song]!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Playlist"
        view.backgroundColor = .white
        
        let gorgeous = Song(imageName: "MBDTF", songName: "Gorgeous", artistName: "Kanye West", albumName: "My Beautiful Dark Twisted Fantasy")
        let waves = Song(imageName: "TLOP", songName: "Waves", artistName: "Kanye West", albumName: "The Life of Pablo")
        let theshowgoeson = Song(imageName: "Lasers", songName: "The Show Goes On", artistName: "Lupe Fiasco", albumName: "Lasers")
        let canilive = Song(imageName: "RD", songName: "Can I Live", artistName: "Jay Z", albumName: "Reasonable Doubt")
        let papertrails = Song(imageName: "BDM", songName: "Paper Trail$", artistName: "Joey Bada$$", albumName: "B4.Da.$$")
        let walk = Song(imageName: "LplusW", songName: "Walk", artistName: "Kwabs", albumName: "Love + War")
        let righteousminds = Song(imageName: "1999", songName: "Righteous Minds", artistName: "Joey Bada$$", albumName: "1999")
        let psandqs = Song(imageName: "LUVTW", songName: "Ps & Qs", artistName: "Lil Uzi Vert", albumName: "Lil Uzi Vert vs. The World")
        let stargazing = Song(imageName: "ASTROWORLD", songName: "STARGAZING", artistName: "Travis Scott", albumName: "ASTROWORLD")
        let alive = Song(imageName: "MOTM", songName: "Alive (Nightmare)", artistName: "Kid Cudi", albumName: "Man On The Moon: The End Of Day")
        playlist = [gorgeous, waves, theshowgoeson, canilive, papertrails, walk, righteousminds, psandqs, stargazing, alive]
        
        tableView = UITableView()
        tableView.dataSource = self
        tableView.delegate = self
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.register(SongTableViewCell.self, forCellReuseIdentifier: reuseIdentifier)
        view.addSubview(tableView)
            
        setupConstraints()
    }

    func setupConstraints() {
        
        // Set Table View Constraints.
        NSLayoutConstraint.activate([
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
}

    extension ViewController: UITableViewDataSource {
        
        // Tell the table view how many rows should be in each section.
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return playlist.count
        }
        
        // Tell the table view what cell to display for each row.
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier, for: indexPath) as! SongTableViewCell
            let song = playlist[indexPath.row]
            cell.configure(for: song)
            cell.selectionStyle = .none
            return cell
        }
    }

    extension ViewController: UITableViewDelegate {
        
        // Tell the table view what height to use for each row.
        func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
            return cellHeight
        }
        
        // Tell the table view what should happen if we select a row.
        func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
            let song = playlist[indexPath.row]
            let viewController = DetailViewController(song: song)
            viewController.delegate = self
            navigationController?.pushViewController(viewController, animated: true)
        }
        
        // Tell the table view what should happen if we deselect a row.
        func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {}
        
        func tableView(_ tableView: UITableView,
                       trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration?
        {
            let modifyAction = UIContextualAction(style: .normal, title:  "Delete", handler: { (ac:UIContextualAction, view:UIView, success:(Bool) -> Void) in
                self.playlist.remove(at: indexPath.row)
                tableView.reloadData()
                success(true)
            })
            modifyAction.backgroundColor = .red
        
            return UISwipeActionsConfiguration(actions: [modifyAction])
        }
    }
    
    extension ViewController: ChangeSongDetailsDelegate {
        func changeSongName(song: Song, to newName: String) {
            song.songName = newName
            tableView.reloadData()
        }
        func changeArtistName(song: Song, to newName: String) {
            song.artistName = newName
            tableView.reloadData()
        }
        func changeAlbumName(song: Song, to newName: String) {
            song.albumName = newName
            tableView.reloadData()
        }
    }
    

