//
//  StudentListSingleton.swift
//  PairRandomizer
//
//  Created by Douglas Voss on 7/9/15.
//  Copyright (c) 2015 dougsapps. All rights reserved.
//

import UIKit

class StudentListSingleton: NSObject {
    static let sharedInstance = StudentListSingleton()
    var studentList : [String] = [String]()
    override init()
    {
        studentList.append("Doug Voss")
        studentList.append("Taylor Mott")
        studentList.append("Daniel Daylay")
        studentList.append("Peter Woodrow")
        studentList.append("Skyler Clark")
        studentList.append("Gama Tellez")
        studentList.append("Egan ?")
        //studentList.append("Cole ?")
    }
}
