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
    @Published private(set) var time: Int = 0
    @Published private(set) var selectedTime: Int = 0
    
    @Published private(set) var buttonAnimation = false
    
    @Published private(set) var timerViewOffset: CGFloat = UIScreen.main.bounds.height
    
    @Published private(set) var timerHeightChange: CGFloat = 0
    
    @Published private(set) var leftTime: Date = Date()

    func requestNotificationPermissions() {
        UNUserNotificationCenter.current().requestAuthorization(
            options: [.badge, .sound, .alert]) { (_, _) in

            }
        UNUserNotificationCenter.current().delegate = self
    }
    
    func userNotificationCenter(_ center: UNUserNotificationCenter, willPresent notification: UNNotification, withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
        completionHandler([.sound, .banner]) // banner
    }
    
    func userNotificationCenter(_ center: UNUserNotificationCenter, didReceive response: UNNotificationResponse, withCompletionHandler completionHandler: @escaping () -> Void) {
        completionHandler()
    }

    func startTimer(_ counter: Int) {
        time = counter
        selectedTime = counter
    }

    func setLeftTime(_ time: Date) {
        leftTime = Date()
    }

    func scheduleNotification() {
        let content = UNMutableNotificationContent()

        content.title = "WATimer"
        content.body = "Your set time has been finished !!!!."

        content.sound = .default
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: TimeInterval(time), repeats: false)

        let request = UNNotificationRequest(identifier: "WATimer", content: content, trigger: trigger)

        UNUserNotificationCenter.current().add(request) { (error) in
            if let error = error {
                print(error.localizedDescription)
                return
            }
        }

        withAnimation(Animation.easeIn(duration: 0.65)) {
            buttonAnimation.toggle()
        }

        withAnimation(Animation.spring(response: 0.5, dampingFraction: 0.8, blendDuration: 0.5).delay(0.6)) {
            timerViewOffset  = 0
        }
    }

    
    func updateTimer() {
        if time != 0 && selectedTime  != 0  && buttonAnimation {
            selectedTime -= 1

            let progressHeight = UIScreen.main.bounds.height / CGFloat(time)

            let diff = time - selectedTime

            withAnimation(.default) {
                timerHeightChange = CGFloat(diff) * progressHeight
            }

            if selectedTime == 0 {
                resetView()
            }
        }
    }

    private func resetView() {
        withAnimation(.default) {
            time = 0
            selectedTime = 0
            timerHeightChange = 0
            timerViewOffset = UIScreen.main.bounds.height
            buttonAnimation = false
        }
    }

    func checkTimerValidity() {
        if time != 0 {
            let diff = Date().timeIntervalSince(leftTime)


            let currentTime  = selectedTime - Int(diff)

            if currentTime >= 0 {
                withAnimation(.default) {
                    selectedTime = currentTime
                }
            } else {
                resetView()
            }
        }
    }
}
