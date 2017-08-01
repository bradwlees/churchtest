//
//  ChurchWebService.swift
//  ChurchTest
//
//  Created by Brad Lees on 7/31/17.
//  Copyright © 2017 Innovativeware. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

class ChurchWebService: NSObject {
    
    var returnJSON: JSON = ""
    var completionBlock: ((JSON) -> Void)?
    
    func startCall(endPoint: String, handler: @escaping (JSON) -> Void ) -> Void {
        self.completionBlock = handler
        
        Alamofire.request(endPoint)
            .responseJSON { response in
                
                
                switch response.result {
                case .success(let data):
                    let json = JSON(data)
                    self.returnJSON = json
                    self.endCall()
                case .failure(let error):
                    print("Could not connect: \(error)")
                }
        }
    }
    
    func endCall() {
        
        if let completion = completionBlock {
            completion(returnJSON)
        } else {
            print("No Completion Block")
            
        }
        
    }


}
