//
//  ExtensionUIViews.swift
//  fakestagram
//
//  Created by Maria Alejandra Gutierrez Ahumada on 4/7/19.
//  Copyright © 2019 3zcurdia. All rights reserved.
//

import Foundation
import UIKit

extension UIView {
    
    func anchors(top: NSLayoutYAxisAnchor?,
                trailing: NSLayoutXAxisAnchor?,
                leading: NSLayoutXAxisAnchor?,
                botton: NSLayoutYAxisAnchor?,
                padding: UIEdgeInsets = .zero,
                size: CGSize = .zero){
        
        translatesAutoresizingMaskIntoConstraints = false
        
        if let top = top{
            topAnchor.constraint(equalTo: top, constant: padding.top).isActive = true
        }
        
        if let leading = leading {
            leadingAnchor.constraint(equalTo: leading, constant: padding.top).isActive = true
        }
        
        if let trailing = trailing{
            trailingAnchor.constraint(equalTo: trailing, constant: -padding.right).isActive = true
        }
        
        if let botton = botton {
            bottomAnchor.constraint(equalTo: botton, constant: -padding.bottom).isActive = true
        }
        
        if size.width > 0 {
            widthAnchor.constraint(equalToConstant: size.width).isActive = true
        }
        
        if size.height > 0 {
            heightAnchor.constraint(equalToConstant: size.height).isActive =  true
        }
        
    }
    
    func dimensionAnchors(height: NSLayoutDimension?,
                          heightMultiplier: CGFloat = 1.0,
                          width: NSLayoutDimension?,
                          widthMultiplier: CGFloat = 1.0 ){
        
        translatesAutoresizingMaskIntoConstraints = false
        
        if let height = height {
            heightAnchor.constraint(equalTo: height, multiplier: heightMultiplier).isActive =  true
        }
        
        if let width = width {
            widthAnchor.constraint(equalTo: width, multiplier: widthMultiplier).isActive =  true
        }
    }
    
    func centrerAnchors(centerX: NSLayoutXAxisAnchor?,
                        centerY: NSLayoutYAxisAnchor?){
        
        translatesAutoresizingMaskIntoConstraints = false
        
        if let centerX = centerX {
            centerXAnchor.constraint(equalTo: centerX).isActive = true
        }
        
        if let centerY = centerY{
            centerYAnchor.constraint(equalTo: centerY).isActive = true
        }
    }
   
}
