//
//  ViewController.swift
//  TableViewApp
//
//  Created by Parker Vines on 7/4/24.
//

import UIKit

class MainViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    
    @IBOutlet weak var tableView: UITableView!
    
    
    
    let schedule: [ScheduleItem] = [
        ScheduleItem(week: "Week 1", team: "Vs. Alabama A&M", imageName: "JordanHare", details: "Auburn to host the Alabama A&M Bulldogs for their season opener ", date:"Aug 31, 2024", time:"6:30PM CST"),
        ScheduleItem(week: "Week 2", team: "Vs. California", imageName: "JordanHare", details: "Auburn will host the California Golden Bears to complete there two game series", date: "Sep 7, 2024", time:"2:30PM CST"),
        ScheduleItem(week: "Week 3", team: "Vs. New Mexico", imageName: "JordanHare", details: "Auburn will host the New Mexico Lobos before the get into SEC play" , date: "Sep 14, 2024", time:"6:30PM CST"),
        ScheduleItem(week: "Week 4", team: "Vs. Arkansas", imageName: "JordanHare", details: "Auburn will host the Arkansas Razorbacks to kick off there SEC play", date: "Sep 21, 2024", time:"TBD"),
        ScheduleItem(week: "Week 5", team: "Vs. Oklahoma", imageName: "JordanHare", details: "The newly added Oklahoma Sooners will visit Auburn at Jordan Hare Stadium", date: "Sep 28, 2024", time:"TBD"),
        ScheduleItem(week: "Week 6", team: "@ Georgia", imageName: "Georgia", details: "Auburn will be on the road this wek for their first away game against their oldest rival, the Georgia Bulldogs", date: "Oct 5, 2025", time:"TBD"),
        ScheduleItem(week: "Week 7", team: "@ Missouri", imageName: "Missouri", details: "Auburn will be on the road again to take on the Missouri Tigers", date:"Oct 19, 2024", time:"TBD"),
        ScheduleItem(week: "Week 8", team: "@ Kentucky", imageName: "Kentucky", details: "For the third week in a row,the Auburn Tigers will be on the road to face the Kentucky Wildcats ", date:"Oct 26, 2024", time:"TBD"),
        ScheduleItem(week: "Week 9", team: "Vs. Vanderbilt", imageName: "JordanHare", details: "Auburn finally gets a break in their schdule by hosting the Vanderbilt Commodores", date:"Nov 2, 2024", time:"TBD"),
        ScheduleItem(week: "Week 10", team: "Vs. LA-Monroe", imageName: "JordanHare", details: "Auburn to host the Lousiana-Monroe Warhawks before their tough and final two game stretch", date:"Nov 16, 2024", time:"11:45AM CST"),
        ScheduleItem(week: "Week 11", team: "Vs. Texas A&M", imageName: "JordanHare", details: "Auburn will host the Texas A&M Aggies as it get set to finish off the season", date:"Nov 23, 2024", time:"TBD"),
        ScheduleItem(week: "Week 12", team: "@ Alabama", imageName: "Alabama", details: "The Auburn Tigers will be on the road for their final regular season matchup against their most hated rival, The Alabama Crimson Tide", date:"Nov 30, 2024",time:"TBD")
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        tableView.backgroundView = UIImageView(image: UIImage(named: "ScheduleBackground"))
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return schedule.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CustomCell", for: indexPath) as! CustomTableViewCell
        let item = schedule[indexPath.row]
        cell.weekLabel.text = "\(item.week); \(item.team)"
        return cell
    }
    
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showDetail" {
            print("Segue identifier matches")
            
            if let indexPath = tableView.indexPathForSelectedRow {
                let selectedItem = schedule[indexPath.row]
                print("Selected item: \(selectedItem)")
                
                let destinationVC = segue.destination as! SecondaryViewController
                destinationVC.week = selectedItem.week
                destinationVC.team = selectedItem.team
                destinationVC.backgroundImageName = selectedItem.imageName
                destinationVC.detailText = selectedItem.details
                destinationVC.date = selectedItem.date
                destinationVC.time = selectedItem.time
                print("Passing data: \(selectedItem)")
            }
        } else {
            print("Error: Segue identifier does not match")
        }
    }
}
