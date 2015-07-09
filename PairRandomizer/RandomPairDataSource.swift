//
//  RandomPairDataSource.swift
//  PairRandomizer
//
//  Created by Douglas Voss on 7/9/15.
//  Copyright (c) 2015 dougsapps. All rights reserved.
//

import UIKit

class RandomPairDataSource: NSObject, UITableViewDataSource {
   
    let kCellId = "pair.list.cell.id"
    var pairingArray:[Pair] = [Pair]()
    
    override init()
    {
        super.init()
        randomizePairings()
    }
    
    func randRange (lower: Int , upper: Int) -> Int {
        return lower + Int(arc4random_uniform(UInt32(upper - lower + 1)))
    }
    
    func randomizePairings()
    {
        println("randomizePairings!")
        
        var thresh = StudentListSingleton.sharedInstance.studentList.count
        
        var studentArray = StudentListSingleton.sharedInstance.studentList

        pairingArray = [Pair]()
        
        while (studentArray.count > 0)
        {
            var newPair = Pair()
            var randIndex = randRange(0, upper: studentArray.count-1)
            newPair.name1 = studentArray[randIndex]
            studentArray.removeAtIndex(randIndex)
            
            if (studentArray.count == 0)
            {
                newPair.name2 = "Mentor"
            }
            else
            {
                randIndex = randRange(0, upper: studentArray.count-1)
                newPair.name2 = studentArray[randIndex]
                studentArray.removeAtIndex(randIndex)
            }
            pairingArray.append(newPair)
        }
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCellWithIdentifier(kCellId, forIndexPath: indexPath) as! UITableViewCell
        
        cell.textLabel!.text = pairingArray[indexPath.row].name1
        cell.detailTextLabel!.text = pairingArray[indexPath.row].name2
        cell.detailTextLabel!.textColor = UIColor.blackColor()

        return cell
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //return Int(round(CGFloat(pairingArray.count)/2.0))
        return pairingArray.count
    }
}
