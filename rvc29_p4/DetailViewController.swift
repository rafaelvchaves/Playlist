//
//  DetailViewController.swift
//  rvc29_p4
//
//  Created by Rafael Chaves on 10/25/19.
//  Copyright © 2019 Rafael Chaves. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    
    var thisSong: Song
    
    var songNameStackView: UIStackView! = UIStackView()
    var albumNameStackView: UIStackView! = UIStackView()
    var artistNameStackView: UIStackView! = UIStackView()
    
    var songNameLabel: UILabel! = UILabel()
    var songNameTextField: UITextField! = UITextField()
    var songName: String
    
    var albumNameLabel: UILabel! = UILabel()
    var albumNameTextField: UITextField! = UITextField()
    var albumName: String
    
    var artistNameLabel: UILabel! = UILabel()
    var artistNameTextField: UITextField! = UITextField()
    var artistName: String
    
    weak var delegate: ChangeSongDetailsDelegate?

    init(song: Song) {
        self.thisSong = song
        self.songName = song.songName
        self.albumName = song.albumName
        self.artistName = song.artistName
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        addLabel(label: songNameLabel, text: "Song Name:", fontSize: 16)
        addLabel(label: albumNameLabel, text: "Album Name:", fontSize: 16)
        addLabel(label: artistNameLabel, text: "Artist Name:", fontSize: 16)

        addTextField(textfield: songNameTextField, text: songName)
        addTextField(textfield: albumNameTextField, text: albumName)
        addTextField(textfield: artistNameTextField, text: artistName)
        
        addStackView(stackview: songNameStackView, subviews: [songNameLabel, songNameTextField])
        addStackView(stackview: albumNameStackView, subviews: [albumNameLabel, albumNameTextField])
        addStackView(stackview: artistNameStackView, subviews: [artistNameLabel, artistNameTextField])
        
        let saveButton = UIBarButtonItem(title: "Save", style: .plain, target: self, action: #selector(saveAndExit))
        self.navigationItem.rightBarButtonItem  = saveButton
        
        setupConstraints()
    }
    
    func addLabel(label: UILabel, text: String, fontSize: CGFloat) {
        label.text = text
        label.font = UIFont.systemFont(ofSize: fontSize)
        label.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(label)
    }
    
    func addTextField(textfield: UITextField, text: String) {
        textfield.text = text
        textfield.font = UIFont.systemFont(ofSize: 16)
        textfield.sizeToFit()
        textfield.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(textfield)
    }
    
    func addStackView(stackview: UIStackView, subviews: [UIView]) {
        for view in subviews {
            stackview.addArrangedSubview(view)
        }
        stackview.axis = .horizontal
        stackview.translatesAutoresizingMaskIntoConstraints = false
        stackview.spacing = 10
        stackview.alignment = .lastBaseline
        view.addSubview(stackview)
    }
    
    func setupConstraints() {
        
        // Song Name Constraints
        NSLayoutConstraint.activate([
            songNameStackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            songNameStackView.topAnchor.constraint(equalTo: view.centerYAnchor, constant: -60),
        ])
        
        // Album Name Constraints
        NSLayoutConstraint.activate([
            albumNameStackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            albumNameStackView.topAnchor.constraint(equalTo: songNameStackView.bottomAnchor, constant: 10),
        ])
        
        // Artist Name Constraints
        NSLayoutConstraint.activate([
            artistNameStackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            artistNameStackView.topAnchor.constraint(equalTo: albumNameStackView.bottomAnchor, constant: 10),
        ])
    }
    
    @objc func saveAndExit() {
        if let text = songNameTextField.text, text != "" {
            delegate?.changeSongName(song: thisSong, to: text)
        }
        if let text = albumNameTextField.text, text != "" {
            delegate?.changeAlbumName(song: thisSong, to: text)
        }
        if let text = artistNameTextField.text, text != "" {
            delegate?.changeArtistName(song: thisSong, to: text)
        }
        navigationController?.popViewController(animated: true)
    }
    
}
