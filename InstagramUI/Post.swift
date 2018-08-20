//
//  Media.swift
//  Moments
//
//  Created by Duc Tran on 11/5/16.
//
//

import UIKit

struct Post: Decodable
{
    var uid: String
   var username: String?
    var timeAgo: String?
     let id: String
    var caption: String?
    //var image: UIImage?
    var numberOfLikes: Int?
    var numberOfComments: Int?
    let authorName: String
    let authorPic: String
    var numberOfShares: Int?
    
    struct apiPost: Decodable{
        
        let uid: String
        let id: String
        let caption: String
        let date: String
        let authorName: String
        let authorPic: String
    }
    
    static func fetchPosts(completion: @escaping (_ result: [Post])->())
    {
        var posts = [Post]()
     
        let url = "http://graph.platestheapp.com/Plates/get/getGeneralPosts.php?code=eq789dzvtCMhKS6lBmnFLXyfrsPgkIJZ0RQH14V35cbYUNaGoxTiEDpAu2jO&userID=1502"
        
        print(url)
        let api_url = URL(string: url)
        URLSession.shared.dataTask(with: api_url!, completionHandler: { (data, response, error) -> Void in
            
            if error != nil {
                print(error)
                
            }
            
            do {
                
                let modeled = try JSONDecoder().decode([Post].self, from:data!)
                
                
                
                
                
                DispatchQueue.main.async(execute: { () -> Void in
                    completion(modeled)
                })
                
                
                
                
                
                
                
                
            } catch let err {
                print(err)
            }
            
        }) .resume()

    }
    
    
   
    
}



















