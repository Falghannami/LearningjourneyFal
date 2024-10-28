import SwiftUI

struct LearningTrackerView: View {
    @State private var selectedDate = Date()
    @State private var streakCount = 10
    @State private var freezeCount = 2
    @State private var totalFreezes = 6

    let calendar = Calendar.current
    let daysInWeek = 7
    let months = Calendar.current.monthSymbols

    var currentWeekDays: [Date] {
        let startOfWeek = calendar.dateInterval(of: .weekOfMonth, for: selectedDate)?.start ?? selectedDate
        return (0..<daysInWeek).compactMap { day in
            calendar.date(byAdding: .day, value: day, to: startOfWeek)
        }
    }

    func changeWeek(by offset: Int) {
        selectedDate = calendar.date(byAdding: .day, value: daysInWeek * offset, to: selectedDate) ?? selectedDate
    }

    var body: some View {
        NavigationView {
            ZStack {
                Color.black
                    .ignoresSafeArea()
                
                VStack(spacing: 15) {
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
                        
                        NavigationLink(destination: CurrentDay2().navigationBarBackButtonHidden(true)) {
                            Circle()
                                .fill(Color.white.opacity(0.3))
                                .frame(width: 45, height: 45)
                                .overlay(Text("🔥").font(.title))
                        }
                    }
                    .background(Color.black)
                    .cornerRadius(12)
                    .padding(.horizontal)
                    .padding(.bottom, 20)
                    
                    ZStack {
                        RoundedRectangle(cornerRadius: 13)
                            .stroke(style: StrokeStyle(lineWidth: 1))
                            .foregroundColor(.gray.opacity(0.6))
                            .frame(width: 350, height: 230)
                        
                        VStack(spacing: 15) {
                            HStack {
                                Text(monthAndYear(for: selectedDate))
                                    .font(.headline)
                                    .foregroundColor(.white)
                                
                                Menu {
                                    ForEach(months.indices, id: \.self) { index in
                                        Button(action: {
                                            // تغيير الشهر
                                        }) {
                                            Text(months[index])
                                        }
                                    }
                                } label: {
                                    Image(systemName: "chevron.down")
                                        .foregroundColor(.orange)
                                }
                                
                                Spacer()
                                
                                Button(action: { changeWeek(by: -1) }) {
                                    Image(systemName: "chevron.left")
                                        .foregroundColor(.orange)
                                }
                                
                                Button(action: { changeWeek(by: 1) }) {
                                    Image(systemName: "chevron.right")
                                        .foregroundColor(.orange)
                                }
                            }
                            .padding(.horizontal, 20)
                            
                            HStack(spacing: 10) {
                                ForEach(currentWeekDays, id: \.self) { day in
                                    VStack {
                                        Text(dayName(for: day))
                                            .font(.subheadline)
                                            .fontWeight(.bold)
                                            .foregroundColor(.white)
                                        
                                        Circle()
                                            .fill(circleColor(for: day))
                                            .frame(width: 40, height: 40)
                                            .overlay(
                                                Text("\(calendar.component(.day, from: day))")
                                                    .foregroundColor(textColor(for: day))
                                                    .fontWeight(.bold)
                                                    .font(.body)
                                            )
                                    }
                                }
                            }
                            
                            Divider()
                                .background(Color.gray)
                            
                            HStack {
                                VStack {
                                    Text("\(streakCount) 🔥")
                                        .font(.largeTitle)
                                        .foregroundColor(.orange)
                                    Text("Day streak")
                                        .foregroundColor(.white)
                                }
                                
                                Spacer()
                                
                                Divider()
                                    .frame(height: 60)
                                    .background(Color.white)
                                
                                Spacer()
                                
                                VStack {
                                    Text("\(freezeCount) ❄️")
                                        .font(.largeTitle)
                                        .foregroundColor(.blue)
                                    Text("Day frozen")
                                        .foregroundColor(.white)
                                }
                            }
                            .padding(.horizontal, 30)
                        }
                        .padding(.vertical)
                    }
                    
                    VStack(spacing: 15) {
                        Button(action: {
                            streakCount += 1
                        }) {
                            Text("Log today as Learned")
                                .font(.largeTitle)
                                .fontWeight(.bold)
                                .foregroundColor(.black)
                                .frame(width: 335, height: 250)
                                .background(Color.orange)
                                .clipShape(Circle())
                        }
                        
                        Button(action: {
                            if freezeCount < totalFreezes {
                                freezeCount += 1
                            }
                        }) {
                            Text("Freeze day")
                                .font(.title)
                                .fontWeight(.bold)
                                .foregroundColor(.blue)
                                .padding()
                                .background(Color.blue.opacity(0.2))
                                .cornerRadius(10)
                        }
                        
                        Text("\(freezeCount) out of \(totalFreezes) freezes used")
                            .font(.footnote)
                            .foregroundColor(.gray)
                    }
                }
                .padding(.top, 20)
                .background(Color.black.ignoresSafeArea())
            }
        }
    }
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

    func circleColor(for date: Date) -> Color {
        if isToday(date) {
            return .blue
        } else if isTomorrow(date) {
            return .orange
        } else {
            let day = calendar.component(.day, from: date)
            return (day == 27 || day == 30) ? .brown : .gray
        }
    }

    func textColor(for date: Date) -> Color {
        return .white
    }

    func isToday(_ date: Date) -> Bool {
        return calendar.isDateInToday(date)
    }

    func isTomorrow(_ date: Date) -> Bool {
        return calendar.isDateInTomorrow(date)
    }
}


struct LearningTrackerView_Previews: PreviewProvider {
    static var previews: some View {
        LearningTrackerView()
    }
}
