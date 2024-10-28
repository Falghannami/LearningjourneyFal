import SwiftUI

struct UpdatLearningGoal: View {
    @State private var learningDuration = "Week"
    @State private var inputText = "Swift"
    
    var body: some View {
        VStack(spacing: 20) {
            
            // إضافة السهم والنصوص في مستوى واحد باستخدام HStack
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
                    .foregroundColor(Color.white)
                
                Spacer()
                
                Text("Update")
                    .font(.title3)
                    .fontWeight(.bold)
                    .foregroundColor(Color.orange)
            }
            .padding(.top, 10)
            
            Text("I want to learn")
                .font(.title3)
                .fontWeight(.bold)
                .foregroundColor(Color.white)
                .padding(.top, 10)
                .frame(maxWidth: .infinity, alignment: .leading)

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
                            .background(learningDuration == duration ? Color(red: 1.0, green: 159/255, blue: 10/255) : Color(red: 44/255, green: 44/255, blue: 49/255))
                            .cornerRadius(8)
                    }
                    .padding(.vertical, -5)
                }
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.horizontal)
            
            Spacer() // يترك الثلثين الأخيرين من الشاشة فارغين
        }
        .padding()
        .background(Color.black.ignoresSafeArea())
    }
}

struct UpdatLearningGoal_Previews: PreviewProvider {
    static var previews: some View {
        UpdatLearningGoal()
    }
}
