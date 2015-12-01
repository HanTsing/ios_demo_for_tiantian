//
//  News.swift
//  News
//
//  Created by hanqing on 11/27/15.
//  Copyright © 2015 hanqing. All rights reserved.
//

import Foundation
class NewsEntity: NSObject{
    var title = ""
    var content = ""
    var time = ""
    var image = ""
    var videoNum = ""
    
    init(title: String, content: String, image: String, time: String, videoNum: String) {
        self.time = time
        self.title = title
        self.content = content
        self.image = image
        self.videoNum =  videoNum
    }
}