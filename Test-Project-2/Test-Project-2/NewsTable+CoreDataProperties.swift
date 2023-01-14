//
//  NewsTable+CoreDataProperties.swift
//  Test-Project-2
//
//  Created by Admin on 14/1/23.
//
//

import Foundation
import CoreData


extension NewsTable {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<NewsTable> {
        return NSFetchRequest<NewsTable>(entityName: "NewsTable")
    }

    @NSManaged public var heading: String?
    @NSManaged public var details: String?
    @NSManaged public var category: String?

}

extension NewsTable : Identifiable {
    
}
