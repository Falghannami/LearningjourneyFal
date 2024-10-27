//
//  Untitled.swift
//  Learningjourney
//
//  Created by فالحه الغنامي on 20/04/1446 AH.
//

import SwiftUI

struct CurrentDay2: View {
    @State private var learningDuration = "Week"
    @State private var inputText = ""
    var body: some View {
        VStack(spacing: 20) {
            Spacer()
            HStack{
                
                
                
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
                
                Text("Update")
                    .font(.headline)
                    .fontWeight(.bold)
                    .foregroundColor(Color.orange)
                
            }
            
             
            
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

            Spacer()
        }
        .padding()
        .background(Color.black.ignoresSafeArea()) // تعيين الخلفية إلى اللون الأسود
    }
}

struct CurrentDay2_Previews: PreviewProvider {
    static var previews: some View {
        CurrentDay2()
    }
}
