//
//  Home.swift
//  WATimer
//
//  Created by Cédric Bahirwe on 28/01/2021.
//

import SwiftUI
import UserNotifications


struct Home: View {
    
    @EnvironmentObject var data: TimerData
    
    var body: some View {
        ZStack {
            VStack {
                
                Spacer()
                
                ScrollView(.horizontal, showsIndicators: false, content: {
                    
                    // timer Buttons
                    
                    HStack(spacing: 20) {
                        
                        ForEach(1...6, id: \.self) { index in
                            
                            let time = index * 5
                            
                            Text("\(time)")
                                .font(.system(size: 45, weight: .heavy, design: .rounded))
                                .frame(width: 100, height: 100)
                                .background(data.time == time ?Color.pink : Color.green)
                                .foregroundColor(.white)
                                .clipShape(Circle())
                                .onTapGesture {
                                    data.time = time
                                    data.selectedTime = time
                                    
                                }
                        }
                    }
                    .padding()
                })
                .offset(y: 40)
                .opacity(data.buttonAnimation ? 0 : 1)
                
                
                Spacer()
                
                
                // Start Button
                Button(action: {
                    performNotifications()
                    withAnimation(Animation.easeIn(duration: 0.65)) {
                        data.buttonAnimation.toggle()
                    }
                    
                    withAnimation(Animation.spring(response: 0.5, dampingFraction: 0.8, blendDuration: 0.5).delay(0.6)) {
                        data.timerViewOffset  = 0
                    }
                }) {
                    Circle()
                        .fill(Color.pink)
                        .frame(width: 80, height: 80)
                }
                .padding(.bottom, 35)
                .disabled(data.time == 0)
                .opacity(data.time == 0 ? 0.6 : 1)
                .offset(y: data.buttonAnimation ? 300 : 0)
                
                
                
            }
            
            
            
            
            Color.pink
                .opacity(1.1 - Double(data.timerHeightChange / UIScreen.main.bounds.height) )
                .overlay(
                    
                    Text("\(data.selectedTime)")
                        .font(.system(size: 55, weight: .heavy, design: .rounded))
                        .foregroundColor(.white)
                )
                .frame(height: UIScreen.main.bounds.height - data.timerHeightChange)
                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .bottom)
                .edgesIgnoringSafeArea(.all)
                
                
                .offset(y: data.timerViewOffset)
            
        }
        
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.black.edgesIgnoringSafeArea(.all))
        .onReceive(Timer.publish(every: 1, on: .main, in: .common).autoconnect(), perform: { _ in
            if data.time != 0 && data.selectedTime  != 0  && data.buttonAnimation{
                data.selectedTime -= 1
                
                
                let progressHeight = UIScreen.main.bounds.height / CGFloat(data.time)
                
                let diff = data.time - data.selectedTime
                
                withAnimation(.default) {
                    data.timerHeightChange = CGFloat(diff) * progressHeight
                }
                
                if data.selectedTime == 0 {
                    data.resetView()
                }
            }
        })
        
        .onAppear {
            
            UNUserNotificationCenter.current().requestAuthorization(
                options: [.badge, .sound, .alert]) { (_, _) in
                
            }
            UNUserNotificationCenter.current().delegate = data
        }
        
    
    }
    
    func performNotifications() {
        let content = UNMutableNotificationContent()
        
        content.title = "WATimer"
        content.body = "Your set time has been finished !!!!."
        
        content.sound = .default
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: TimeInterval(data.time), repeats: false)
        
        
        let request = UNNotificationRequest(identifier: "WATimer", content: content, trigger: trigger)
        
        
        UNUserNotificationCenter.current().add(request) { (err) in
            
            if err != nil {
                print(err!.localizedDescription)
            }
        }
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
            .environmentObject(TimerData())
    }
}
