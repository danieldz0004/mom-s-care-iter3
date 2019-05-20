//
//  ViewController.swift
//  MonthProject
//
//  Created by Daniel Dz 24 on 2019/4/23.
//  Copyright © 2019 Daniel Dz 24. All rights reserved.
//

import UIKit
import PopupDialog

class SixthViewController: UITableViewController {
    
    var sections = sectionsData
    
    @IBAction func backToHome(_ sender: Any) {
        tabBarController?.selectedIndex = 2
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Auto resizing the height of the cell
        tableView.estimatedRowHeight = 44.0
        tableView.rowHeight = UITableView.automaticDimension
    }
    
}

//
// MARK: - View Controller DataSource and Delegate
//
extension SixthViewController {
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return sections.count
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sections[section].collapsed ? 0 : sections[section].items.count
    }
    
    // Cell
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: CollapsibleTableViewCell = tableView.dequeueReusableCell(withIdentifier: "cell") as? CollapsibleTableViewCell ??
            CollapsibleTableViewCell(style: .default, reuseIdentifier: "cell")
        
        let item: Item = sections[indexPath.section].items[indexPath.row]
        
        let underlineAttribute = [NSAttributedString.Key.underlineStyle: NSUnderlineStyle.single.rawValue]
        let underlineAttributedString = NSAttributedString(string: "\(item.name)", attributes: underlineAttribute)
        
        cell.nameLabel.attributedText = underlineAttributedString
        cell.detailLabel.text = item.detail
        
        if item.selected == 1 {
            cell.backgroundColor = UIColor(red: 108/255, green: 176/255, blue: 106/255, alpha: 1)
        }
        else{
            cell.backgroundColor = .white
        }
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    // Header
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        if section == 0{
            let header = tableView.dequeueReusableHeaderFooterView(withIdentifier: "header") as? CollapsibleTableViewHeader ?? CollapsibleTableViewHeader(reuseIdentifier: "header")
            
            header.titleLabel.text = NSLocalizedString("Tap on the age to explore", comment: "")
            header.titleLabel.textAlignment = .center
            header.titleLabel.font = UIFont.boldSystemFont(ofSize: 18)
            header.arrowLabel.text = ""
    
            return header
        }
        else{
            let header = tableView.dequeueReusableHeaderFooterView(withIdentifier: "header") as? CollapsibleTableViewHeader ?? CollapsibleTableViewHeader(reuseIdentifier: "header")
            
            header.titleLabel.text = sections[section].name
            header.arrowLabel.text = "V"
            header.setCollapsed(sections[section].collapsed)
            
            header.section = section
            header.delegate = self
            
            return header
        }
    }
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        if section == 0 {
            return 60
        }
        return 44.0
    }
    
    override func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 1.0
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        CancelButton.appearance().titleColor = .red
        
        let title = NSLocalizedString("\(sections[indexPath.section].items[indexPath.row].name)", comment: "")
        
        let image = UIImage.init(named: sections[indexPath.section].items[indexPath.row].image)
        
        // Create the dialog
        let popup = PopupDialog(title: title, message: nil, image: image, preferredWidth: 580)
        
        // Create first button
        let buttonOne = DefaultButton(title: NSLocalizedString("Mark Done", comment: "")) {
            self.sections[indexPath.section].items[indexPath.row].selected = 1
            self.tableView.reloadSections([indexPath.section], with: .none)
        }
        
        let buttonTwo = CancelButton(title: NSLocalizedString("Cancel", comment: "")) {
            self.sections[indexPath.section].items[indexPath.row].selected = 0
            self.tableView.reloadSections([indexPath.section], with: .none)
        }
        // Add buttons to dialog
        popup.addButtons([buttonOne, buttonTwo])
        // Present dialog
        self.present(popup, animated: true, completion: nil)
        
    }
    
    
}

//
// MARK: - Section Header Delegate
//
extension SixthViewController: CollapsibleTableViewHeaderDelegate {
    
    func toggleSection(_ header: CollapsibleTableViewHeader, section: Int) {
        let collapsed = !sections[section].collapsed
        
        // Toggle collapse
        sections[section].collapsed = collapsed
        header.setCollapsed(collapsed)
        
        tableView.reloadSections(NSIndexSet(index: section) as IndexSet, with: .automatic)
    }
    
}
