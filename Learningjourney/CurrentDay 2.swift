import SwiftUI

struct CurrentDay2: View {
    @State private var learningDuration = "Week"
    @State private var inputText = "Swift"
    
    var body: some View {
        VStack(spacing: 20) {
            
            HStack {
                Image(systemName: "chevron.left")
                    .foregroundColor(.orange)
                
                Text("Back")
                    .font(.headline)
                    .fontWeight(.bold)
                    .foregroundColor(.orange)
                
                Spacer()
                
                Text("Learning Goal")
                    .font(.title3)
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                
                Spacer()
                
                Text("Update")
                    .font(.headline)
                    .fontWeight(.bold)
                    .foregroundColor(.orange)
            }
            .padding(.top, 10)
            
            // النص "I want to learn"
            Text("I want to learn")
                .font(.title3)
                .fontWeight(.bold)
                .foregroundColor(.white)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.top, 10)

            // حقل الإدخال
            TextField("Swift...", text: $inputText)
                .padding()
                .background(Color.white.opacity(0.1))
                .cornerRadius(8)
                .foregroundColor(.gray)
                .font(.system(size: 17))
            
            Divider()
                .background(Color.gray)
                .padding(.horizontal)

            HStack(spacing: 12) {
                ForEach(["Week", "Month", "Year"], id: \.self) { duration in
                    Button(action: {
                        learningDuration = duration
                    }) {
                        Text(duration)
                            .foregroundColor(learningDuration == duration ? .black : .orange)
                            .fontWeight(learningDuration == duration ? .bold : .regular)
                            .padding(10)
                            .background(learningDuration == duration ? Color.orange : Color(red: 44/255, green: 44/255, blue: 49/255))
                            .cornerRadius(8)
                    }
                    .padding(.vertical, -5)
                }
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.horizontal)
            
            Spacer()

            // لوحة مفاتيح افتراضية مخصصة في الثلث الأخير
            VStack(spacing: 8) {
                ForEach(["QWERTYUIOP", "ASDFGHJKL", "ZXCVBNM"], id: \.self) { row in
                    HStack(spacing: 6) {
                        ForEach(row.map { String($0) }, id: \.self) { letter in
                            Button(action: {
                                inputText += letter
                            }) {
                                Text(letter)
                                    .font(.system(size: 20))
                                    .foregroundColor(.white)
                                    .frame(width: 30, height: 40)
                                    .background(Color.gray.opacity(0.6))
                                    .cornerRadius(5)
                            }
                        }
                    }
                }
                
                // زر "مسافة" وزر "حذف"
                HStack {
                    Button(action: {
                        inputText += " "
                    }) {
                        Text("Space")
                            .font(.system(size: 18))
                            .foregroundColor(.white)
                            .frame(maxWidth: .infinity, minHeight: 40)
                            .background(Color.gray.opacity(0.6))
                            .cornerRadius(5)
                    }

                    Button(action: {
                        if !inputText.isEmpty {
                            inputText.removeLast()
                        }
                    }) {
                        Image(systemName: "delete.left")
                            .foregroundColor(.white)
                            .frame(width: 50, height: 40)
                            .background(Color.gray.opacity(0.6))
                            .cornerRadius(5)
                    }
                }
            }
            .padding(.bottom, 30)
        }
        .padding()
        .background(Color.black.ignoresSafeArea())
    }
}

struct CurrentDay2_Previews: PreviewProvider {
    static var previews: some View {
        CurrentDay2()
    }
}
