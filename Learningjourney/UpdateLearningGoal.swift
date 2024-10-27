//
//  UpdateLearningGoal.swift
//  Learningjourney
//
//  Created by فالحه الغنامي on 22/04/1446 AH.
//


import SwiftUI

struct UpdatLearningGoal: View {
    @State private var learningDuration = "Week"
    @State private var inputText = ""
    var body: some View {
        VStack(spacing: 20) {
           Spacer()
            VStack{
                
                
                Image(systemName: "chevron.left")
                Text("Back")
                    .font(.headline)
                    .fontWeight(.bold)
                    .foregroundColor(Color.orange)
                    .frame(maxWidth: .infinity, alignment: .leading)
                
                Text("Learning Goal")
                    .font(.title3)
                    .fontWeight(.bold)
                    .foregroundColor(Color.white)
                    .padding(.top, 10)
            }

            
            Text("I want to learn")
                .font(.title3)
                .fontWeight(.bold)
                .foregroundColor(Color.white)
                .padding(.top, 10)
                .frame(maxWidth: .infinity, alignment: .leading)

            TextField("Swift...", text: $inputText)
                .padding()
                .background(Color.black.opacity(0.7))
                .cornerRadius(8)
                .foregroundColor(.gray)
                .font(.system(size: 17))
                .padding(.leading, 0.0)
            
            Divider() // إضافة حظ رمادي
                .background(Color.gray)
            
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
                    }                  .padding(.vertical, -5)
                }
            }
           
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.horizontal)        }
        .padding()
        .background(Color.black.ignoresSafeArea()) // تعيين الخلفية إلى اللون الأسود
           }
        }
             
            
            
            
            
           


struct UpdatLearningGoal_Previews: PreviewProvider {
    static var previews: some View {
        UpdatLearningGoal()
    }
}
