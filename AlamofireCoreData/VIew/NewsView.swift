//
//  NewsView.swift
//  JSONCoreData
//
//  Created by Nazar Babyak on 04.05.2022.
//

import SwiftUI

struct NewsView: View {
    
    var result: ResultModel?
    var fetchedData: Result?
    @State var show: Bool = false
    @Namespace var animation
    
    var body: some View {
        NavigationLink(destination: {
            
            VStack(alignment: .leading, spacing: 10) {
                HStack {
                    Text("1")
                        .font(.system(size: 25))
                        .font(.system(.headline, design: .monospaced))
                        .frame(width: 35, height: 35)
                        .foregroundColor(.black)
                        .background(Color.white)
                        .cornerRadius(25)
                    Text(result == nil ? fetchedData!.name! : result!.name ?? "")
                        .font(.system(size: 25))
                        .font(.system(.headline, design: .monospaced))
                }
                .padding()
                .foregroundColor(.white)
                .frame(maxWidth: .infinity, alignment: .leading)
                .background(Color.black)
                .cornerRadius(15)
                Text(result == nil ? fetchedData!.phone! : result!.phone ?? "")
                    .font(.system(.subheadline, design: .monospaced))
                HStack {
                    Image(systemName: "network")
                        .resizable()
                        .scaledToFit()
                        .foregroundColor(.blue)
                        .frame(width: 20, height: 20)
                        .onTapGesture {
                            withAnimation(.easeInOut) {
                                show.toggle()
                            }
                        }
                    Image(systemName: show ? "arrow.left" : "arrow.right")
                        .rotationEffect(.degrees(180))
                        .matchedGeometryEffect(id: "rotate", in: animation)
                    if show {
                        Text("Web: \(result == nil ? fetchedData!.phone! : result!.phone ?? "")")
                            .font(.system(.body, design: .monospaced))
                            .transition(.move(edge: .trailing))
                    }
                    
                }
                Text(result == nil ? fetchedData!.username! : result!.username ?? "")
                    .font(.system(.body, design: .monospaced))
                
                Text(result == nil ? fetchedData!.email! : result!.email ?? "")
                    .font(.system(.body, design: .monospaced))

                
                Spacer()
            }
            .padding()
            
        }, label: {
            VStack(alignment: .leading, spacing: 10) {
                
                
                Text("1")
                    .font(.system(size: 25))
                    .font(.system(.headline, design: .monospaced))
                    .frame(width: 35, height: 35)
                    .foregroundColor(.black)
                    .background(Color.white)
                    .cornerRadius(25)
                Text(result == nil ? fetchedData!.name! : result!.name ?? "")
                    .font(.system(size: 25))
                    .font(.system(.headline, design: .monospaced))
                
                Text(result == nil ? fetchedData!.phone! : result!.phone ?? "")
                    .font(.system(.subheadline, design: .monospaced))
                
            }
            .padding()
            .foregroundColor(.white)
            .frame(maxWidth: .infinity, alignment: .leading)
            .background(
                LinearGradient(colors: [.blue, .purple], startPoint: .topTrailing, endPoint: .bottomLeading)
            )
            .cornerRadius(35)
        })
    }
}


