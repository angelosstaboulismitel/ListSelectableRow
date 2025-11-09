//
//  ContentView.swift
//  ListSelectableRow
//
//  Created by angelos on 05/11/2025.
//

import SwiftUI

struct ContentView: View {
    @State var rows = ["Angelos","Angeliki","Theodoros","John"]
    @State var selected:String
    @State var searchable:String
    @State var searchList:[String]
   
    var body: some View {
        NavigationStack{
            VStack{
                HStack{
                    TextField("", text:$searchable).onChange(of: searchable) { oldValue, newValue in
                        if !searchable.isEmpty{
                            searchList = rows.filter{$0.contains(searchable)}
                        }else{
                            searchList = rows
                        }
                    }.foregroundStyle(.blue)
                }.frame(width:400,height:65,alignment: .top)
                List($searchList,id:\.self,editActions:.move){$row in
                    Text(row).onTapGesture {
                        selected = row
                    }.listRowBackground(selected == row ? Color.red : Color.clear)
                }.scrollContentBackground(.hidden)
                .onAppear {
                        searchList = rows
                }.frame(width:400,height:400)
            }
            
        }
    }
}

#Preview {
    ContentView(selected:"", searchable: "", searchList: [])
}
