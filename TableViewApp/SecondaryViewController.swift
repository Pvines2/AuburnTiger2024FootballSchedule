//
//  SecondaryViewController.swift
//  TableViewApp
//
//  Created by Parker Vines on 7/4/24.
//
import UIKit

class SecondaryViewController: UIViewController {
    
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var detailLabel: UILabel!
    @IBOutlet weak var backgroundImageView: UIImageView!
        var week: String?
        var team: String?
        var backgroundImageName: String?
        var detailText: String?
        var date: String?
        var time: String?
            
    override func viewDidLoad() {
            super.viewDidLoad()
            
            print("Week: \(week ?? "nil")")
            print("Team: \(team ?? "nil")")
            print("Background Image: \(backgroundImageName ?? "nil")")
            print("Detail Text: \(detailText ?? "nil")")
            
            if let backgroundImageName = backgroundImageName {
                if let backgroundImage = UIImage(named: backgroundImageName) {
                    backgroundImageView.image = backgroundImage
                } else {
                    print("Error: Could not load image named \(backgroundImageName)")
                }
            } else {
                print("Background image name is nil")
            }
            dateLabel.text = "Date: \(date ?? "TBD")"
            timeLabel.text = "Time: \(time ?? "TBD")"
            detailLabel.text = detailText
        }
    }
