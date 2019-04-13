//
//  ViewController.swift
//  ListAndGridviewUsingTableView
//
//  Created by Akash Padhiyar on 12/04/19.
//  Copyright © 2019 Akash Padhiyar. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
 
   var firstArray = ["1","2","3","4","5","6"]
    var secondArray = ["1","3","5",]
    var thirdArray = ["2","4","6"]
    var changevalue = true
    @IBAction func MySegmentAction(_ sender: Any) {
        if changevalue{
            changevalue = false
            MyTableView.reloadData()
        }
        else{
            changevalue = true
            MyTableView.reloadData()
        }
    }
    @IBOutlet weak var MySegment: UISegmentedControl!
    @IBOutlet weak var MyTableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        MyTableView.delegate = self
        MyTableView.dataSource = self
        MyTableView.reloadData()
        // Do any additional setup after loading the view.
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if changevalue == true{
           return firstArray.count
            
        }else
        {
            return secondArray.count
        }
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = MyTableView.dequeueReusableCell(withIdentifier: "MyCell")as! MyTableViewCell
        
        if changevalue{
            cell.MyLabel2.isHidden = true
            cell.MyLabel1.text = firstArray[indexPath.row]
           return cell
            
            
        }else{
            cell.MyLabel2.isHidden = false
            cell.MyLabel1.text = secondArray[indexPath.row]
            cell.MyLabel2.text = thirdArray[indexPath.row]
            
           return cell
            
        }
       
       
    }
    


}

