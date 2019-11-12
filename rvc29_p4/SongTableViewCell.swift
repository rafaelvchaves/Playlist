//
//  SongTableViewCell.swift
//  rvc29_p4
//
//  Created by Rafael Chaves on 10/24/19.
//  Copyright © 2019 Rafael Chaves. All rights reserved.
//

import UIKit

class SongTableViewCell: UITableViewCell {
    
    var songNameLabel: UILabel!
    var artistNameLabel: UILabel!
    var albumNameLabel: UILabel!
    var dashLabel: UILabel!
    var songImageView: UIImageView!
    
    let padding: CGFloat = 8
    let labelHeight: CGFloat = 16
    let songImageLength: CGFloat = 40

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        songNameLabel = UILabel()
        addLabel(label: songNameLabel, fontSize: 14)
        artistNameLabel = UILabel()
        addLabel(label: artistNameLabel, fontSize: 12)
        albumNameLabel = UILabel()
        addLabel(label: albumNameLabel, fontSize: 12)
        dashLabel = UILabel()
        dashLabel.text = "-"
        addLabel(label: dashLabel, fontSize: 12)

        songImageView = UIImageView()
        songImageView.contentMode = .scaleAspectFit
        songImageView.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(songImageView)
        
        setupConstraints()
        
    }
    
    // Add label helper function.
    func addLabel(label: UILabel!, fontSize: CGFloat) {
        label.font = UIFont.systemFont(ofSize: fontSize)
        label.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(label)
    }
    
    func setupConstraints() {
        
        // Song Image Constraints.
        NSLayoutConstraint.activate([
            songImageView.widthAnchor.constraint(equalToConstant: songImageLength),
            songImageView.heightAnchor.constraint(equalToConstant: songImageLength),
            songImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: padding),
            songImageView.topAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.topAnchor, constant: 5)
        ])
        
        // Song Name Label Constraints.
        NSLayoutConstraint.activate([
            songNameLabel.leadingAnchor.constraint(equalTo: songImageView.trailingAnchor, constant: padding),
            songNameLabel.topAnchor.constraint(equalTo: songImageView.topAnchor, constant: 5)
        ])
        
        // Artist Name Label Constraints.
        NSLayoutConstraint.activate([
            artistNameLabel.leadingAnchor.constraint(equalTo: songNameLabel.leadingAnchor),
            artistNameLabel.topAnchor.constraint(equalTo: songNameLabel.bottomAnchor)
        ])
        
        // Dash Label Constraints.
        NSLayoutConstraint.activate([
            dashLabel.leadingAnchor.constraint(equalTo: artistNameLabel.trailingAnchor, constant: 3),
            dashLabel.topAnchor.constraint(equalTo: artistNameLabel.topAnchor)
        ])
        
        // Album Name Label Constraints.
        NSLayoutConstraint.activate([
            albumNameLabel.leadingAnchor.constraint(equalTo: dashLabel.trailingAnchor, constant: 3),
            albumNameLabel.topAnchor.constraint(equalTo: artistNameLabel.topAnchor)
        ])
    }
    
    // Set labels and images for a song.
    func configure(for song: Song) {
        songNameLabel.text = song.songName
        albumNameLabel.text = song.albumName
        artistNameLabel.text = song.artistName
        songImageView.image = UIImage(named: song.imageName)
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
