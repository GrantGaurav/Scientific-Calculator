//
//  HelpingFunctions.swift
//  ScientificCalculator
//
//  Created by Grant Gaurav on 2/27/18.
//  Copyright © 2018 Grant Gaurav. All rights reserved.
//

import Foundation

func factorial(_ fact:Double)-> Double {
    var i: Double = 1, temp: Double = 1
    while i <= fact {
        temp = temp * i
        i = i + 1
    }
    return temp
}
