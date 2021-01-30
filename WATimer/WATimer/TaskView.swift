//
//  TaskView.swift
//  WATimer
//
//  Created by Cédric Bahirwe on 30/01/2021.
//

import SwiftUI
extension Color {
    static let offWhite = Color(red: 225 / 255, green: 225 / 255, blue: 235 / 255)

}

struct TaskView: View {
    
    var body: some View {
        ZStack {
            Color(.secondarySystemBackground).edgesIgnoringSafeArea(.all)
            VStack(alignment: .leading, spacing: 8) {
                
                HStack {
                    Image(systemName: "chevron.left")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 15, height: 15)
                    Spacer()
                    
                    Button(action: {}, label: {
                        Image(systemName: "ellipsis")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .foregroundColor(.orange)
                            .rotationEffect(.radians(.pi/2))
                            .padding(8)
                            .frame(width: 30, height: 30)
                            .background(Color.white)
                            .cornerRadius(8)
                            .shadow(color: .offWhite, radius: 3, x: 0, y: 3)
                    })
                }
                VStack(alignment: .leading, spacing: -5) {
                    Text("Create")
                    Text("new task")
                }
                .font(.system(size: 32, weight: .bold))
                
                VStack(alignment: .leading, spacing: 10) {
                    
                    VStack(alignment: .leading, spacing: 0) {
                        Text("Task Title")
                            .foregroundColor(.gray)
                        TextField("Money App Design", text: .constant("Money App Design"))
                            .font(.system(size: 20, weight: .semibold, design: .default))
                            .foregroundColor(Color(.darkGray))
                        Color.gray.frame(height: 1)
                            .padding(.top, 5)
                    }
                                        
                    VStack(spacing: 12) {
                        HStack(spacing: 12) {
                            GridItem(title: "Date", subtitle: "10 AM", image: "calendar")
                            GridItem(color: Color.blue.opacity(0.9), title: "Time Zone", subtitle: "GMT+", image: "timelapse")
                        }
                        
                        HStack(spacing: 12) {
                            GridItem(color: Color.purple ,title: "Task Start", subtitle: "5.30 PM", image: "calendar")
                            GridItem(color: Color.green.opacity(0.7), title: "Task Start", subtitle: "11.30 PM", image: "clock.fill")
                        }
                    }
                }
                
                VStack(alignment: .leading, spacing: 8) {
                    Text("Description")
                        .font(.system(.callout, design: .rounded))
                        .fontWeight(.semibold)
                        .foregroundColor(Color(.darkGray))
                    Text("Join us in solving the challenges that Foody food industry is facing, Free of charge, Grow your networkf, get expert advice, and develop your business, Join The meeting.")
                        .foregroundColor(.gray)
                        .font(.caption)
                }
                
                VStack(alignment: .leading, spacing: 8) {
                    Text("Co-Worker")
                        .font(.system(.callout, design: .rounded))
                        .fontWeight(.semibold)
                        .foregroundColor(Color(.darkGray))
                    HStack {
                        HStack {
                            ForEach(0..<6) { i in
                                Image("\(i+1)")
                                    .resizable()
                                    .aspectRatio(contentMode: .fill)
                                    .frame(width: 30, height: 30)
                                    .clipShape(Circle())
                            }
                        }
                        Button(action: {}, label: {
                            Text("Invite More")
                                .font(.system(size: 14, weight: .semibold, design: .rounded))
                                .foregroundColor(.orange)
                                .frame(width: 100, height: 40)
                                .background(Color.orange.opacity(0.1))
                                .cornerRadius(8)
                        })
                    }
                }
                
                
                VStack(alignment: .leading, spacing: 8) {
                    Text("Category")
                        .font(.system(.callout, design: .rounded))
                        .fontWeight(.semibold)
                        .foregroundColor(Color(.darkGray))
                    
                    HStack {
                        Button(action: {}, label: {
                            Text("Food App")
                                .font(.system(size: 12, weight: .semibold, design: .rounded))
                                .foregroundColor(.orange)
                                .frame(width: 90, height: 35)
                                .background(Color.orange.opacity(0.1))
                                .cornerRadius(5)
                        })
                        
                        Button(action: {}, label: {
                            Text("Grocery App")
                                .font(.system(size: 12, weight: .semibold, design: .rounded))
                                .foregroundColor(.purple)
                                .frame(width: 90, height: 35)
                                .background(Color.purple.opacity(0.1))
                                .cornerRadius(5)
                        })
                        
                        Button(action: {}, label: {
                            Text("Travel App")
                                .font(.system(size: 12, weight: .semibold, design: .rounded))
                                .foregroundColor(.blue)
                                .frame(width: 90, height: 35)
                                .background(Color.blue.opacity(0.1))
                                .cornerRadius(5)
                        })
                        
                        Button(action: {}, label: {
                            Image(systemName: "plus")
                                .foregroundColor(.orange)
                                .frame(width: 35, height: 35)
                                .background(Color.white)
                                .clipShape(Circle())
                                .shadow(color: .offWhite, radius: 0.5)
                        })
                        .frame(maxWidth: .infinity)
                    }
                }
                
                
                Button(action: {}, label: {
                    Text("Create Task")
                        .foregroundColor(.white)
                        .font(.system(size: 18, weight: .semibold))
                        .frame(maxWidth: .infinity)
                        .frame(height: 48)
                        .background(
                            LinearGradient(gradient: Gradient(colors: [Color.orange.opacity(0.5), Color.red.opacity(0.7), Color.red.opacity(0.7)]), startPoint: /*@START_MENU_TOKEN@*/.leading/*@END_MENU_TOKEN@*/, endPoint: /*@START_MENU_TOKEN@*/.trailing/*@END_MENU_TOKEN@*/)
                        )
                        .cornerRadius(10)
                        .shadow(color: .offWhite, radius: 0.3)
                    
                })
                .padding(.top)
            }
            .padding()
        }

    }
}

struct TaskView_Previews: PreviewProvider {
    static var previews: some View {
        TaskView()
    }
}

struct GridItem: View {
    var color: Color = .orange
    let title: String
    let subtitle: String
    let image: String
    
    var body: some View {
        HStack {
            Image(systemName: image)
                .resizable()
                .padding(5)
                .frame(width: 20, height: 20)
                .background(color.opacity(0.1))
                .cornerRadius(5)
                .foregroundColor(color)
            
            VStack(alignment: .leading, spacing: 2) {
                Text(title)
                    .foregroundColor(.gray)
                    .font(.caption)
                    .fontWeight(.medium)
                Text(subtitle)
                    .font(.system(size: 14, weight: .semibold, design: .rounded))
                    .foregroundColor(color)
            }
        }
        .padding(10)
        .frame(height: 60)
        .frame(maxWidth: .infinity, alignment: .leading)
        .background(Color.white)
        .cornerRadius(10)
    }
}
