//
//  FrameworkGridView.swift
//  SwiftUI-Apple-Framework
//
//  Created by Sukumar Abhijeet on 26/01/24.
//

import SwiftUI

struct FrameworkGridView: View {
    
    @StateObject var viewModel  = FrameworkGridViewModel()
    
    var body: some View {
        NavigationView{
            ScrollView{
                LazyVGrid(columns: viewModel.columns){
                    ForEach(MockData.frameworks){
                        framework in
                        FrameworkTitleView(frameWork: framework)
                            .onTapGesture {
                            viewModel.selectedFramework = framework
                        }
                    }
                }
            }.navigationTitle("Frameworks")
                .sheet(isPresented: $viewModel.isShowingDetailView){
                    FrameworkDetailView(framework: viewModel.selectedFramework!,isShowingDetailView: $viewModel.isShowingDetailView)
                }
        }
    }
}

struct FrameworkGridView_Previews: PreviewProvider {
    static var previews: some View {
        FrameworkGridView()
            .preferredColorScheme(.dark)
    }
}


