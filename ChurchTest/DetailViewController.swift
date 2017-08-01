//
//  DetailViewController.swift
//  ChurchTest
//
//  Created by Brad Lees on 7/31/17.
//  Copyright © 2017 Innovativeware. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var detailDescriptionLabel: UILabel!

    @IBOutlet weak var labelName: UILabel!
    @IBOutlet weak var switchForce: UISwitch!
    @IBOutlet weak var labelBirthdate: UILabel!
    @IBOutlet weak var imageIndividual: UIImageView!
    @IBOutlet weak var labelAffiliation: UILabel!
    
    var detailItem: Individual?

    func configureView() {
        // Update the user interface for the detail item.
        
        
        guard let individual = detailItem else {
            print("No Individual assigned")
            return
        }
        guard let labelAffiliation = labelAffiliation else {
            print("No Name Label Found")
            return
        }
        guard let labelBirthdate = labelBirthdate else {
            print("No Birthdate Label Found")
            return
        }
        guard let switchForce = switchForce else {
            print("No Force Switch Found")
            return
        }
        
        
        
        title = individual.fullName
        labelAffiliation.text = individual.affiliation.capitalized
        
        imageIndividual.imageFrom(link: individual.profileURL, contentMode: .scaleAspectFill)
        
        
    
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "mm-dd-yyyy"
        labelBirthdate.text = dateFormatter.string(from: individual.birthDate)
        
        switchForce.setOn(individual.forceSensitive, animated: false)
        switchForce.isEnabled = false
        
        
        
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        configureView()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    


}

