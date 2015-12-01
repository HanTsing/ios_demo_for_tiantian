//
//  NewsListViewController.swift
//  News
//
//  Created by hanqing on 11/23/15.
//  Copyright © 2015 hanqing. All rights reserved.
//

import UIKit

class NewsListViewController: UITableViewController {
    
    var news: Array<NewsEntity> = []
    var role = "admin"

    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.tableFooterView = UIView()
        
        if role == "admin" {
            self.title = "推荐"
            initData("index")
        } else {
            self.title = "专题"
            initData("subject")
        }
        

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }
    
    func initData(type: String){
        if type == "index" {
            self.news.append(NewsEntity(title: "汪峰新曲《河流》MV", content: "汪峰新曲《河流》MV", image: "1",  time: "1/14/2015 1:33:37 PM", videoNum: "1"))
            self.news.append(NewsEntity(title: "冯小刚《牛三斤》", content: "冯小刚“惊艳”亮相 现场演唱《牛三斤》", image: "2",  time: "1/14/2015 1:33:37 PM", videoNum: "2"))
            self.news.append(NewsEntity(title: "泳儿《普通朋友》", content: "泳儿(QQ音乐巅峰对决第二季第5期)", image: "3",  time: "1/14/2015 1:33:37 PM", videoNum: "3"))
            self.news.append(NewsEntity(title: "实战短视频", content: "实战短视频—在线播放—优酷网", image: "4",  time: "1/14/2015 1:33:37 PM", videoNum: "4"))
            self.news.append(NewsEntity(title: "球王弧线完美一击", content: "球王弧线完美一击！梅西阿迪最新短视频广告", image: "5",  time: "1/14/2015 1:33:37 PM", videoNum: "5"))
        } else {
            self.news.append(NewsEntity(title: "Waveya - 4 Walls (舞蹈模仿)", content: "Waveya - 4 Walls (舞蹈模仿)", image: "1",  time: "1/14/2015 1:33:37 PM", videoNum: "6"))
            self.news.append(NewsEntity(title: "《小尘埃 - 慢活》", content: "《小尘埃 - 慢活》", image: "2",  time: "1/14/2015 1:33:37 PM", videoNum: "7"))
            self.news.append(NewsEntity(title: "泳儿《普通朋友》", content: "泳儿(QQ音乐巅峰对决第二季第5期)", image: "3",  time: "1/14/2015 1:33:37 PM", videoNum: "3"))
            self.news.append(NewsEntity(title: "实战短视频", content: "实战短视频—在线播放—优酷网", image: "4",  time: "1/14/2015 1:33:37 PM", videoNum: "4"))
            self.news.append(NewsEntity(title: "球王弧线完美一击", content: "球王弧线完美一击！梅西阿迪最新短视频广告", image: "5",  time: "1/14/2015 1:33:37 PM", videoNum: "5"))
        }
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return news.count
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("cells", forIndexPath: indexPath) as! NewsCellTableViewCell
        cell.titleLabel.text = news[indexPath.row].title
        cell.time.text       = news[indexPath.row].time
        cell.newsImag.image = UIImage(named: news[indexPath.row].image)
        return cell
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if (segue.identifier == "showDetail") {
            if let viewController: DetailViewController = segue.destinationViewController as? DetailViewController {
                let indexPath = self.tableView.indexPathForSelectedRow
                viewController.news = self.news[(indexPath?.row)!]
            }
        }
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
