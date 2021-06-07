//
//  ProfileView.swift
//  WATimer
//
//  Created by Cédric Bahirwe on 30/01/2021.
//

import SwiftUI

struct ProfileView: View {
    @Environment(\.presentationMode) var presentationMode
    var body: some View {
        ZStack {
            Color(.secondarySystemBackground).edgesIgnoringSafeArea(.all)
            VStack(spacing: 0) {
                HStack {
                    Button(action: {
                        presentationMode.wrappedValue.dismiss()

                    }) {
                        Image(systemName: "chevron.left")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 15, height: 15)
                            .frame(width: 40, height: 40)
                            .foregroundColor(.primary)
                    }
                    
                    Spacer()
                    Text("Profile")
                        .font(.system(size: 22, weight: .bold))
                    Spacer()
                    
                    Button(action: {}, label: {
                        Image(systemName: "ellipsis")
                            .resizable()
                            .scaledToFit()
                            .foregroundColor(.purple)
                            .padding(.horizontal, 10)
                            .frame(width: 40, height: 40)
                            .background(Color.white)
                            .cornerRadius(8)
                            .rotationEffect(.radians(.pi/2))
                            .shadow(color: .offWhite, radius: 3, x: 0, y: 3)
                    })
                }
                .padding(.horizontal)
                VStack {
                    Image("3")
                        .resizable()
                        .frame(width: 80, height: 80)
                        .clipShape(Circle())
                        .shadow(color: .black, radius: 15, x: 0, y: 8)
                        .padding(.top, -35)
                    VStack {
                        Text("Cédric Bahirwe")
                            .font(.system(size: 22, weight: .bold, design: .rounded))
                        
                        Text("IOS Developer  ")
                            .font(.system(size: 13, weight: .light))
                            .foregroundColor(.gray)
                    }
                    .padding()
                    
                    HStack (spacing: 10) {
                        GridItem(title: "Task Done", subtitle: "26487", image: "line.horizontal.3")
                            .shadow(color: .offWhite, radius: 10, x: 0, y: 3)
                        
                        HStack {
                            VStack(alignment: .leading, spacing: 2) {
                                Text("Task Done")
                                    .foregroundColor(.gray)
                                    .font(.caption)
                                    .fontWeight(.medium)
                                HStack(spacing: 2) {
                                    Text("268")
                                        .font(.system(size: 14, weight: .semibold, design: .rounded))
                                        .foregroundColor(.purple)
                                    Image(systemName: "arrow.right")
                                        .resizable()
                                        .aspectRatio(contentMode: .fit)
                                        .frame(width: 20, height: 8, alignment: .leading)
                                        .foregroundColor(.gray)
                                }
                            }
                        }
                        .padding(10)
                        .frame(height: 65)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .background(Color.white)
                        .cornerRadius(10)
                        .shadow(color: .offWhite, radius: 10, x: 0, y: 3)
                    }
                    .padding(.bottom, -30)
                    .padding(.horizontal)
                }
                .frame(maxWidth: .infinity)
                .background(Color(.systemBackground).clipShape(Curved()))
                .padding(.horizontal,3)
                .padding(.top, 40)
                .padding(.bottom, 45)
                
                
                
                ScrollView(showsIndicators: false) {
                    VStack {
                    ProfileRowItem(image: "stopwatch.fill", title: "Reminders", color: .blue)
                    
                    ProfileRowItem(image: "bell.fill", title: "Reminders", color: .orange)
                    
                    ProfileRowItem(image: "text.bubble.fill", title: "Help & Support", color: .purple)
                    
                    HStack {
                        Image(systemName: "calendar")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .foregroundColor(.green)
                            .padding(10)
                            .frame(width: 40, height: 40)
                            .background(Color.blue.opacity(0.1))
                            .cornerRadius(8)
                        Text("All Events")
                            .fontWeight(.semibold)
                            .foregroundColor(.black)
                        
                        
                        Spacer()
                        
                        ZStack(alignment: .leading) {
                            LinearGradient(gradient: Gradient(colors: [Color(.secondarySystemBackground), Color(.secondarySystemBackground)]), startPoint: .leading, endPoint: .trailing)
                                .frame(width: 54, height: 32)
                                .clipShape(Capsule())
                            Color(.lightGray).opacity(0.4)
                                .frame(width: 28, height: 28)
                                .clipShape(Circle())
                                .padding(3)
                        }
                        .scaleEffect(0.8)
                    }
                    .padding(.horizontal, 8)
                    .frame(height: 60)
                    .background(Color.white)
                    .cornerRadius(8)
                    }
                    .padding(.horizontal, 4)
                    
                }
                .padding(.horizontal)
                
                Spacer()
                
                HStack(alignment: .bottom, spacing: 0) {
                    Image(systemName: "square.grid.2x2.fill")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .padding(8)
                        .frame(width: 30, height: 30)
                        .background(Color(.secondarySystemBackground))
                        .cornerRadius(5)
                        .frame(maxWidth: .infinity)
                    Image(systemName: "calendar")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .padding(8)
                        .frame(width: 30, height: 30)
                        .background(Color(.secondarySystemBackground))
                        .cornerRadius(5)
                        .frame(maxWidth: .infinity)
                    Spacer()
                        .frame(maxWidth: .infinity)
                    Spacer().frame(width: 50)
                    
                    Image(systemName: "list.bullet.below.rectangle")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .padding(8)
                        .frame(width: 30, height: 30)
                        .background(Color(.secondarySystemBackground))
                        .cornerRadius(5)
                        .frame(maxWidth: .infinity)
                    Image(systemName: "person.fill")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .padding(8)
                        .frame(width: 30, height: 30)
                        .background(Color(.secondarySystemBackground))
                        .cornerRadius(5)
                        .frame(maxWidth: .infinity)
                }
                .padding(.horizontal)
                .foregroundColor(Color(.label))
                .frame(height: 50, alignment: .center)
                .frame(maxWidth: .infinity)
                .background(Color.white.clipShape(CurvedShape()).edgesIgnoringSafeArea(.bottom))
                .overlay(
                    Button(action: {}, label: {
                        Image(systemName: "plus")
                            .resizable()
                            .padding()
                            .frame(width: 50, height: 50)
                            .foregroundColor(.white)
                            .clipShape(Circle())
                            .background(
                                LinearGradient(gradient: Gradient(colors: [Color.orange.opacity(0.9), Color.orange.opacity(0.7), Color.red]), startPoint: .topLeading, endPoint: .bottom)
                            )
                            .clipShape(Circle())
                            .offset(y: -15)
                    })
                    , alignment: .top
                )
            }
        }
        .navigationTitle("")
        .navigationBarHidden(true)
        
        
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}

struct ProfileRowItem: View {
    let image: String
    let title: String
    let color: Color
    var body: some View {
        HStack {
            Image(systemName: image)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .foregroundColor(color)
                .padding(10)
                .frame(width: 40, height: 40)
                .background(color.opacity(0.1))
                .cornerRadius(8)
            Text(title)
                .fontWeight(.semibold)
                .foregroundColor(.black)
            
            Spacer()
            
            ZStack(alignment: .trailing) {
                LinearGradient(gradient: Gradient(colors: [color.opacity(0.5), color]), startPoint: .leading, endPoint: .trailing)
                    .frame(width: 54, height: 32)
                    .clipShape(Capsule())
                Color.white
                    .frame(width: 28, height: 28)
                    .clipShape(Circle())
                    .padding(2)
                
            }
            .scaleEffect(0.8)
        }
        .padding(.horizontal, 8)
        .frame(height: 60)
        .background(Color.white)
        .cornerRadius(8)
    }
}


struct CurvedShape: Shape {
    func path(in rect: CGRect) -> Path {
        return Path { path in
            
            
            path.move(to: CGPoint(x: 0, y: 0))
            
            path.addLine(to: CGPoint(x: rect.width, y: 0))

            path.addLine(to: CGPoint(x: rect.width, y: rect.height))
            
            path.addLine(to: CGPoint(x: 0, y: rect.height))

            
            
            let center = rect.width / 2
            
            path.move(to: CGPoint(x: center - 60, y: 0))
            
            
            let to1 = CGPoint(x: center, y: 50)
            
            let control1 = CGPoint(x: center - 35, y: 0)
            
            let control2 = CGPoint(x: center - 35, y: 50)
            
            
            
            
            let to2 = CGPoint(x: center + 60, y: 0)
            
            let control3 = CGPoint(x: center + 35, y: 50)
            
            let control4 = CGPoint(x: center + 35, y: 0)
            
            
            path.addCurve(to: to1, control1: control1, control2: control2)
            
            path.addCurve(to: to2, control1: control3, control2: control4)
        }
    }
    
}


struct Curved: Shape {
    func path(in rect: CGRect) -> Path {
        return Path { path in
            
            
            path.move(to: CGPoint(x: 0, y: 0))
            
            path.addLine(to: CGPoint(x: rect.width, y: 0))

            path.addLine(to: CGPoint(x: rect.width, y: rect.height))
            
            path.addLine(to: CGPoint(x: 0, y: rect.height))

            
            
            let center = rect.width / 2
            
            path.move(to: CGPoint(x: center - 70, y: 0))
            
            
            let to1 = CGPoint(x: center, y: 60)
            
            let control1 = CGPoint(x: center - 50, y: 0)
            
            let control2 = CGPoint(x: center - 50, y: 60)
            
            
            
            
            let to2 = CGPoint(x: center + 70, y: 0)
            
            let control3 = CGPoint(x: center + 50, y: 60)
            
            let control4 = CGPoint(x: center + 50, y: 0)
            
            
            path.addCurve(to: to1, control1: control1, control2: control2)
            
            path.addCurve(to: to2, control1: control3, control2: control4)
        }
    }

}
