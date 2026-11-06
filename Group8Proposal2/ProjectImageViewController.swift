//
//  ProjectImageViewController.swift
//  Group8Proposal2
//
//  Created by Pate, Jacob T. on 11/6/26.
//

import UIKit

class ProjectImageViewController: UIViewController {
    var imageTitle = "Project UI Preview"
    var imageName = "ProjectMockup"
    
    @IBOutlet weak var previewImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = imageTitle
        previewImageView.image = UIImage(named: imageName)
    }
}
