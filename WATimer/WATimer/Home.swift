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
                
                ScrollView(.horizontal, showsIndicators: false) {
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
                                    data.startTimer(time)
                                }
                        }
                    }
                    .padding()
                }
                .offset(y: 40)
                .opacity(data.buttonAnimation ? 0 : 1)
                
                Spacer()

                Button(action: data.scheduleNotification) {
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
            data.updateTimer()
        })
        .onAppear(perform: data.requestNotificationPermissions)
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
            .environmentObject(TimerData())
    }
}
