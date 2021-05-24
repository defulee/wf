//
//  NotificationJob.swift
//  wf
//
//  Created by defu.li on 2021/5/17.
//

import Foundation

import SwiftUI
import UserNotifications


class PostNotification: Job {
    var title: String
    var text: String
    
    
    init(id: String, title: String, text: String = "{query}", xpos: CGFloat = 0, ypos: CGFloat = 0) {
        self.title = title
        self.text = text
        
        super.init(id: id, type: .PostNotification, desc: "Post Notification", xpos: xpos, ypos: ypos)
    }
    
    override func exec(flowId: String, jobId: String, arg: String) -> String {
        print("PostNotification run...")
        
        // 1. 创建一个“通知实体” UNMutableNotificationContent
        let content = UNMutableNotificationContent()
        content.title = "wf Notification"
        content.body = arg
        content.sound = .default
        
        // 注意：
        //  如果程序当前处于活跃状态(foreground)，那么通知默认只出现在系统的“通知中心”，不会出现弹窗与声音。
        //  如果程序当前处于非活跃状态（background），那么通知会出现在系统的“通知中心” + 弹窗 + 声音。
        
        
        // 2. 创建一个“通知触发器”
        // UNCalendarNotificationTrigger        用来指定在特定的时间点触发消息推送
        // UNTimeIntervalNotificationTrigger    用来指定在特定的时间间隔触发消息推送
        // UNLocationNotificationTrigger        用来指定当设备 进入/离开 特定的地理位置时候触发消息推送
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 5, repeats: false)
        // 3. 创建一个 UNNotificationRequest 实例，代表一个“推送请求“
        // identifier 唯一标识该“推送请求”的字符串 ID。如果同一 ID 的“推送请求”还在等待推送，那就不会重复进入“等待推送的队伍”。
        // content 即上面创建的“通知实体”
        // trigger 即上面创建的“通知触发器”。trigger 可以设置为 nil，表示立即触发。
        let request = UNNotificationRequest(identifier: "wf.\(flowId).\(jobId)", content: content, trigger: trigger)
        
        
        // 4. 将“推送请求”添加到系统的通知中心（第一次还需要向用户获取推送通知的权限）
        let notificationCenter = UNUserNotificationCenter.current()
        
        // 弹出对话框，向用户请求推送通知的权限（如果已授权，则不会重复弹窗）
        // 如果用户拒绝的话，那么后续 add 到通知中心的“推送请求”都会被忽略。
        notificationCenter.requestAuthorization(options: [.alert, .sound, .badge]) { granted, error in
            // 这是一个逃逸闭包
        }
        
        // 将“推送请求”添加到系统的通知中心
        notificationCenter.add(request) { error in
            if error != nil {
                print("无法添加到系统通知中心: \(error!)")
            }
        }

        return "job return"
    }
}
