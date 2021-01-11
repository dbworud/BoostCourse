//
//  CollectionViewController.swift
//  BoostCourse
//
//  Created by jaekyung you on 2021/01/11.
//

import UIKit

class CollectionViewController: UIViewController {
    
//    var numberOfCell: Int = 10
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    var friends: [Friend] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // FlowLayout
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.sectionInset = UIEdgeInsets.zero
        flowLayout.minimumLineSpacing = 10
        flowLayout.minimumInteritemSpacing = 10
        
        let halfWidth : CGFloat = UIScreen.main.bounds.width / 2
        
        flowLayout.estimatedItemSize = CGSize(width: halfWidth - 30, height: 90)
        self.collectionView.collectionViewLayout = flowLayout
    
        guard let data = NSDataAsset(name: "friends") else { return }
        do {
            friends = try JSONDecoder().decode([Friend].self, from: data.data)
        }catch {
            print(error)
        }
    
        collectionView.reloadData()
    }
}


extension CollectionViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.friends.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! FriendCollectionViewCell
        cell.nameAgeLabel.text = friends[indexPath.item].nameAndAge
        cell.addressLabel.text = friends[indexPath.item].fullAddress
        
        return cell
    }
    
//    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
//        self.numberOfCell += 1
//        collectionView.reloadData()
//    }
}


class FriendCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var nameAgeLabel: UILabel!
    
    @IBOutlet weak var addressLabel: UILabel!
    
}
