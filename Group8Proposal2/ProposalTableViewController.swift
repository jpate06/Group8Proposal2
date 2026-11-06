//
//  ProposalTableViewController.swift
//  Group8Proposal2
//
//  Created by Pate, Jacob T. on 11/6/26.
//

import UIKit

class ProposalTableViewController: UITableViewController {
    let members = [
        ("Jacob Pate", "Programmer", "Jacob will work writing the code for the app. He will integrate the logic to move from screen to screen and implement the geometry formulas necessary for the app."),
        ("Tim Kurtz", "Visual Designer", "Tim will work on designing the UI. He will make sure it is easily accessible and easy to understand bt that user.")
    ]
    
    let projectComponents = [
        ("Component 1", "C1Description"),
        ("Component 2", "C2Description"),
        ("Component 3", "C3Description")
    ]
    
    let timeline = [
        ("Planning", "Conduct research for the project and establish our goals"),
        ("Design", "Create the app layout and design the user interface"),
        ("Development", "Build the app and implement the main features"),
        ("Testing", "Test the app, fix issues, and prepare the final version"),
    ]
    
    var selectedMember: (String, String, String)?
    var selectedProject: (String, String)?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Group 8 Proposal"
        
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 80
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 4
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section{
        case 0:
            return members.count
        case 1:
            return projectComponents.count
        case 2:
            return 1
        case 3:
            return timeline.count
        default:
            return 0
        }
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath)->UITableViewCell{
        if indexPath.section == 2{
            let cell = tableView.dequeueReusableCell(withIdentifier: "PreviewCell", for: indexPath) as! PreviewTableViewCell
            cell.previewTitleLabel.text = "Project UI Preview"
            cell.previewImageView.image = UIImage(named: "UIExample")
            
            cell.accessoryType = .disclosureIndicator
            
            return cell
        }
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "ProposalCell", for: indexPath)
        
        switch indexPath.section{
        case 0:
            cell.textLabel?.text = members[indexPath.row].0
            cell.detailTextLabel?.text = members[indexPath.row].1
            cell.accessoryType = .disclosureIndicator
        case 1:
            cell.textLabel?.text = projectComponents[indexPath.row].0
            cell.detailTextLabel?.text = projectComponents[indexPath.row].1
            cell.accessoryType = .disclosureIndicator
        case 3:
            cell.textLabel?.text = timeline[indexPath.row].0
            cell.detailTextLabel?.text = timeline[indexPath.row].1
            cell.accessoryType = .none
            cell.selectionStyle = .none
        default:
            break
        }
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int)-> String? {
        switch section {
        case 0:
            return "TEAM MEMBERS"
        case 1:
            return "PROJECT COMPONENTS"
        case 2:
            return "UI PREVIEWS"
        case 3:
            return "DEVELOPMENT TIMELINE"
        default:
            return nil
        }
    }
    
    override func tableView(_ tableView: UITableView, titleForFooterInSection section: Int)-> String? {
        switch section {
        case 0:
            return "Meet the development team"
        case 1:
            return "Explore our planned features"
        case 2:
            return "View the proposed application design"
        case 3:
            return "Our development roadmap"
        default:
            return nil
        }
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath){
        tableView.deselectRow(at:indexPath, animated: true)
        
        switch indexPath.section {
        case 0:
            selectedMember = members[indexPath.row]
            performSegue(withIdentifier: "ShowMember", sender: self)
        case 1:
            selectedProject = projectComponents[indexPath.row]
            performSegue(withIdentifier: "ShowProject", sender: self)
        case 2:
            performSegue(withIdentifier: "ShowImage", sender: self)
        default:
            break
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?){
        if segue.identifier == "ShowMember", let destination = segue.destination as? MemberViewController, let member = selectedMember{
            destination.memberName = member.0
            destination.memberRole = member.1
            destination.memberNotes = member.2
        }
        else if segue.identifier == "ShowProject", let destination = segue.destination as? ProjectViewController, let project = selectedProject{
            destination.projectName = project.0
            destination.projectDescription = project.1
        }
    }
    
}
