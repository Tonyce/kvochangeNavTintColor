//
//  ViewController.swift
//  KVOLearn
//
//  Created by D_ttang on 16/1/6.
//  Copyright © 2016年 D_ttang. All rights reserved.
//

import Foundation
import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        tableView.addObserver(self, forKeyPath: "contentOffset", options: [NSKeyValueObservingOptions.New, NSKeyValueObservingOptions.Initial], context: nil)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    

    override func observeValueForKeyPath(keyPath: String?, ofObject object: AnyObject?, change: [String : AnyObject]?, context: UnsafeMutablePointer<Void>) {
//        print(keyPath)
        //print(change) //Optional(["new": NSPoint: {0, 94.5}, "kind": 1])
//        print(object)
        
        if (keyPath == "contentOffset") {

            print(tableView.contentOffset.y)
            let color = UIColor(red: 0, green: 0, blue: tableView.contentOffset.y / 100, alpha: 1.0)
            self.navigationController?.navigationBar.barTintColor = color
        }
    }

}

extension ViewController: UITableViewDataSource, UITableViewDelegate {
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 50
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("cell")! as UITableViewCell
        cell.textLabel?.text = "\(indexPath.row)"
        return cell
    }
}

