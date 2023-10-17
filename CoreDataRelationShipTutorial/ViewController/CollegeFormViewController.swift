//
//  CollegeFormViewController.swift
//  CoreDataRelationShipTutorial
//
//  Created by Saahil Kaushal on 17/10/23.
//

import UIKit

class CollegeFormViewController: UIViewController {
   
    
    @IBOutlet weak var collegeName: UITextField!
    @IBOutlet weak var collegeAddress: UITextField!
    @IBOutlet weak var collegeCity: UITextField!
    @IBOutlet weak var collegeUniversity: UITextField!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        

       
    }
    
    @IBAction func collegeSaveBtn(_ sender: UIButton) {
        let collegeDict = ["CollegeName":collegeName.text,"CollegeAddress":collegeAddress.text,"CollegeCity":collegeCity.text,"CollegeUniversity":collegeUniversity.text]
        self.navigationController?.popViewController(animated: true)
          DatabaseHelper.shareInstance.saveCollegeData(collegeDict: collegeDict as! [String:String])
        
        
    }
   
    

}
