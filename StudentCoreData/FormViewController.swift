//
//  FormViewController.swift
//  StudentCoreData
//
//  Created by Ayush Bhople on 08/05/24.
//

import UIKit
import Foundation

class FormViewController: UIViewController {

    var branchListData = ["IT","CSE"]
    var branch: String = ""
    
    let actionClosure = { (action: UIAction) in
        print(action.title)
    }
    
    @IBOutlet weak var branchList: UIButton!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupPopUpButton()
//        let button = UIButton(primaryAction: nil)
//        
//        var menuChildren: [UIMenuElement] = []
//        for branch in branchList {
//            menuChildren.append(UIAction(title: branch, handler: actionClosure))
//        }
//        
//        button.menu = UIMenu(options: .displayInline, children: menuChildren)
//        
//        button.showsMenuAsPrimaryAction = true
//        button.changesSelectionAsPrimaryAction = true
//        
//        button.frame = CGRect(x: 150, y: 200, width: 100, height: 40)
//        self.view.addSubview(button)
    }
    
    
    func setupPopUpButton() {
        let popUpButtonClosure = { (action: UIAction) in
            if (action.title  == "IT") {
                print("IT")
            } else if (action.title == "CSE") {
                print("CSE")
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
    
    
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
