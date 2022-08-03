//
//  ViewController.swift
//  TableViewInsideCollectionView
//
//  Created by MD Tarif khan on 1/8/22.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }

    override func viewDidLayoutSubviews() {
            super.viewDidLayoutSubviews()
            tableView.reloadData()
    }

    func setup(){
        tableView.delegate = self
        tableView.dataSource = self
        
        let nib = UINib(nibName: "TableVC", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: "TableVC")
        
    }
    
    
}

extension ViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4

    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TableVC", for: indexPath) as! TableVC
        cell.collectionView.numberOfItems(inSection: 0)
        return cell
    }
}
