//
//  ViewController.swift
//  StudentCoreData
//
//  Created by Ayush Bhople on 06/05/24.
//

import UIKit
import CoreData


class ViewController: UIViewController {
    
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
//    var studentArray = [Student]()
    
    let dataFilePath = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first?.appendingPathComponent("Students.plist")
    

    override func viewDidLoad() {
        super.viewDidLoad()
        print(dataFilePath!)
        
    }

    @IBAction func ITbuttonPressed(_ sender: UIButton) {
        let request: NSFetchRequest<Student> = Student.fetchRequest()
        print(FileManager.default.urls(for: .documentDirectory, in: .userDomainMask))
        // Do any additional setup after loading the view.
     
        do {
            let students = try context.fetch(request)
            if !students.isEmpty {
                for student in students {
                    if (student.branch! == "IT") {
                        print("Student Name: \(student.name!)")
                        print("Student Age: \(student.branch!)")
                        print("Student Roll: \(student.roll)")
                    }
                }
            } else {
                print("No students found.")
            }
        } catch {
            print("Error fetching students: \(error)")
        }
    }
    
    @IBAction func CSEbuttonPressed(_ sender: UIButton) {
//        let request = NSFetchRequest<NSManagedObject>(entityName: "Student")
        let request: NSFetchRequest<Student> = Student.fetchRequest()
        print(FileManager.default.urls(for: .documentDirectory, in: .userDomainMask))
        // Do any additional setup after loading the view.
     
        do {
            let students = try context.fetch(request)
            if !students.isEmpty {
                for student in students {
                    if (student.branch! == "CSE") {
                        print("Student Name: \(student.name!)")
                        print("Student Age: \(student.branch!)")
                        print("Student Roll: \(student.roll)")
                    }
                }
            } else {
                print("No students found.")
            }
        } catch {
            print("Error fetching students: \(error)")
        }
    }
    
    
    @IBAction func addData(_ sender: UIButton) {
        let newStudent = Student(context: context)
        newStudent.name = "Ayush Bhople"
        newStudent.roll = 28
        newStudent.branch = "CSE" // Change branch as needed
        do {
            try context.save()
        } catch {
            print("Error : - \(error)")
        }
    }
    
}

