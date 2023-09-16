//
//  SecondView.swift
//  NavigationStack
//
//  Created by Atil Samancioglu on 6.08.2022.
//

import SwiftUI

struct SecondView: View {
    @State var path: [Dog] = [] // @State i koyduğumuzda değer değiştiğinde görünümü de değiştirir
    var body: some View {
        NavigationStack(path: $path) { // NavigationStack te normalde path in yanında root u da ister bizden. root ilk gösterilen ekrandır. path de hangi patikayı izleyerek ilerleyeceğidir. pathin içine köpekleri gösterdiğimiz için köpek vericez ama görünüm ekran vs de verebilirdik. binding olarak istediği için $ işareti koyarız. bu patika binding olarak verildiği için, yukarıda @State var path: buradaki patikaya koyduğumuz her şey sanki uygulamamızın gideceği bi yolmuş gibi davranılıyor ve navigasyon bizi oraya götürüyor. yani ekrandan ekrana geçişi, ekranlar arası gösterimi NavigationStack daha kolay bi hale getirmekle birlikte daha esnek bi hale de getiriyor. böylece manuel müdahalelerde bulunabiliyoruz
            List(dogs) {  dog in
                NavigationLink(dog.name,value: dog)
            }.navigationDestination(for: Dog.self) { dog in // tıklanıldığında köpeğin ismini vericek
                VStack{
                    Text(dog.name)
                   /*
                    Button("Go Back") { // tıklandığında "Go Back" isimli bir buton gösterir
                        path = [] // bu bizim uikitte kullandığımız popToRootViewController ile aynı. yani uygulama açıldığında ilk gösterilen viewcontroller a geri dönüyor. tabi swiftui da viewcontroller yok ama ilk görünüm neyse ona geri dönüyor
                        
                            
                    }
                    */
                    Button("Add to Path") {
                        path = [
                        dogs[0],
                        dogs[1]
                        ]
                    }
                }
            }
        }
    }
}

struct SecondView_Previews: PreviewProvider {
    static var previews: some View {
        SecondView()
    }
}
