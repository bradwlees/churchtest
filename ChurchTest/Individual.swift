//
//  Individual.swift
//  ChurchTest
//
//  Created by Brad Lees on 7/31/17.
//  Copyright © 2017 Innovativeware. All rights reserved.
//

import UIKit

class Individual {
    
    var firstName: String
    var lastName: String
    var birthDate: Date
    var profileURL: String
    var forceSensitive: Bool = false
    var affiliation: String = ""
    
    
    var fullName: String {
        return "\(firstName) \(lastName)"
    }
    
    
    init(firstName: String, lastName: String, birthDate: Date, profileURL: String, forceSensitive: Bool, affiliation: String) {
        self.firstName = firstName
        self.lastName = lastName
        self.birthDate = birthDate
        self.forceSensitive = forceSensitive
        self.affiliation = affiliation
        self.profileURL = profileURL
    
    }
    
}
