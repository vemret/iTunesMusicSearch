//
//  MusicTableViewCell.swift
//  ITunes Search App
//
//  Created by Vahit Emre TELLİER on 19.12.2021.
//

import UIKit

class MusicTableViewCell: UITableViewCell {

    @IBOutlet weak var musicIMG: UIImageView!
    @IBOutlet weak var albumNameLabel: UILabel!
    @IBOutlet weak var artistNameLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
