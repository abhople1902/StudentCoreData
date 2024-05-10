//
//  FormViewController.swift
//  StudentCoreData
//
//  Created by Ayush Bhople on 08/05/24.
//

import UIKit
import Foundation
import CoreData

class FormViewController: UIViewController {
    
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    let dataFilePath = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first?.appendingPathComponent("Students.plist")
    

    var branchListData = ["IT","CSE"]
    var branch: String = ""
    
    var studentData = StudentModel()
    var studentNameDataEntered: String = "No data"
    var studentRollDataEntered: Int = 0
    
    @IBOutlet weak var branchList: UIButton!
    
    
    @IBOutlet weak var studentName: UITextField!
    
    
    @IBOutlet weak var studentRoll: UITextField!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        studentName.returnKeyType = .next
        studentRoll.returnKeyType = .done
        
        studentName.delegate = self
        studentRoll.delegate = self
        
        setupPopUpButton()
    }
    
    
    func setupPopUpButton() {
        let popUpButtonClosure = { (action: UIAction) in
            if (action.title  == "IT") {
                self.studentData.storeBranch(section: "IT")
            } else if (action.title == "CSE") {
                self.studentData.storeBranch(section: "CSE")
            }
        }
//        let action = UIAction(title: "IT", handler: popUpButtonClosure)
//        action.title = "101"
        branchList.menu = UIMenu(children: [
            UIAction(title: "IT", handler: popUpButtonClosure),
            UIAction(title: "CSE", handler: popUpButtonClosure)
        ])
        branchList.showsMenuAsPrimaryAction = true
    }
    
    
    
    @IBAction func submitData(_ sender: UIButton) {
        studentData.storeValue(name: studentNameDataEntered, roll: studentRollDataEntered)
//        print(studentData.getBranch())
//        print(studentData.getName())
//        print(studentData.getRoll())
        let newStudent = Student(context: context)
        newStudent.name = studentData.getName()
        newStudent.roll = Int64(studentData.getRoll())
        newStudent.branch = studentData.getBranch()
        do {
            try context.save()
        } catch {
            print("Error : - \(error)")
        }
    }
    
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

//MARK: - UITextFieldDelegate

extension FormViewController: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        studentName.endEditing(true)
        studentRoll.endEditing(true)
        
        if (textField.accessibilityIdentifier == "NameStudent") {
            if let x = textField.text {
                studentNameDataEntered = x
            }
        }
        if (textField.accessibilityIdentifier == "RollStudent") {
            if let x = textField.text {
                studentRollDataEntered = Int(x) ?? 0
            }
        }
        print("Name: - \(studentNameDataEntered) , Roll: - \(studentRollDataEntered)")
        
        return true
    }
    
}
