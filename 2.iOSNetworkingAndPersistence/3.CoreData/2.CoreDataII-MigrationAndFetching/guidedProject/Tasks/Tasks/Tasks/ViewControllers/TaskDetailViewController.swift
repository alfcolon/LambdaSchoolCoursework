//
//  TaskDetailViewController.swift
//  Tasks
//
//  Created by alfredo on 2/14/20.
//  Copyright © 2020 Alfredo. All rights reserved.
//

import UIKit

class TaskDetailViewController: UIViewController {

    // MARK: - IBOutlets
    
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var notesTextView: UITextView!
    @IBOutlet weak var priorityControl: UISegmentedControl!
    
    // MARK: - Properties
    
    var task: Task? { didSet { updateViews() } }
    
    // MARK: - View Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateViews()
    }
    
    // MARK: - IBActions
    
    @IBAction func saveTask(_ sender: Any) {
        guard let name = self.nameTextField.text else { return }
        guard !name.isEmpty else { return }

        let notes = notesTextView.text
        
        //collect the appropiate priority
        let priorityIndex = self.priorityControl.selectedSegmentIndex
        let priority = TaskPriority.allPriorites[priorityIndex]
        
        if let task = self.task {
            //Editing an existing task
            task.name = name
            task.notes = notes
            //Update priority user picked
            task.priority = priority.rawValue
        }
        else {
            //Creating new tasks
            let _ = Task(name: name, notes: notes, priority: priority)
        }

        //Save change
        do {
            let moc = CoreDataStack.shared.mainContext
            try moc.save() }
        catch {
            print("Error saving managed object context:\(error)")
        }
        navigationController?.popViewController(animated: true)
    }
    
    // MARK: - Methods
    
    //Updating the task property
    //Update priority control index
    private func updateViews() {
        guard isViewLoaded else { return }

        title = self.task?.name ?? "Create Task"
        nameTextField.text = self.task?.name
        notesTextView.text = self.task?.notes
        
        //Setting the priority
        let priority: TaskPriority = self.task?.priority != nil ? TaskPriority(rawValue: self.task!.priority!)! : .normal
        
        priorityControl.selectedSegmentIndex = TaskPriority.allPriorites.firstIndex(of: priority) ?? 1
    }
    
}
