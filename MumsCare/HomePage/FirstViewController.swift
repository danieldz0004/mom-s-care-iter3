//
//  FirstViewController.swift
//  mom's care
//
//  Created by Daniel Dz on 4/4/19.
//  Localized by Siyu Zhang
//  Copyright © 2019 Daniel Dz. All rights reserved.
//
import FoldingCell
import UIKit

class FirstViewController: UITableViewController {
    
    enum Const {
        static let closeCellHeight: CGFloat = 179
        static let openCellHeight: CGFloat = 488
        static let rowsCount = 4
    }
    
    var buttonText = [NSLocalizedString("Vaccinate", comment: ""), NSLocalizedString("Track", comment: ""), NSLocalizedString("Connect", comment: ""), NSLocalizedString("Locate", comment: "") ]
    
    var expandImage = [UIImage(named: "test123"),UIImage(named: "home2"),UIImage(named: "home3"),UIImage(named: "home4")]
    
    var titleString = [NSLocalizedString("Vaccination Tracker", comment: ""), NSLocalizedString("Child Growth Milestones", comment: ""), NSLocalizedString("Suburb Finder", comment: ""), NSLocalizedString("Baby’s Day Out", comment: "")]
    
    var firstLabel = [NSLocalizedString("Find vaccination differences between Australia & China", comment: ""), NSLocalizedString("Explore baby development milestones", comment: ""),NSLocalizedString("Choose ideal suburb based on your preferences", comment: ""), NSLocalizedString("Find kindergartens nearby", comment: "")]
    
    var secondLabel = [NSLocalizedString("Know suburb's vaccination awareness status", comment: ""),NSLocalizedString("Maintain a digital checklist of your baby's growth", comment: ""),NSLocalizedString("Connect to the Chinese Community", comment: ""),NSLocalizedString("Find childcare centres nearby", comment: "")]
    
    var thirdLabel = [NSLocalizedString("Find vaccination centres near me", comment: ""),NSLocalizedString("Ensure baby is on the right track", comment: ""),NSLocalizedString("Explore nearby parks", comment: ""),NSLocalizedString("Ensure the child’s social and physical development", comment: "")]
    
    var cellHeights: [CGFloat] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    
    private func setup() {
        cellHeights = Array(repeating: Const.closeCellHeight, count: Const.rowsCount)
        tableView.estimatedRowHeight = Const.closeCellHeight
        tableView.rowHeight = UITableView.automaticDimension
        tableView.backgroundColor = UIColor(patternImage: #imageLiteral(resourceName: "background"))
        if #available(iOS 10.0, *) {
            tableView.refreshControl = UIRefreshControl()
            tableView.refreshControl?.addTarget(self, action: #selector(refreshHandler), for: .valueChanged)
        }
    }
    
    @objc func refreshHandler() {
        let deadlineTime = DispatchTime.now() + .seconds(1)
        DispatchQueue.main.asyncAfter(deadline: deadlineTime, execute: { [weak self] in
            if #available(iOS 10.0, *) {
                self?.tableView.refreshControl?.endRefreshing()
            }
            self?.tableView.reloadData()
        })
    }
}

// MARK: - TableView

extension FirstViewController {
    
    override func tableView(_: UITableView, numberOfRowsInSection _: Int) -> Int {
        return 4
    }
    
    override func tableView(_: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        guard case let cell as DemoCell = cell else {
            return
        }
        
        cell.backgroundColor = .clear
        
        
        if cellHeights[indexPath.row] == Const.closeCellHeight {
            cell.unfold(false, animated: false, completion: nil)
        } else {
            cell.unfold(true, animated: false, completion: nil)
        }
        
        cell.number = indexPath.row
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "FoldingCell", for: indexPath) as! DemoCell
        let durations: [TimeInterval] = [0.26, 0.2, 0.2]
        cell.durationsForExpandedState = durations
        cell.durationsForCollapsedState = durations
        cell.expandImage.image = expandImage[indexPath.row]
        
        cell.titleLabel.text = self.titleString[indexPath.row]
        
        cell.firstLabel.text = self.firstLabel[indexPath.row]
        cell.secondLabel.text = self.secondLabel[indexPath.row]
        cell.thirdLabel.text = self.thirdLabel[indexPath.row]
        
        cell.firstLabel.textAlignment = .center
        cell.firstLabel.center.x = self.view.center.x
        
        cell.secondLabel.textAlignment = .center
        cell.secondLabel.center.x = self.view.center.x
        
        cell.thirdLabel.textAlignment = .center
        cell.thirdLabel.center.x = self.view.center.x
        
        cell.findMoreButton.setTitle(buttonText[indexPath.row], for: .normal)

        cell.findMoreButton.tag = indexPath.row
        cell.findMoreButton.addTarget(self, action: #selector(findMore), for: .touchUpInside)
        return cell
    }
    
    @objc func findMore(sender: UIButton) {
        if sender.tag < 2 {
            tabBarController?.selectedIndex = sender.tag
        }
        if sender.tag >= 2 {
            tabBarController?.selectedIndex = sender.tag + 1
        }
    }
    
    override func tableView(_: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return cellHeights[indexPath.row]
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let cell = tableView.cellForRow(at: indexPath) as! FoldingCell
        
        if cell.isAnimating() {
            return
        }
        
        var duration = 0.0
        let cellIsCollapsed = cellHeights[indexPath.row] == Const.closeCellHeight
        if cellIsCollapsed {
            cellHeights[indexPath.row] = Const.openCellHeight
            cell.unfold(true, animated: true, completion: nil)
            duration = 0.5
        } else {
            cellHeights[indexPath.row] = Const.closeCellHeight
            cell.unfold(false, animated: true, completion: nil)
            duration = 0.8
        }
        
        UIView.animate(withDuration: duration, delay: 0, options: .curveEaseOut, animations: { () -> Void in
            tableView.beginUpdates()
            tableView.endUpdates()
            
            // fix https://github.com/Ramotion/folding-cell/issues/169
            if cell.frame.maxY > tableView.frame.maxY {
                tableView.scrollToRow(at: indexPath, at: UITableView.ScrollPosition.bottom, animated: true)
            }
        }, completion: nil)
        
    }
}
