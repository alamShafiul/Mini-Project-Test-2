//
//  ViewController.swift
//  Test-Project-2
//
//  Created by Admin on 14/1/23.
//

import UIKit

class HomeView: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var collectionView: UICollectionView!
    
//    var prevIndex = IndexPath(row: 0, section: 0)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        tableView.delegate = self
        
        collectionView.dataSource = self
        collectionView.delegate = self
        
        
        
//        if let cell = collectionView.cellForItem(at: IndexPath(item: 0, section: 0)) as? customCVC {
//            cell.bgView.backgroundColor = .systemGray
//        }
        
        CoreDataManager.shared.getData(category: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if(segue.identifier == Constants.gotoAddSegue) {
            if let addPage = segue.destination as? AddPageVC {
                addPage.homeView = self
            }
        }
    }
    
    @IBAction func addBtnTapped(_ sender: Any) {
        performSegue(withIdentifier: Constants.gotoAddSegue, sender: nil)
    }
}

extension HomeView: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
extension HomeView: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return CoreDataManager.shared.newses.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Constants.tempCell, for: indexPath) as! customTVC
        
        cell.cellBGView.layer.cornerRadius = 10
        
        cell.labelOne.text = CoreDataManager.shared.newses[indexPath.row].heading
        cell.labelTwo.text = CoreDataManager.shared.newses[indexPath.row].details
        cell.labelThree.text = CoreDataManager.shared.newses[indexPath.row].category
        
        return cell
    }
}

extension HomeView: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return CatModel.categories.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Constants.collectionCell, for: indexPath) as! customCVC
        
        cell.catLabel.text = CatModel.categories[indexPath.row]
        
        return cell
    }
}

extension HomeView: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard let cell = collectionView.cellForItem(at: indexPath) as? customCVC else {
            return
        }
        cell.bgView.backgroundColor = .systemGray
//        cell.backgroundColor = .systemGray
        
//        if let prevCell = collectionView.cellForItem(at: prevIndex) as? customCVC {
//            prevCell.bgView.backgroundColor = .systemGray4
//            prevIndex = indexPath
//        }
        
        
        var str: String? = CatModel.categories[indexPath.row]
        if str == "EveryThing" {
            str = nil
        }
        CoreDataManager.shared.getData(category: str)
        tableView.reloadData()
    }
    
    func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
        guard let cell = collectionView.cellForItem(at: indexPath) as? customCVC else {
            return
        }
        cell.bgView.backgroundColor = .systemGray4
//        cell.backgroundColor = .systemGray4
    }
    
//    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
//        if indexPath.row == 0 {
//            cell.backgroundColor = .systemGray
//        }
//        else {
//            cell.backgroundColor = .systemGray4
//        }
//    }
}

