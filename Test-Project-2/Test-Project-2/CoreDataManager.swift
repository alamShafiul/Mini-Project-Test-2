//
//  CoreDataManager.swift
//  Test-Project-2
//
//  Created by Admin on 14/1/23.
//

import Foundation
import CoreData

class CoreDataManager {
    static let shared = CoreDataManager()
    private init() {}
    
    var newses = [NewsTable]()
    let context = AppDelegate.shared.persistentContainer.viewContext
    
    func getData(category: String?) {
        do {
            let request = NSFetchRequest<NewsTable>(entityName: "NewsTable")
            if let category = category {
                let predicate = NSPredicate(format: "category == %@", category)
                request.predicate = predicate
            }            
            newses = try context.fetch(request)
        }
        catch {
            print(error)
        }
    }
    
    func addData(newsModel: NewsModel) {
        let newRow = NewsTable(context: context)
        newRow.heading = newsModel.heading
        newRow.details = newsModel.details
        newRow.category = newsModel.category
        
        do {
            try context.save()
            newses.append(newRow)
        }
        catch {
            print(error)
        }
    }
    
    func updateData(newsModel: NewsModel, indexPath: IndexPath) {
        let existedRow = newses[indexPath.row]
        existedRow.heading = newsModel.heading
        existedRow.details = newsModel.details
        existedRow.category = newsModel.category
        
        do{
            try context.save()
        }
        catch {
            print(error)
        }
    }
    
    func deleteData(indexPath: IndexPath) {
        let existedRow = newses[indexPath.row]
        context.delete(existedRow)
        
        do{
            try context.save()
            newses.remove(at: indexPath.row)
        }
        catch {
            print(error)
        }
    }
}
