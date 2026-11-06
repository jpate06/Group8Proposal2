//
//  ProjectViewController.swift
//  Group8Proposal2
//
//  Created by Pate, Jacob T. on 11/6/26.
//

import UIKit

class ProjectViewController: UIViewController {
    
    var projectName: String?
    var projectDescription: String?
    
    @IBOutlet weak var projectNameLabel: UILabel!
    @IBOutlet weak var projectDescriptionLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Project Details"
        
        projectNameLabel.text = projectName
        projectDescriptionLabel.text = projectDescription
    }
}
