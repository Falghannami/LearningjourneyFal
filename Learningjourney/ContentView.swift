//
//  ContentView.swift
//  Learningjourney
//
//  Created by فالحه الغنامي on 18/04/1446 AH.
//
import SwiftUI

struct ContentView: View {
    @State private var learningDuration = "Week"
    @State private var inputText = ""
    
    var body: some View {
        VStack(spacing: 20) {
            Spacer()

           
            ZStack {
                Circle()
                    .fill(Color.white.opacity(0.3))
                    .shadow(radius: 5)
                    .frame(width: 100, height: 100)
                    
                Text("🔥")
                    .font(.largeTitle)
                    .fontWeight(.heavy)
                   }
            .padding()

            Text("Hello Learner!")
                .font(.largeTitle)
                .fontWeight(.bold)
                .foregroundColor(.white)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.leading, -8.0)

            Text("This app will help you to learn every day")
                .font(.headline)
                .foregroundColor(.gray)
                .padding(.leading, -8.0)
                .frame(maxWidth: .infinity, alignment: .leading)
                
            Text("I want to learn")
                .font(.title3)
                .fontWeight(.bold)
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


            Text("I want to learn it in")
                .font(.body)
                .fontWeight(.bold)
                .foregroundColor(.white)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.leading, -7.0)

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
            .padding(.leading, -4.0)

            Button(action: {
                // Implement your "Start" button logic here
            }) {
                HStack {
                    Text("Start")
                        .font(.title2)
                        .foregroundColor(.black)
                        .bold()
                    Image(systemName: "arrow.right")
                        .foregroundColor(.black)
                }
                .padding()
                .frame(width: 151, height: 52)
                .background(RoundedRectangle(cornerRadius: 8)
                    .fill(Color(red: 1.0, green: 159/255, blue: 10/255)))
            }
            .padding(.top, 35)

            Spacer()
        }
        .padding()
        .background(Color.black.ignoresSafeArea()) // تعيين الخلفية إلى اللون الأسود
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
