//
//  FilteredList.swift
//  CoreDataProject
//
//  Created by Travis Brigman on 2/19/21.
//  Copyright © 2021 Travis Brigman. All rights reserved.
//
import CoreData
import SwiftUI

struct FilteredList<T:NSManagedObject, Content:View>: View {
    var fetchRequest: FetchRequest<T>
    var singers: FetchedResults<T> {
        fetchRequest.wrappedValue
    }
    let content: (T) -> Content
    
    var body: some View {
        List(fetchRequest.wrappedValue, id: \.self) {
            singer in
            self.content(singer)
        }
    }
    
    init(filterKey: String, filterValue: String, @ViewBuilder content: @escaping (T) -> Content) {
        fetchRequest =  FetchRequest<T>(entity: T.entity(), sortDescriptors: [], predicate: NSPredicate(format: "%K BEGINSWITH %@", filterKey, filterValue))
        self.content = content
    }
}

