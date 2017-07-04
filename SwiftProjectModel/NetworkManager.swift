//
//  NetworkManager.swift
//  SwiftProjectModel
//
//  Created by horse on 2017/6/21.
//  Copyright © 2017年 zgl. All rights reserved.
//

import UIKit
import Alamofire
class NetworkManager: NSObject {
    
    //MARK: -
    /*
     
      - parameter urlStr: 请求的url地址
      - parameter method: 请求方法， 默认GET，
      - parameter parameters: 请求参数.
     
      - parameter resultCallback: 请求完成后的回调，第一个参数告诉调用处，是否成功请求到数据，第二个参数，请求到的数据。
     */
    class func request(urlStr:String,
                                 method:String = "GET",
                                 parameters:Dictionary<String, Any>,
                                 resultCallback:@escaping(Bool, AnyObject) ->()) {
        
        let tmpMethod = method.lowercased()
        var httpMethod:HTTPMethod = .get
        if tmpMethod == "post" {
            httpMethod = .post
        } else if tmpMethod == "put" {
            httpMethod = .put
        } else if tmpMethod == "delete" {
            httpMethod = .delete
        }
        
        Alamofire.request(urlStr, method:httpMethod, parameters:parameters).responseJSON{ response in
            if response.result.isSuccess {
                let json: Dictionary<String, AnyObject> = response.result.value as! Dictionary<String, AnyObject>;
                let code:String = json["code"] as! String
                if ( Int(code) == 1) {
                    resultCallback(true, json as AnyObject)
                }else {
                    resultCallback(false, json as AnyObject)
                }
            }else {
                debugPrint(response.result.error ?? "")
            }
        
        }
    }
    
    //MARK: -
    /*
     - parameter urlStr: 下载url地址
     - parameter parameters: 请求参数,默认为空.
     - parameter destinationPath: 下载成功后的文件存储路径.
     - parameter resultCallback: 下载过程回调。
     resultCallback(Bool, AnyObject) 参数说明：YES，下载完成，可以读取AnyObject下载数据，如果AnyObject为nil，则下载失败。NO，下载中，可以通过读取AnyObject获得下载进度数据
     */
    class func download(urlStr:String, parameters:Dictionary<String, Any> = [:], destinationPath:URL, resultCallback:@escaping(Bool, AnyObject) ->()) {
        
        let destination: DownloadRequest.DownloadFileDestination = { _, _ in
            return (destinationPath, [.removePreviousFile, .createIntermediateDirectories])
        }
        
        Alamofire.download(urlStr, parameters: parameters, to:destination)
        .downloadProgress { progress in
            resultCallback(false, progress)
        }.responseData { response in
            resultCallback(true, response.result.value as AnyObject)
        }
    }
    
    //MARK: -
    /*
     - parameter fileUrl: 上传文件的本地url地址
     - parameter data: 上传文件的 Data 数据,默认为空.
     - parameter resultCallback: 上传过程回调。
     resultCallback(Bool, AnyObject) 参数说明：YES，上传数据完成，可以读取AnyObject获得server返回数据，如果AnyObject为nil，则上传失败。NO，上传中，可以通过读取AnyObject获得上传进度数据
     */
    class func upload(fileUrl:URL = URL(string:"")!, data:Data = Data(), toUrl:String, resultCallback:@escaping(Bool, AnyObject) ->()) {
        Alamofire.upload(multipartFormData: { multipartFormData in
            if fileUrl.absoluteString.lengthOfBytes(using: String.Encoding(rawValue: String.Encoding.utf8.rawValue)) > 0 {
                //服务端用参数file 读取上传文件
                multipartFormData.append(fileUrl, withName: "file")
                //根据文件路径上传数据
            }else {
                //根据data 上传数据
                multipartFormData.append(data, withName: "file")
            }
        }, to: toUrl,
           encodingCompletion: { encodingResult in
            switch encodingResult {
            case .success(let upload, _, _):
                upload.responseJSON { response in
                    resultCallback(true,response.result.value as AnyObject)
                }
            case .failure(let encodingError):
                resultCallback(false, encodingError as AnyObject)
            }
        })
    }
    
}
