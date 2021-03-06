//
//  CoreDataManger.swift
//  AddressBook
//
//  Created by Tinh on 3/7/16.
//  Copyright © 2016 Seven. All rights reserved.
//

import UIKit
import CoreData

class CoreDataManger: NSObject {
    static let sharedInstance = CoreDataManger()
    var manageContext: NSManagedObjectContext {
        get{
            let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
            return appDelegate.managedObjectContext
        }
    }
    
    func addModelToCoreData(contact: (name: String, phoneNum: String,avatarImg: NSData, gender: String)) { // add
       let contacts = NSEntityDescription.insertNewObjectForEntityForName("ContactsInfo", inManagedObjectContext: manageContext)
        if !(contact.name.isEmpty || contact.phoneNum.isEmpty || contact.gender.isEmpty) {
            contacts.setValue(contact.name, forKey: "name")
            contacts.setValue(contact.phoneNum, forKey: "phoneNum")
            contacts.setValue(contact.avatarImg, forKey: "avatarImg")
            contacts.setValue(contact.gender, forKey: "gender")
        }
        do {
            try manageContext.save()
        } catch {
            fatalError("could not save \(error)")
        }
    }
    
    func queryModel(name: String?) -> [contactMo]{
        let fetchRequest = NSFetchRequest(entityName: "ContactsInfo")
        if let newName = name {
            let predicate = NSPredicate(format: "name = %@", newName)
            fetchRequest.predicate = predicate
        }
        do {
            let results = try manageContext.executeFetchRequest(fetchRequest)
            return (results as! [contactMo])
        } catch {
            fatalError("could not fetch \(error)")
        }
    }
    
    func deleteModelByName(name: String) {
        let fetchArr = queryModel(name)
        if fetchArr.count > 0 {
            for item in fetchArr {
                manageContext.deleteObject(item)
            }
            do {
                try manageContext.save()
            } catch let error as NSError {
                print("save fail: \(error)")
            }
        } else {
            print("not found!")
        }
    }
    
    func updateModel(name: String, contact: contactMo) {
        let fetchArr = queryModel(name)
        if fetchArr.count > 0 {
            for item in fetchArr {
                item.name = contact.name
                item.phoneNum = contact.phoneNum
                item.gender = contact.gender
                item.avatarImg = contact.avatarImg
            }
            do {
                try manageContext.save()
            } catch let error as NSError {
                print("save fail: \(error)")
            }
        } else {
            print("not found!")
        }
    }
}