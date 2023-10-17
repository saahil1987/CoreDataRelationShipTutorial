//
//  DatabaseHelper.swift
//  CoreDataRelationShipTutorial
//
//  Created by Saahil Kaushal on 17/10/23.
//

import Foundation
import CoreData
import UIKit

class DatabaseHelper{
    static var shareInstance = DatabaseHelper()
    let context = (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer.viewContext
    
    
    func saveCollegeData(collegeDict:[String:String]){
        let college = NSEntityDescription.insertNewObject(forEntityName: "College", into: context!)as! College
        college.name = collegeDict["CollegeName"]
        college.address = collegeDict["CollegeAddress"]
        college.city = collegeDict["CollegeCity"]
        college.university = collegeDict["CollegeUniversity"]
        
        do{
            try context?.save()
        }catch{
            print("Data cannot save")
        }
        
    }
    
    func getCollegeData()->[College]{
       var college = [College]()
      let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "College")
        do{
            college = try context?.fetch(fetchRequest) as! [College]
        }catch{
            print("Data cannot be Fetched")
        }
        return college
        
        
    }
    func deleteCollegeData(index:Int)->[College]{
        var deleteCollegeData = getCollegeData()
        context?.delete(deleteCollegeData[index])
        deleteCollegeData.remove(at: index)
        do{
            try context?.save()
        }catch{
            print("Data cannot be deleted")
        }
        
       return deleteCollegeData
    }
    
    
    
}
