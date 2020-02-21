//
//  TipsyBrian.swift
//  Tipsy
//
//  Created by Marwan Khalawi on 2/21/20.
//  Copyright © 2020 The App Brewery. All rights reserved.
//

import Foundation

struct TipsyBrian {
    let total: Double
    let tip: Double
    let splitNumber: Double
    
    func calculateTotal() -> Double{
        return (total + (total * tip)) / splitNumber
    }
    
}
