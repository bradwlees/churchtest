//
//  DataManager.swift
//  ChurchTest
//
//  Created by Brad Lees on 7/31/17.
//  Copyright © 2017 Innovativeware. All rights reserved.
//
//The purpose of this class is to act as a buffer between the UI and WebService/Local Data


import Foundation
import SwiftyJSON





class DataManager {
    static let sharedManager = DataManager()
    var individualList: [Individual] = []
    var handler: (() -> Void)?
    
    
    func imageDownloaded(fileName: String) -> (Bool, UIImage) {
         let imageURL = documentsDirectory().appendingPathComponent(fileName)
         let fileMngr = FileManager.default
         if (fileMngr.fileExists(atPath: imageURL.path)){
            if let image = UIImage(contentsOfFile: imageURL.path) {
                return (true, image)
            }
        }
        return (false, UIImage())
        
    }
    
    func documentsDirectory() -> URL {
        let filePaths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        let documentsDirectory = filePaths[0]
        return documentsDirectory
    }
    
    func getUsers(handler: @escaping () -> Void) {
        
        let ws = ChurchWebService()
        self.handler = handler
        ws.startCall(endPoint: "https://edge.ldscdn.org/mobile/interview/directory", handler: { (responseJSON) in
            self.successfulWS(json: responseJSON)
        })

    }
    

    
    func successfulWS (json: JSON) {
        
        var individual: Individual
        
        if let items = json["individuals"].array {
            for item in items {
                
                guard let firstName = item["firstName"].string else {
                    print("No First Name")
                    return
                }
                
                guard let lastName = item["lastName"].string else {
                    print("No Last Name")
                    return
                }
                
                guard let affiliation = item["affiliation"].string else {
                    print("No First Name")
                    return
                }
                
                guard let forceSensitive = item["forceSensitive"].bool else {
                    print("No Force Sensitive")
                    return
                }
                
                guard let birthDate = item["birthdate"].string else {
                    print("No birth date")
                    return
                }
                
                guard let profilePicture = item["profilePicture"].string else {
                    print("No picture")
                    return
                }
                
               
                
                
                individual = Individual(firstName: firstName, lastName: lastName, birthDate: convertDate(stringDate: birthDate) as Date, profileURL: profilePicture, forceSensitive: forceSensitive, affiliation: affiliation)
                
                individualList.append(individual)
            }
        }
        
        if let handler = handler {
            handler()
        }
        
    }
    
    func convertDate(stringDate: String) -> NSDate {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        let date = dateFormatter.date(from:stringDate)
        let calendar = Calendar.current
        let components = calendar.dateComponents([.year, .month, .day, .hour], from: date!)
        let finalDate = calendar.date(from:components)
        return finalDate! as NSDate
        
    }
    
}
