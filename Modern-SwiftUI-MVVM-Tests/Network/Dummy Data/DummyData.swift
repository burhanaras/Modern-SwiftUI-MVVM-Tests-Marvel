//
//  DummyData.swift
//  Modern-SwiftUI-MVVM-Tests
//
//  Created by Burhan Aras on 28.08.2021.
//

import Foundation


var dummyMarvel = Marvel(id: UUID().uuidString, title: "Slm", image: URL(string: "https://i.annihil.us/u/prod/marvel/i/mg/c/e0/535fecbbb9784.jpg")!, description: "The best")
var dummyCharactersResponse = CharactersResponse(code: 200, data: CharactersDataResponse(offset: 0, limit: 30, total: 151, results: DummyData.marvelDTOs(count: 30)))
var dummyComicsResponse = ComicsResponse(code: 200, data: ComicsData(offset: 0, limit: 10, total: 10, results: DummyData.comicDTOs(count: 10)))


class DummyData{
    
   static func marvels() -> [Marvel]{
        var dummyProducts = [Marvel]()
        (0...20).forEach{ index in
            let dummyProduct = Marvel(id: UUID().uuidString, title: "Product \(index)", image: URL(string: "https://i.annihil.us/u/prod/marvel/i/mg/c/e0/535fecbbb9784.jpg")!, description: "The best")
            dummyProducts.append(dummyProduct)
        }
        return dummyProducts
    }
    
    static func marvelDTOs(count: Int) -> [MarvelDTO]{
         var dummyProducts = [MarvelDTO]()
         (0..<count).forEach{ index in
            let id = Int.random(in: 0...1000)
            let dummyProduct = MarvelDTO(id: id, name: "Random Product \(id)", description: "\(Int.random(in: 1...25)).00 USD", thumbnail: ThumbnailDTO(path: "https://i.annihil.us/u/prod/marvel/i/mg/c/e0/535fecbbb9784", ext: "jpg"))
             dummyProducts.append(dummyProduct)
         }
        return dummyProducts.sorted(by: {$0.id < $1.id})
     }
    
    static func productDTO(id: String) -> MarvelDTO {
        return MarvelDTO(id: Int(id)!, name: "Dummy Product with ID: \(id)", description: "\(Int.random(in: 1...25)).00 USD", thumbnail: ThumbnailDTO(path: "https://i.annihil.us/u/prod/marvel/i/mg/c/e0/535fecbbb9784", ext: "jpg"))
    }
    
    static func marvel() -> Marvel {
        return Marvel(id: "123", title: "Iron Man", image: URL(string: "https://i.annihil.us/u/prod/marvel/i/mg/c/e0/535fecbbb9784.jpg")!, description: "Iron Man is a superhero appearing in American comic books published by Marvel Comics. The character was co-created by writer and editor Stan Lee, developed by scripter Larry Lieber, and designed by artists Don Heck and Jack Kirby. The character made his first appearance in Tales of Suspense #39 (cover dated March 1963), and received his own title in Iron Man #1 (May 1968). Also in 1963, the character founded the Avengers alongside Thor, Ant-Man, Wasp and the Hulk.")
    }
    
    static func comicDTOs(count: Int) -> [ComicDTO] {
        var data = [ComicDTO]()
        (0..<count).forEach{ index in
            let comicDTO = ComicDTO(id: index, title: "Comic \(index)", thumbnail: ThumbnailDTO(path: "https://i.annihil.us/u/prod/marvel/i/mg/c/e0/535fecbbb9784", ext: "jpg"))
            data.append(comicDTO)
        }
        return data
    }
}
