//
//  Home.swift
//  JSONCoreData
//
//  Created by Nazar Babyak on 04.05.2022.
//

import SwiftUI

struct Home: View {
    
    @StateObject var jsonviewmodel = JsonViewModel()
    @Environment(\.managedObjectContext) var moc
    
    
    @FetchRequest(entity: Result.entity(), sortDescriptors: [NSSortDescriptor(keyPath: \Result.name, ascending: true)]) var savedName: FetchedResults<Result>
    
    var body: some View {
        NavigationView {
            VStack(alignment: .leading, spacing: 15) {
                
                if savedName.isEmpty {
                    
                    if jsonviewmodel.results.isEmpty {
                        ProgressView()
                            .onAppear {
                                jsonviewmodel.fetchData(context: moc)
                            }
                    } else {
                        List {
                            ForEach(jsonviewmodel.results , id: \.self) { result in
                                
                                NewsView(result: result)
                                
                            }
                        } .listStyle(.inset)
                    }
                    
                } else {
                    
                    List {
                        ForEach(savedName) { result in 
                            
                            NewsView(fetchedData: result)
                            
                        }
                    } .listStyle(.inset)
                    
                }
                
                
            }
            .navigationTitle(!savedName.isEmpty ? "Fetch Core Data" : "Fetch JSON")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: {
                        
                        do {
                            
                            savedName.forEach { (result) in
                                moc.delete(result)
                            }
                            
                            try moc.save()
                            
                        } catch {
                            
                            print(error.localizedDescription)
                        }
                        
                        
//                        jsonviewmodel.results.removeAll()
                    }, label: {
                        Image(systemName: "arrow.clockwise")
                            .foregroundColor(.black)
                            .scaledToFill()
                            .frame(width: 25, height: 25)
                    })
                        .padding(.trailing, 5)
                }
            }
        }
    }
}
