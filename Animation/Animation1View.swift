//
//  Animation1View.swift
//  Animation
//
//  Created by Aysha on 17/08/2022.
//

import SwiftUI

struct Animation1View: View {
    
    @State private var half = false
    @State private var dim = false
    
    @State private var half2 = false
    @State private var dim2 = false
    
    //Implicit animation 
    var body: some View {
        VStack{
            //Implicit Animation
            Image("mobile")
                .resizable()
                .frame(width: 300, height: 250, alignment: .center)
                .scaleEffect(half ? 1.0 : 0.5)
                .opacity(dim ? 1.0 : 0.5)
                .animation(.easeInOut(duration: 1.0), value: 0.5)
//                .animation(.easeInOut(duration: 1.0), value: 0.5)
                .onTapGesture {
                    self.dim.toggle()
                    self.half.toggle()
                }
            
            //Explicit Animation
            Image("mobile")
                .resizable()
                .frame(width: 300, height: 250, alignment: .center)
                .scaleEffect(half2 ? 1.0 : 0.5)
                .opacity(dim2 ? 1.0 : 0.5)
                .onTapGesture {
                    self.half2.toggle()
                    withAnimation(.easeInOut(duration: 1.0)){
                        self.dim2.toggle()
                    }
                }
            
        }
    }
    
    func nextPage() {
        
    }
}

struct Animation1View_Previews: PreviewProvider {
    static var previews: some View {
        Animation1View()
    }
}
