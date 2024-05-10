//
//  StudentModel.swift
//  StudentCoreData
//
//  Created by Ayush Bhople on 09/05/24.
//

import Foundation

struct StudentModel {
    
    var storedStudentData : Data?
    var branch: String?
    
    mutating func storeBranch(section: String) {
        branch = section
    }
    
    mutating func storeValue(name: String, roll: Int) {
        storedStudentData = Data(branch: branch ?? "No data", name: name, roll: roll)
    }
    
    func getBranch() -> String {
        return storedStudentData?.branch ?? "No data"
    }
    
    func getRoll() -> Int {
        return storedStudentData?.roll ?? 0
    }
    
    func getName() -> String {
        return storedStudentData?.name ?? "No data"
    }
    
}
