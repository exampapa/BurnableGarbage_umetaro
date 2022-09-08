//
//  PhotoList.swift
//  BurnableGarbage
//
//  Created by 佐小田弘道 on 2022/08/28.
//

import Foundation

var photoArray: [PhotoData] = makeData()

struct PhotoData: Identifiable {
    var id: Int
    var image: String
}

func makeData()-> [PhotoData] {
    var dataArray: [PhotoData] = []
    dataArray.append(PhotoData(id: 1, image: "shoes"))
    dataArray.append(PhotoData(id: 2, image: "nuigurumi"))
    dataArray.append(PhotoData(id: 3, image: "kamigomi"))
    dataArray.append(PhotoData(id: 4, image: "kutsushita"))
    dataArray.append(PhotoData(id: 5, image: "namagomi"))
    
    return dataArray
}
