//
//  DetailViewController.swift
//  News
//
//  Created by hanqing on 11/27/15.
//  Copyright © 2015 hanqing. All rights reserved.
//

import UIKit
import AVKit
import AVFoundation
import MediaPlayer
import MobileCoreServices

class DetailViewController: UIViewController, UITableViewDelegate,
UITableViewDataSource {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var desc: UILabel!
    @IBOutlet weak var videoView: UIView!
    @IBOutlet weak var commentsView: UITableView!
    @IBOutlet weak var bottomView: UIView!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var inputTextField: UITextField!
    
    var news: NewsEntity!
    var playerViewController : MPMoviePlayerController!
    var replies = ["喔，太棒了", "超级喜欢中国好声音 超级喜欢中国好声音", "超级喜欢中国好声音 超级喜欢中国好声音"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        playVideo()
        self.tableView.tableFooterView = UIView()
        self.inputTextField.layer.cornerRadius = 4.0
        self.inputTextField.layer.borderWidth  = 0.5
        self.inputTextField.layer.borderColor  = UIColor.clearColor().CGColor
        self.inputTextField.layer.borderColor  = UIColor(red: 51/255, green: 51/255, blue: 51/255, alpha: 1).CGColor
        self.titleLabel.text = news.title
        self.desc.text = news.content
        self.inputTextField.inputView = UIView(frame: CGRectZero)
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(named: "arrow-left"), style: UIBarButtonItemStyle.Plain, target: self, action: "goback")

        // Do any additional setup after loading the view.
    }
    

    func goback(){
        playerViewController.stop()
        self.navigationController?.popViewControllerAnimated(true)
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return replies.count
    }
    
    
     func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("detailCell", forIndexPath: indexPath) as! DetailTableViewCell
        cell.content.text = replies[indexPath.row]
        cell.avatar.layer.cornerRadius = cell.avatar.frame.size.width / 2
        cell.avatar.clipsToBounds = true
        return cell
    }
    


    private func playVideo() {
        let path = NSBundle.mainBundle().pathForResource(news.videoNum, ofType: "mp4")
        playerViewController = MPMoviePlayerController()
        playerViewController.contentURL = NSURL.fileURLWithPath(path!)
        //playerViewController.movieSourceType = MPMovieSourceType.Unknown
        playerViewController.view.frame = CGRect(x: self.videoView.frame.origin.x, y: self.videoView.frame.origin.y, width: self.view.frame.width, height: self.videoView.frame.height)

        playerViewController.scalingMode = MPMovieScalingMode.AspectFill
        //playerViewController.controlStyle = MPMovieControlStyle.Embedded
        playerViewController.shouldAutoplay = true
        playerViewController.prepareToPlay()
        
        self.videoView.addSubview(playerViewController.view)

    }

}
