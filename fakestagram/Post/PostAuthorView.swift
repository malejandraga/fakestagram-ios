//
//  Author.swift
//  fakestagram
//
//  Created by LuisE on 3/16/19.
//  Copyright © 2019 3zcurdia. All rights reserved.
//

import UIKit

@IBDesignable
class PostAuthorView: UIView {
    var author: Author!
    let avatarView: SVGView = SVGView()
    let label: UILabel = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupView()
    }
    
    func setupView() {
        
        label.text = author.name
        //avatarView.image =
        label.backgroundColor = UIColor.purple
        //avatarView.layer.cornerRadius = avatarView.frame.size.width / 2
        self.addSubview(label)
        //self.addSubview(avatarView)
        
        NSLayoutConstraint.activate([label.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 5), label.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: 5), label.topAnchor.constraint(equalTo: self.topAnchor, constant: 5), label.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: 5)])
        
        
        
        
    }
    
   
}
