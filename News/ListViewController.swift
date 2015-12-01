//
//  ListViewController.swift
//  News
//
//  Created by hanqing on 11/30/15.
//  Copyright © 2015 hanqing. All rights reserved.
//

import UIKit

class ListViewController: UIViewController,UITableViewDelegate,
UITableViewDataSource {
    

    var news: Array<NewsEntity> = []
    var role = "admin"

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var pageTitle: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.tableFooterView = UIView()
         self.navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(named: "return"), style: UIBarButtonItemStyle.Plain, target: self, action: "logout")
        
        if role == "admin" {
            self.title = "首页"
            self.pageTitle.text = "为您推荐"
            initData("index")
        } else {
            self.title = "专题"
            self.pageTitle.text = "今日主题"
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
    
    func logout(){
        let vc = self.storyboard?.instantiateViewControllerWithIdentifier("loginController") as! LoginViewController
        let nav = UINavigationController(rootViewController: vc) as UINavigationController
        self.presentViewController(nav, animated:true, completion:nil)
        //self.navigationController?.popViewControllerAnimated(true)
    }
    
    // MARK: - Table view data source
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return news.count
    }
    
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
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
    
    


}
