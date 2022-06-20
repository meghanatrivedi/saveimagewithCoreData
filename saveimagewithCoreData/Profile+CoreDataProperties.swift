//
//  Profile+CoreDataProperties.swift
//  saveimagewithCoreData
//
//  Created by Meghna on 20/06/22.
//
//

import Foundation
import CoreData


extension Profile {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Profile> {
        return NSFetchRequest<Profile>(entityName: "Profile")
    }

    @NSManaged public var img: Data?

}

extension Profile : Identifiable {

}
