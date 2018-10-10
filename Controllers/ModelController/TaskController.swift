//
//  TaskController.swift
//  Task
//
//  Created by Xavier on 10/10/18.
//  Copyright © 2018 Xavier ios dev. All rights reserved.
// implement Crud

import Foundation
import CoreData

class TaskController {
    
    
    //Singleton || Shared instance
    static let shared = TaskController()
    
    //Source of truth
    var tasks: [Task]
    
    
//    {
        let request: NSFetchRequest<Task> = Task.fetchRequest()
        do{
//            return try CoreDataStack.context.fetch(request)
        }catch {
            print("There was an error in \(#function) ; \(error) ; \(error.localizedDescription)")
//    }
    
    
     init() {
        tasks = fetchTasks()
    }
    
    //Create
    func addTaskWith(name: String, due: Date, notes: String) {
        Task(name: name, notes: notes, due: due)
        saveToPersistenceStore()
    }
    
    //Update
    func updateTask(task: Task, newName: String, newNotes: String, Due: Date) {
        task.name = newName
        task.notes = newNotes
        saveToPersistenceStore()
    }
    
    //Delete
    func deleteTask(task: Task) {
        task.managedObjectContext?.delete(task)
        saveToPersistenceStore()
    }
    
    //MARK:Persistence
    
    func saveToPersistenceStore(){
        do{
            try CoreDataStack.context.save()
        }catch {
            print("There was an error in \(#function) ; \(error) ; \(error.localizedDescription) ")
    }
    
     func fetchTasks() -> [Task] {
        return mocTasks
    }
    
    
    func dateAsString(task: Task) -> String{
        func stringValue() -> String {
            let formatter = DateFormatter()
            formatter.dateStyle = .medium
            return formatter.date(from: self)
        }
    }
}
    
    var mocTasks: [Task] {
        get{
            let mocTask1 = Task(name: "Play basketball", notes: "With Nikes on", due: nil)
            let mocTask2 = Task(name: "Mow the lawn", notes: "Mow just the front and not the back", due: Date(timeInterval: 2000, since: Date()))
            return [mocTask1, mocTask2,mocTask1, mocTask2, mocTask1]
        }
    }






}
