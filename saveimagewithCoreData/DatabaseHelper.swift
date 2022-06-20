//
//  DatabaseHelper.swift
//  saveimagewithCoreData
//
//  Created by Meghna on 20/06/22.
//

import Foundation
import  UIKit
import CoreData

class DatabaseHelper{
    static let instance = DatabaseHelper()
    let context  = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    
    func saveImageinCoreData(at imageData : Data){
        var profile = NSEntityDescription.insertNewObject(forEntityName: "Profile", into: context) as! Profile
        profile.img = imageData
        do {
            try context.save()
        }catch let error{
            print(error.localizedDescription)
        }
    }
    
    func getAllImages() -> [Profile]{
        var arrProfile = [Profile]()
        let featchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Profile")
        do{
            arrProfile = try context.fetch(featchRequest) as! [Profile]
        }catch let error{
            print(error.localizedDescription)
        }
        return arrProfile
    }
}
