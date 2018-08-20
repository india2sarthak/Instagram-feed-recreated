//
//  NewsFeedControllerTableViewController.swift
//  InstagramUI
//
//  Created by Sarthak Mishra on 20/06/18.
//  Copyright © 2018 Developers Academy. All rights reserved.
//

import UIKit

class NewsFeedControllerTableViewController: UITableViewController {

    
    var posts: [Post]?
    var isLoading = false
        struct storyboardConstants {
            
            static let postCell = "PostsCell"
            static let postHeaderCell = "PostsHeaderCell"
            static let postHeaderHeight: CGFloat =  57.0
            static let postCellHeight: CGFloat = 578.0
            
        }
    
    func fetchPosts()
    {
        Post.fetchPosts() { (result) -> () in
            
            
            self.posts = result
            self.tableView.reloadData()
            
        }
       
        
        
    }
        
    
    override func viewDidLoad() {
        super.viewDidLoad()

            self.fetchPosts()
        
        
            tableView.register(LoaderCell.self, forCellReuseIdentifier: "load")
            tableView.estimatedRowHeight = storyboardConstants.postCellHeight
            tableView.rowHeight = storyboardConstants.postCellHeight
            tableView.separatorColor = UIColor.clear
        
        
        
    }
}

extension NewsFeedControllerTableViewController
{
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        
        return 2
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    
        
        if(section == 0)
        {
            if let postsC  =  posts {
                
                return postsC.count
                
            }
            return 0
        }else if section == 1 && isLoading {
            return 1
        }
        return 0
        
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
      
        if(indexPath.section == 0) {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: storyboardConstants.postCell, for: indexPath) as! PostsCell
        tableView.rowHeight = storyboardConstants.postCellHeight
        cell.post = self.posts?[indexPath.row]//Error!
        return cell
        }else{
            let cell = tableView.dequeueReusableCell(withIdentifier: "load", for: indexPath) as! LoaderCell
          tableView.rowHeight = 50
            cell.textLabel?.text = "Loading"
            return cell
            
        }
        
    }
    
    
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {



        let cell = tableView.dequeueReusableCell(withIdentifier: storyboardConstants.postHeaderCell) as! PostsHeaderCell
        cell.posts = self.posts?[section]
        cell.backgroundColor = UIColor.white
        return cell
    }
    
   
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
    return storyboardConstants.postHeaderHeight
    }
    
    
    
}
let imageCache = NSCache<AnyObject, AnyObject>()

class CustomImageView: UIImageView {
    
    var imageUrlString: String?
    
    func loadImageUsingUrlString(urlString: String) {
        
        imageUrlString = urlString
        
        let url = NSURL(string: urlString)
        
        image = nil
        
        if let imageFromCache = imageCache.object(forKey: urlString as AnyObject) as? UIImage {
            self.image = imageFromCache
            return
        }
        
        let imageURL = URL(string: urlString as! String)
        
        
        DispatchQueue.global(qos: .background).async {
            
            if let imageData = try? Data(contentsOf: imageURL!) {
                let toCache  = UIImage(data: imageData)
                
                DispatchQueue.main.async(execute: { () -> Void in
                    
                    self.image = UIImage(data: imageData)
                    imageCache.setObject(toCache!, forKey: urlString as AnyObject) 
                    
                })
            }
        }
        
        
    }
    
}
class LoaderCell: UITableViewCell {
    
    
    
}
