//
//  NotificationViewController.swift
//  BoostCourse
//
//  Created by jaekyung you on 2021/01/12.
//

import Foundation

let DidReceiveStudentsNotification = Notification.Name("DidReceiveStudents")

func requestStudents() {
    guard let url = URL(string: "https://randomuser.me/api/?results=20&inc=name,email,picture") else { return }
    
    URLSession.shared.dataTask(with: url) { (data, response, error) in
        if let error = error {
            print(error.localizedDescription)
            return
        }
        
        guard let data = data else { return }
        
        do {
            let apiResponse : APIResponse = try JSONDecoder().decode(APIResponse.self, from: data)
            
            // 객체를 받아서 실어서 보냄
            NotificationCenter.default.post(name: DidReceiveStudentsNotification, object: nil, userInfo: ["students" : apiResponse.results])

        } catch(let error){
            print(error.localizedDescription)
        }
    }
    .resume()
}

