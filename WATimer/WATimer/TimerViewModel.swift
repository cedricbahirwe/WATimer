//
//  TimerViewModel.swift
//  WATimer
//
//  Created by Cédric Bahirwe on 28/01/2021.
//

import Foundation
import SwiftUI
import UserNotifications


// Timer Model And Data...
class TimerData: NSObject, ObservableObject, UNUserNotificationCenterDelegate {
    @Published var time: Int = 0
    @Published var selectedTime: Int = 0
    
    @Published var buttonAnimation = false
    
    @Published var timerViewOffset: CGFloat = UIScreen.main.bounds.height
    
    @Published var timerHeightChange: CGFloat = 0
    
    @Published var leftTime: Date = Date()
    
    func userNotificationCenter(_ center: UNUserNotificationCenter, willPresent notification: UNNotification, withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
        completionHandler([.sound, .alert]) // banner
    }
    
    func userNotificationCenter(_ center: UNUserNotificationCenter, didReceive response: UNNotificationResponse, withCompletionHandler completionHandler: @escaping () -> Void) {
//        resetView()
        completionHandler()
        print("Called")
    }
    
    
    func  resetView() {
        withAnimation(.default) {
            time = 0
            selectedTime = 0
            timerHeightChange = 0
            timerViewOffset = UIScreen.main.bounds.height
            buttonAnimation = false
        }
    }
}
