//
//  RepoCell.swift
//  DemoRxMvvm
//
//  Created by TranNgocTam on 12/26/17.
//  Copyright © 2017 TranNgocTam. All rights reserved.
//

import UIKit

class RepoCell: UITableViewCell {

        
    @IBOutlet private weak var nameLabel: UILabel!
    @IBOutlet private weak var descriptionLabel: UILabel!
    @IBOutlet private weak var starsCountLabel: UILabel!
    
    func setName(_ name: String) {
        nameLabel.text = name
    }
    
    func setDescription(_ description: String) {
        descriptionLabel.text = description
    }
    
    func setStarsCountTest(_ starsCountText: String) {
        starsCountLabel.text = starsCountText
    }
    
}
