//
//  FreezedDay.swift
//  Learningjourney
//
//  Created by فالحه الغنامي on 22/04/1446 AH.
//


import SwiftUI

struct FreezedDayView: View {
    @State private var selectedDate = Date() // Keeps track of the currently selected date
    @State private var streakCount = 10 // Represents the current streak
    @State private var freezeCount = 2 // Number of freezes used
    @State private var totalFreezes = 6 // Max freezes available in the current period (month)
    
    let calendar = Calendar.current
    let daysInWeek = 7
    let months = Calendar.current.monthSymbols
    
    // Function to calculate if today is frozen
    var isFrozen: Bool {
        freezeCount < totalFreezes
    }
    
    // Function to determine if the streak is reset (after 32 hours, or other conditions)
    func shouldResetStreak() -> Bool {
        // Implement the reset logic based on the hours passed, etc.
        // For now, returning false as a placeholder
        return false
    }
    
    // Calendar display logic
    var monthDays: [Date] {
        let range = calendar.range(of: .day, in: .month, for: selectedDate)!
        let startOfMonth = calendar.date(from: calendar.dateComponents([.year, .month], from: selectedDate))!
        
        return range.compactMap { day in
            calendar.date(byAdding: .day, value: day - 1, to: startOfMonth)
        }
    }
    
    // UI for the app
    var body: some View {
        VStack(spacing: 10) { // Adjusted spacing to reduce top/bottom space
            // Header for the title and streak info in HStack
            HStack {
                VStack(alignment: .leading) {
                    Text("Wednesday, 11 SEP")
                        .font(.headline)
                        .foregroundColor(.gray)
                    
                    Text("Learning Swift")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                }
                Spacer()
                Circle()
                    .fill(Color.white.opacity(0.5))
                    .frame(width: 40, height: 40)
                    .overlay(Text("🔥").font(.title))
            }
            .background(Color.black)
            .cornerRadius(12)
            
            // Calendar View
            VStack(spacing: 20) {
                ZStack{
                    RoundedRectangle(cornerRadius: 13)
                        .stroke(style: StrokeStyle(lineWidth: 1))
                        .frame(width: 390, height: 288)
                        .foregroundColor(.gray.opacity(0.6))
                    
                    HStack {
                        Button(action: {
                            // Go to previous month
                            selectedDate = calendar.date(byAdding: .month, value: -1, to: selectedDate)!
                        }) {
                            Image(systemName: "chevron.left")
                                .foregroundColor(.orange)
                        }
                        
                        Text(monthAndYear(for: selectedDate))
                            .font(.headline)
                            .foregroundColor(.white)
                        
                        Button(action: {
                            // Go to next month
                            selectedDate = calendar.date(byAdding: .month, value: 1, to: selectedDate)!
                        }) {
                            Image(systemName: "chevron.right")
                                .foregroundColor(.orange)
                        }
                    }
                    
                    HStack {
                        ForEach(monthDays, id: \.self) { day in
                            VStack {
                                Text(dayName(for: day))
                                    .font(.caption)
                                    .fontWeight(.bold)
                                    .foregroundColor(.white)
                                
                                Circle()
                                    .fill(calendar.isDateInToday(day) ? Color.white : Color.white.opacity(0.5))
                                    .frame(width: 30, height: 30)
                                    .overlay(
                                        Text("\(calendar.component(.day, from: day))")
                                            .foregroundColor(calendar.isDateInToday(day) ? .white : .black)
                                            .fontWeight(.bold)
                                    )
                            }
                        }
                    }
                }
                .background(Color.black.opacity(0.8))
                .cornerRadius(12)
                
                // Streak and Freeze Section
                HStack {
                    VStack {
                        Text("\(streakCount) 🔥")
                            .font(.largeTitle)
                            .foregroundColor(.orange)
                        Text("Day streak")
                            .foregroundColor(.white)
                    }
                    
                    Spacer()
                    
                    VStack {
                        Text("\(freezeCount) ❄️")
                            .font(.largeTitle)
                            .foregroundColor(.blue)
                        Text("Day frozen")
                            .foregroundColor(.white)
                    }
                }
                
                .background(Color.black.opacity(0.8))
                .cornerRadius(12)
            }
            // Button to log the day as learned with 300 diameter
            Button(action: {
                // Action to log the day
                streakCount += 1 // Increment the streak
            }) {
                Text("Freezed today")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .foregroundColor(.blue) // Text color changed to orange
                    .frame(width: 300, height: 300) // Set diameter to 300
                    .background(Color.blue.opacity(0.2)) // Background color changed to brown
                    .clipShape(Circle()) // Ensure it is circular
            }
            .padding(.top)
            
            // Freeze button
            Button(action: {
                // Action to freeze the day
                if freezeCount < totalFreezes {
                    freezeCount += 1
                }
            }) {
                Text("Freeze day")
                    .font(.title2)
                    .fontWeight(.bold)
                    .foregroundColor(.blue)
                    .padding()
                    .background(Color.blue.opacity(0.2))
                    .cornerRadius(10)
            }
            .padding(.top)
            
            // Freeze usage indicator
            Text("\(freezeCount) out of \(totalFreezes) freezes used")
                .font(.footnote)
                .foregroundColor(.gray)
        }
        .padding(.horizontal) // Horizontal padding only
        .background(Color.black.ignoresSafeArea())
    }
    
    // Helper functions for formatting the date
    func dayName(for date: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "EEE"
        return formatter.string(from: date)
    }
    
    func monthAndYear(for date: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "MMMM yyyy"
        return formatter.string(from: date)
    }
}

struct FreezedDayView_Previews: PreviewProvider {
    static var previews: some View {
        FreezedDayView()
    }
}
