//
//  CollegeListViewController.swift
//  CoreDataRelationShipTutorial
//
//  Created by Saahil Kaushal on 17/10/23.
//

import UIKit


class CollegeListViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    
    
    @IBOutlet weak var collegeTableView: UITableView!
    
    var college = [College]()
    
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collegeTableView.dataSource = self
        collegeTableView.delegate = self
        

      
    }
    override func viewWillAppear(_ animated: Bool) {
        college = DatabaseHelper.shareInstance.getCollegeData()
        self.collegeTableView.reloadData()
    }

   
    @IBAction func collegeBarBtn(_ sender: UIBarButtonItem) {
        let collegeVC = self.storyboard?.instantiateViewController(withIdentifier: "CollegeFormViewController")as! CollegeFormViewController
        self.navigationController?.pushViewController(collegeVC, animated: true)
        
        
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return college.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = collegeTableView.dequeueReusableCell(withIdentifier: "CollegeTableCell", for: indexPath)as! CollegeTableCell
        cell.collegeNameLbl.text = college[indexPath.row].name
        cell.collegeCityLbl.text = college[indexPath.row].city
        cell.collegeUniversityLbl.text = college[indexPath.row].university
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
    }
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete{
            college = DatabaseHelper.shareInstance.deleteCollegeData(index: indexPath.row)
            self.collegeTableView.deleteRows(at: [indexPath], with: .automatic)
        }
    }
    
}
