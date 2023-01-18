//
//  PhotosViewController.swift
//  Navigation
//
//  Created by Николай Игнатов on 13.01.2023.
//

import UIKit

class PhotosViewController: UIViewController {
    
//    private let collectionView: UICollectionView = {
//        let layout = UICollectionViewFlowLayout()
//        collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
//        return collectionView
//    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(collectionView)
    }
}
