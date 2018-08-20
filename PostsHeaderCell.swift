//
//  PostsHeaderCell.swift
//  InstagramUI
//
//  Created by Sarthak Mishra on 20/06/18.
//  Copyright © 2018 Developers Academy. All rights reserved.
//

import UIKit

class PostsHeaderCell: UITableViewCell {

    @IBOutlet weak var profileImage: UIImageView!
    
    @IBOutlet weak var nameLabel: UILabel!
    
    @IBOutlet weak var followButton: UIButton!
    
    
    
    var posts: Post! {
        
        didSet{
            
            self.updateUI()
            
        }
    }
    
    func updateUI()
    {
//       profileImage.image = posts.createdBy.profileImage
    // nameLabel.text = posts.authorName
        
        profileImage.layer.cornerRadius = profileImage.bounds.width / 2.0  //Circular Image
        profileImage.layer.masksToBounds = true
        
        followButton.layer.borderWidth = 1.0
        followButton.layer.cornerRadius = 2.0
        followButton.layer.borderColor = followButton.tintColor.cgColor
        followButton.layer.masksToBounds = true
    
        
    }
}
