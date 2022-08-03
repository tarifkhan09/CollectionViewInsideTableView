//
//  TableVC.swift
//  TableViewInsideCollectionView
//
//  Created by MD Tarif khan on 1/8/22.
//

import UIKit

class TableVC: UITableViewCell {

    @IBOutlet weak var collectionView: UICollectionView!
    var collectionViewObserver: NSKeyValueObservation?
    @IBOutlet weak var collectionViewHeightConstarint: NSLayoutConstraint!
    
    override func awakeFromNib() {
        super.awakeFromNib()

        addObserver()
        collectionView.delegate = self
        collectionView.dataSource = self
        let nib = UINib(nibName: "CollectionCV", bundle: nil)
        collectionView.register(nib, forCellWithReuseIdentifier: "CollectionCV")
    }
    
    override func layoutSubviews() {
          super.layoutSubviews()
          layoutIfNeeded()
    }
    
    func addObserver() {
         collectionViewObserver = collectionView.observe(\.contentSize, changeHandler: { [weak self] (collectionView, change) in
              self?.collectionView.invalidateIntrinsicContentSize()
              self?.collectionViewHeightConstarint.constant = collectionView.contentSize.height
              self?.layoutIfNeeded()
          })
      }
     deinit {
        collectionViewObserver = nil
     }
    
}


extension TableVC: UICollectionViewDelegate, UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 16
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CollectionCV", for: indexPath) as! CollectionCV
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
            let size = collectionView.frame.size
        return CGSize(width: size.width / 3.4, height: size.height / 3)
    }
}

