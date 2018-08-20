//
//  PostsCell.swift
//  InstagramUI
//
//  Created by Sarthak Mishra on 20/06/18.
//  Copyright © 2018 Developers Academy. All rights reserved.
//

import UIKit

class PostsCell: UITableViewCell {

    @IBOutlet weak var imagePosts: UIImageView!
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var captionLabel: UILabel!

    
    var post: Post! {
        didSet{ //When it gets set, update the ui
            
            self.updateUI()
        }
    }
    
    func updateUI()
    {
        
        //imagePosts.image = post.image
        DispatchQueue.main.async(execute: { () -> Void in
      
            let imagUrl = URL(string: self.post.uid)
        if let imageData = try? Data(contentsOf: imagUrl!) {
            
            self.imagePosts.image = UIImage(data: imageData)
            
        
        }
            
            
        })
        timeLabel.text = post.timeAgo
        captionLabel.text = post.caption
        
    }

}
