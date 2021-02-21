//
//  Movie+CoreDataProperties.swift
//  CoreDataProject
//
//  Created by Travis Brigman on 2/16/21.
//  Copyright © 2021 Travis Brigman. All rights reserved.
//
//

import Foundation
import CoreData


extension Movie {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Movie> {
        return NSFetchRequest<Movie>(entityName: "Movie")
    }

    @NSManaged public var director: String?
    @NSManaged public var title: String?
    @NSManaged public var year: Int16

}
