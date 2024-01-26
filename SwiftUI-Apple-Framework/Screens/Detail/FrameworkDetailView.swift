//
//  FrameworkDetailView.swift
//  SwiftUI-Apple-Framework
//
//  Created by Sukumar Abhijeet on 26/01/24.
//

import SwiftUI

struct FrameworkDetailView: View {
    
    let framework : Framework
    @Binding var isShowingDetailView : Bool
    @State private var showWebView  = false
    
    var body: some View {
        VStack{
            HStack{
                Spacer()
                Button{
                    isShowingDetailView = false
                }label: {
                    Image(systemName: "xmark")
                        .foregroundColor(Color(.label))
                        .frame(width: 45,height: 45)
                }
            }.padding()
            Spacer()
            FrameworkTitleView(frameWork: framework)
            Text(framework.description)
                .font(.body)
                .padding()
                .multilineTextAlignment(.center)
            Spacer()
            Button{
                showWebView = true
            }label: {
                Text("Learn More")
            }
        }
        .sheet(isPresented:$showWebView){
            Link(framework.name,destination: URL(string: framework.urlString)!)
        }
    }
}

struct FrameworkDetailView_Previews: PreviewProvider {
    static var previews: some View {
        FrameworkDetailView(framework: MockData.frameworks[8],isShowingDetailView: .constant(false))
            .preferredColorScheme(.dark)
    }
}
