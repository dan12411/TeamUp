//
//  FouSetGoalTableViewController.swift
//  TeamUp
//
//  Created by 洪德晟 on 2016/11/12.
//  Copyright © 2016年 洪德晟. All rights reserved.
//

import UIKit
import Firebase
import Material

class FouSetGoalTableViewController: UITableViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    // MARK: Properties
    var goal: Goal?
    let ref = FIRDatabase.database().reference(withPath: "TeamUp-goals")
    @IBOutlet weak var fouTextLabel: UILabel!
    @IBOutlet weak var imageCollecView: UIView!
    @IBOutlet weak var collectionForImage: UICollectionView!
    
    var selectedImage: String?
    
    var imageArray = ["Study", "Weight","Bike", "Jog", "Swim", "Yoga"]
    
    @IBAction func sportImage(_ sender: UIButton) {
        imageArray = ["Study", "Weight","Bike", "Jog", "Swim", "Yoga"]
        collectionForImage.reloadData()
    }
    @IBAction func classImage(_ sender: UIButton) {
        imageArray = ["Basketball", "Swift", "ROR", "Hunter", "OnePiece", "Hunter"]
        collectionForImage.reloadData()
    }
    @IBAction func workImage(_ sender: UIButton) {
        imageArray = ["Avengers", "Avengers", "Avengers", "Avengers", "Avengers", "Avengers"]
        collectionForImage.reloadData()
    }
    @IBAction func skillImage(_ sender: UIButton) {
        imageArray = ["OnePiece", "OnePiece","OnePiece", "OnePiece", "OnePiece", "OnePiece"]
        collectionForImage.reloadData()
    }
    @IBAction func habitImage(_ sender: UIButton) {
        imageArray = ["Avengers", "Avengers", "Avengers", "Avengers", "Avengers", "Avengers"]
        collectionForImage.reloadData()
    }
    
    // 回到主畫面
    @IBAction func backToViewController(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func back(_ sender: UIButton) {
        
        guard let image = selectedImage else {return}
        
        if var goal = goal {
            goal.image = image
            let goalItemRef = self.ref.childByAutoId()
            // 4. 存入項目(Use setValue(_:) to save data to the database)
            goalItemRef.setValue(goal.toAnyObject())
        }
        dismiss(animated: true, completion: nil)
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        print("goal4: ===================\(goal)=======================")
        self.fouTextLabel.text = "挑選適合的圖來當封面吧！"
        
        // Let's Go Button
        let nextButton = FlatButton(title: "Let's Go")
        nextButton.frame = CGRect(x: (self.tableView.frame.size.width / 2) - 50, y: (self.tableView.frame.size.height) * (3 / 4), width: 100, height: 40)
        nextButton.titleLabel?.font = UIFont(name: "STHeitiTC-Light", size: 20)
        nextButton.setTitleColor(UIColor(red: 57.0/255.0, green: 158.0/255.0, blue: 203.0/255.0, alpha: 1.0), for: .normal)
//        nextButton.setTitle("Let's Go", for: .normal)
//        nextButton.setTitle("", for: .highlighted)
        nextButton.addTarget(self, action: #selector(FouSetGoalTableViewController.back(_:)), for: UIControlEvents.touchUpInside)
        tableView.addSubview(nextButton)
        
        // Remove the title of the back button
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - UICollectionViewDataSource
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return imageArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! FouCollectionViewCell
        
        cell.myImage.image = UIImage(named: imageArray[indexPath.row])
        
        return cell
    }
    
    // MARK: - UICollectionViewDelegateFlowLayout
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let cellSize = CGSize(width: (imageCollecView.frame.width - 50) / 2, height: (imageCollecView.frame.width - 50) / 3)
        
        return cellSize
    }
    
    // MARK: - UICollectionViewDelegate
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        selectedImage = imageArray[indexPath.row]
        let cell = collectionForImage.cellForItem(at: indexPath) as! FouCollectionViewCell
        cell.alpha = 0.4
        cell.cellCheckImage.isHidden = false
    }

    // MARK: - TableViewDataSource

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return 1
    }
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 12.0
    }
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let header = UIView(frame: CGRect(x: 0, y: 16, width: self.tableView.frame.size.width, height: 12.0))
        let label = UILabel(frame: header.frame)
        label.textColor = UIColor.lightGray
        label.font = UIFont(name: "STHeitiTC-Light", size: 14)
        label.text = "4/4"
        label.frame = header.frame
        label.textAlignment = NSTextAlignment.center
        header.addSubview(label)
        
        return header
    }

    /*
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

        // Configure the cell...

        return cell
    }
    */

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    
    // MARK: - Navigation
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//       
//    }
    

}
