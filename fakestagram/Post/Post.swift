//
//  Post.swift
//  fakestagram
//
//  Created by LuisE on 3/16/19.
//  Copyright © 2019 3zcurdia. All rights reserved.
//

import Foundation
import UIKit


struct Post: Codable {
    let id: Int? // String?
    let title: String
    let imageURL: String?
    let author: Author?
    let likesCount: Int
    let commentsCount: Int
    let createdAt: String
    
    
    func load(_ image: @escaping (UIImage) -> Void){
        guard let urlString = imageURL, let url = URL(string: urlString) else {return}
            DispatchQueue.global(qos: .background).sync {
                if let data = try? Data(contentsOf: url), let img = UIImage(data:data) {
                    DispatchQueue.main.async {
                        image(img)
                    }
                }
            }
        }
    }
