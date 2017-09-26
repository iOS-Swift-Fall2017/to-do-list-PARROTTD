//
//  DetailViewController.swift
//  To Do List
//
//  Created by Duncan Parrott on 9/24/17.
//  Copyright © 2017 Parrott. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    @IBOutlet weak var toDoField: UITextField!
    var toDoItem: String?
    @IBOutlet weak var saveBarButton: UIBarButtonItem!
    
    
    @IBOutlet weak var toDoNoteView: UITextView!
    
    var toDoNoteItem: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let toDoItem = toDoItem {
            toDoField.text = toDoItem
            self.navigationItem.title = "Edit To Do Item"
        } else {
            self.navigationItem.title = "New To Do Item"
        }
        if let toDoNoteItem = toDoNoteItem {
            toDoNoteView.text = toDoNoteItem
        }
        enableDissableSaveButton()
       toDoField.becomeFirstResponder()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "UnwindFromSave" {
            toDoItem = toDoField.text
            toDoNoteItem = toDoNoteView.text
        }
    }

    func enableDissableSaveButton() {
        if toDoField.text!.count > 0 {
            saveBarButton.isEnabled = true
        } else {
            saveBarButton.isEnabled = false
      }
    }
    
    @IBAction func toDoFieldChanged(_ sender: UITextField) {
       enableDissableSaveButton()
        }
    
    
    
    @IBAction func cancelPressed(_ sender: UIBarButtonItem) {
        let isPresentingInAddMode = presentingViewController is UINavigationController
        if isPresentingInAddMode {dismiss(animated: true, completion: nil)
            
        } else {navigationController?.popViewController(animated: true)}
    }
    

}
