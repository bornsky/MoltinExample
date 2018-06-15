//
//  ViewController.swift
//  MoltinEx
//
//  Created by John John on 5/6/18.
//  Copyright © 2018 John John. All rights reserved.
//

import UIKit
import Moltin

class CollectionViewController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    
    var productList: [Product]?
 
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = "Home"
        
        collectionView?.delegate = self
        collectionView?.dataSource = self
        collectionView?.backgroundColor = UIColor.white
        
        collectionView?.register(CollectionViewCell.self, forCellWithReuseIdentifier: "cellIndentifer")
        
        let query = MoltinQuery(offset: nil, limit: nil, sort: nil, filter: nil, include: [.main_image])
        
        Moltin.product.list(withQuery: query) { (result) in
            switch result {
                
            case .success(result: let response):
                
                DispatchQueue.main.async {
                    self.productList = response.products
                    print(self.productList!)
                    self.collectionView?.reloadData()
                }
                
            case .failure(error: let error):
                print(error)
            }
        }
    }
}

extension CollectionViewController {
    
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        
        return 1
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        if let counts = self.productList {
            
            return counts.count
        }
        
        return 0
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cellIndentifer", for: indexPath) as! CollectionViewCell
        
        if let products = self.productList {
            
            cell.nameTextView.text = products[indexPath.row].name
        }

        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: view.frame.width, height: 200)
    }
    
    
}



