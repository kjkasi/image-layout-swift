//
//  ViewController.swift
//  image-layout
//
//  Created by Anton Minin on 01.12.15.
//  Copyright © 2015 Anton Minin. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    var image = Image();
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        //let myView = UIView(frame: CGRect(x: 0.0, y: 0.0, width: 200.0, height: 200.0));
        //myView.backgroundColor = UIColor.redColor();
        //self.view .addSubview(myView);
        
        image.width = 400
        image.height = 300
        
        //tableView.rowHeight = UITableViewAutomaticDimension
        //tableView.estimatedRowHeight = 160.0
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //MARK: - UITableViewDataSource
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        print("numberOfRowsInSection \(section)")
        
        return 1
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        print("cellForRowAtIndexPath \(indexPath.row)")
        
        let cellIdentifier = "cellIdentifier"
        
        var cell = tableView.dequeueReusableCellWithIdentifier(cellIdentifier)
        
        if (cell == nil) {
            cell = UITableViewCell(style: .Default, reuseIdentifier: cellIdentifier)
        }
        
        cell?.textLabel?.text = "test label"
        
        let size = CGSize(width: CGRectGetWidth((cell?.frame)!), height: 100)
        
        let resize = image.resize(size)
        
        let imageView  = UIView(frame: CGRect(x: 0, y: 0, width: resize.width, height: resize.height))
        
        imageView.backgroundColor = UIColor.redColor()
        
        imageView.center = cell!.center
        
        cell?.contentView.addSubview(imageView)
        
        return cell!
    }
    
    //MARK: - UITableViewDelegate
    
//    func tableView(tableView: UITableView, estimatedHeightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
//        
//        print("estimatedHeightForRowAtIndexPath \(indexPath.row)")
//        
//        let size = CGSize(width: CGRectGetWidth(view.frame), height: 100)
//        
//        let resize = image.resize(size)
//        
//        return 100.0
//    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        
        print("heightForRowAtIndexPath \(indexPath.row)")

        let size = CGSize(width: CGRectGetWidth(view.frame), height: 100)

        let resize = image.resize(size)

        return resize.height
    }

}

