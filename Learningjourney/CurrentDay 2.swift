//
//  Untitled.swift
//  Learningjourney
//
//  Created by فالحه الغنامي on 20/04/1446 AH.
//

import SwiftUI

struct CurrentDay: View {
    @State private var learningDuration = "Week"
    @State private var inputText = ""

    var body: some View {
        VStack(spacing: 20) {
            Spacer()

            

            

           
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.horizontal)

            Spacer()
        }
        .padding()
        .background(Color.black.ignoresSafeArea()) // تعيين الخلفية إلى اللون الأسود
    }
}

struct CurrentDay_Previews: PreviewProvider {
    static var previews: some View {
        CurrentDay()
    }
}
