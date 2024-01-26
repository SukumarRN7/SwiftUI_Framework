//
//  FrameGridViewModel.swift
//  SwiftUI-Apple-Framework
//
//  Created by Sukumar Abhijeet on 26/01/24.
//

import SwiftUI

final class FrameworkGridViewModel : ObservableObject {
    
    @Published var isShowingDetailView = false
    
    var selectedFramework : Framework? {
        didSet{
            isShowingDetailView = true
        }
    }
    
    let columns : [GridItem] = [GridItem(.flexible()),GridItem(.flexible()),GridItem(.flexible())]
}
