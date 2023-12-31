//
//  ContentView.swift
//  NavigationStack
//
//  Created by Atil Samancioglu on 6.08.2022.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationStack { // navigationlink leri verirken value kısmını da ekleyebilmek için NavigationStack kullanırız
            List {
                Section("Dogs") {
                    ForEach(dogs) { dog in
                        NavigationLink(dog.name,value: dog) // value gidilecek yerde yollanacak değer anlamına gelir
                    }
                }
                
                Section("Cats") {
                    ForEach(cats) { cat in
                        NavigationLink(cat.name,value: cat)
                    }
                }
            }
            .navigationDestination(for: Dog.self) { dog in // dog in bu kısma tıklandığında ne verileceği yazılır
                Text(dog.name)
            }
            .navigationDestination(for: Cat.self) { cat in 
                Text(cat.name)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
