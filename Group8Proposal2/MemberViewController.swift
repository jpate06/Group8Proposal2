//
//  MemberViewController.swift
//  Group8Proposal2
//
//  Created by Pate, Jacob T. on 11/6/26.
//

import UIKit

class MemberViewController: UIViewController{
    
    var memberName: String?
    var memberRole: String?
    var memberNotes: String?
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var roleLabel: UILabel!
    @IBOutlet weak var notesLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Member Details"
        
        nameLabel.text = memberName
        roleLabel.text = memberRole
        notesLabel.text = memberNotes
    }
}
