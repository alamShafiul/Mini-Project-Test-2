//
//  AddPageVC.swift
//  Test-Project-2
//
//  Created by Admin on 14/1/23.
//

import UIKit

class AddPageVC: UIViewController {

    var homeView: HomeView?
    
    @IBOutlet weak var oneField: UITextField!
    @IBOutlet weak var twoField: UITextField!
    @IBOutlet weak var threeField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func submitBtnTapped(_ sender: Any) {
        
        if let heading = oneField.text, let details = twoField.text, let category = threeField.text {
            CoreDataManager.shared.addData(newsModel: NewsModel(heading: heading, details: details, category: category))
            homeView?.tableView.reloadData()
        }
        self.dismiss(animated: true)
    }
}
