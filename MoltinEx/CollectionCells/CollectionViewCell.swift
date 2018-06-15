//
//  CollectionViewCell.swift
//  MoltinEx
//
//  Created by John John on 5/7/18.
//  Copyright © 2018 John John. All rights reserved.
//

import UIKit

class CollectionViewCell: UICollectionViewCell {
    
    let nameTextView: UITextView = {
        let textView = UITextView()
        textView.textColor = UIColor.black
//        label.frame = CGRect(x: 10, y: 100, width: 100, height: 100)
        textView.font = UIFont.boldSystemFont(ofSize: 18)
        textView.isEditable = false
        textView.isScrollEnabled = false
        textView.translatesAutoresizingMaskIntoConstraints = false
        textView.textAlignment = .center
        return textView
    }()
    
    let productImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.superViews()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        self.layer.cornerRadius = 1.5
        
        layer.shadowRadius = 2
        layer.shadowOpacity = 0.4
        layer.shadowOffset = CGSize(width: 3, height: 3)
        
        self.clipsToBounds = false
    }
    
    private func superViews() {
        
        contentView.addSubview(nameTextView)
//        contentView.addSubview(productImageView)
        
        backgroundColor = UIColor.white
        
//        productImageView.centerYAnchor.constraint(equalTo: self.contentView.centerYAnchor).isActive = true
//        productImageView.widthAnchor.constraint(equalToConstant: 100).isActive = true
//        productImageView.heightAnchor.constraint(equalToConstant: 100).isActive = true
//        nameTextView.topAnchor.constraint(equalTo: productImageView.bottomAnchor, constant: 10).isActive = true
        nameTextView.leftAnchor.constraint(equalTo: self.contentView.leftAnchor).isActive = true

    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("Error has occured")
    }

}
