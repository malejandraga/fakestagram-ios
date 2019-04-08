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
        
        label.text = "Nombre,,,,,,,,,,,,,,,"  //author.name
        label.backgroundColor = UIColor.purple

        
        self.addSubview(label)
        
        label.anchors(top: self.topAnchor, trailing: self.trailingAnchor, leading: self.leadingAnchor, botton: self.bottomAnchor, padding: UIEdgeInsets(top: 5, left: 5, bottom: 5, right: 5))
        
        avatarView.backgroundColor = .black
        self.addSubview(avatarView)
        
        avatarView.dimensionAnchors(height: self.heightAnchor, width: self.heightAnchor)
        
        avatarView.anchors(top: self.topAnchor, trailing: label.leadingAnchor, leading: self.leadingAnchor, botton: self.bottomAnchor)
        
        avatarView.layer.cornerRadius = avatarView.frame.size.width / 2
    }
}
