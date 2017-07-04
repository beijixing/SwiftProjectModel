//
//  ViewController.swift
//  SwiftProjectModel
//
//  Created by horse on 2017/6/20.
//  Copyright © 2017年 zgl. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let title:UILabel = UILabel(frame: CGRect(x:100, y:20, width:200, height: 40));
        title.text = "Alamofire Test";
        title.textColor = UIColor.red;
        self.view.addSubview(title);
//        self.requestTest()
//        self.downloadTest()
//        self.uploadTest()
    }
    
    func requestTest() {
        let paramDic:Dictionary<String, Any> = ["userName":"张三", "password":"123456"];
        
        NetworkManager.request(urlStr: AppURL, parameters: paramDic) { (success, response) in
            if success {
                let dataDict: Dictionary<String, AnyObject> = response as! Dictionary<String, AnyObject>
                
                print("success1", dataDict["data"] ?? "");
            }else {
                print("failer", response);
            }
        }
        
        
        NetworkManager.request(urlStr: AppURL, method: "POST", parameters: paramDic) { (success, response) in
            if success {
                let dataDict: Dictionary<String, AnyObject> = response as! Dictionary<String, AnyObject>
                
                print("success2", dataDict);
            }else {
                print("failer", response);
                
            }
        }

    }
    
    func downloadTest() {
        let documentsURL = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0]
        let fileURL = documentsURL.appendingPathComponent("test.pdf")
        
        NetworkManager.download(urlStr: "http://127.0.0.1:80/tp5/public/downloadtest.pdf", destinationPath: fileURL) { (status, data) in
            if status {
                print("下载完成")
            }else {
                let progerss:Progress = data as! Progress
                print("下载进度：\(progerss.fractionCompleted)")
            }
        }
        
    }
    
    func uploadTest() {
        
        
        let fileURL = Bundle.main.url(forResource: "test7", withExtension: "mp4")
//        let fiePath = Bundle.main.path(forResource: "test7", ofType: "mp4")

        NetworkManager.upload(fileUrl: fileURL!, toUrl: "http://127.0.0.1:80/tp5/index.php/admin/user/upload") { (status, data) in
            if status {
                print("上传完成：\(data)")
            }else {
                print("上传失败：\(data)")
            }
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

