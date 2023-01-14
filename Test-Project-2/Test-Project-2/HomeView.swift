//
//  ViewController.swift
//  Test-Project-2
//
//  Created by Admin on 14/1/23.
//

import UIKit

class HomeView: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        tableView.delegate = self
        
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

