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
        VStack(spacing: 0) {
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
                    .fill(Color.white.opacity(0.3))
                    .frame(width: 45, height: 45)
                    .overlay(Text("🔥").font(.title))
            }
            .background(Color.black)
            .cornerRadius(12)
            .padding(.bottom, 20)

            VStack(spacing: 13) {
                ZStack {
                    RoundedRectangle(cornerRadius: 13)
                        .stroke(style: StrokeStyle(lineWidth: 1))
                        .frame(width: 390, height: 288)
                        .foregroundColor(.gray.opacity(0.6))

                    VStack {
                        HStack {
                            Text(monthAndYear(for: selectedDate))
                                .font(.headline)
                                .foregroundColor(.white)

                            Menu {
                                ForEach(months.indices, id: \.self) { index in
                                    Button(action: {
                                        // هنا يمكنك إضافة الكود لتغيير الشهر
                                    }) {
                                        Text(months[index])
                                    }
                                }
                            } label: {
                                Image(systemName: "chevron.down")
                                    .foregroundColor(.orange)
                            }

                            Spacer()

                            Button(action: {
                                changeWeek(by: -1)
                            }) {
                                Image(systemName: "chevron.left")
                                    .foregroundColor(.orange)
                            }

                            Button(action: {
                                changeWeek(by: 1)
                            }) {
                                Image(systemName: "chevron.right")
                                    .foregroundColor(.orange)
                            }
                        }
                        .padding(.bottom, 10)
                        
                        HStack(spacing: 20) {
                            ForEach(currentWeekDays, id: \.self) { day in
                                VStack {
                                    Text(dayName(for: day))
                                        .font(.subheadline)
                                        .fontWeight(.bold)
                                        .foregroundColor(isToday(day) ? .white : .gray)

                                    if isSpecialDate(day) {
                                        Circle()
                                            .fill(circleColor(for: day))
                                            .frame(width: 50, height: 50)
                                            .overlay(
                                                Text("\(calendar.component(.day, from: day))")
                                                    .foregroundColor(textColor(for: day))
                                                    .fontWeight(.bold)
                                                    .font(.title2)
                                            )
                                    } else {
                                        Text("\(calendar.component(.day, from: day))")
                                            .foregroundColor(isToday(day) ? .white : .gray)
                                            .fontWeight(.bold)
                                            .font(.title2)
                                    }
                                }
                                .padding(.vertical, 5)
                            }
                        }
                        
                        .padding(.horizontal)
                        .padding(.bottom, 10)
                        Divider() // إضافة حظ رمادي
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

                            VStack {
                                Text("\(freezeCount) ❄️")
                                    .font(.largeTitle)
                                    .foregroundColor(.blue)
                                Text("Day frozen")
                                    .foregroundColor(.white)
                            }
                        }
                        .padding()
                    }
                }
            }
            .padding(.bottom, 20)

            Button(action: {
                streakCount += 1
            }) {
                Text("Log today as Learned")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .foregroundColor(.black)
                    .frame(width: 300, height: 300)
                    .background(Color.orange)
                    .clipShape(Circle())
            }
            .padding(.top)

            Button(action: {
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

            Text("\(freezeCount) out of \(totalFreezes) freezes used")
                .font(.footnote)
                .foregroundColor(.gray)
        }
        .padding(.horizontal)
        .background(Color.black.ignoresSafeArea())
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

    func isSpecialDate(_ date: Date) -> Bool {
        let day = calendar.component(.day, from: date)
        let month = calendar.component(.month, from: date)
        return (month == 1 && (day == 27 || day == 28 || day == 29 || day == 30))
    }

    func circleColor(for date: Date) -> Color {
        let day = calendar.component(.day, from: date)
        return (day == 27 || day == 30) ? .brown : .blue
    }

    func textColor(for date: Date) -> Color {
        let day = calendar.component(.day, from: date)
        return (day == 27 || day == 30) ? .orange : .blue
    }

    func isToday(_ date: Date) -> Bool {
        return calendar.isDateInToday(date)
    }
}

struct LearningTrackerView_Previews: PreviewProvider {
    static var previews: some View {
        LearningTrackerView()
    }
}
