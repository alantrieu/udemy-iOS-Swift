
import Foundation

struct FlowerModel: Decodable {
    let query: Query
}

struct Query: Decodable {
    let pageids: [String]
    let pages: [String : PageIdNumber]
}

//struct Pages: Decodable {
//    let pageIdNumber: PageIdNumber
//
//    enum CodingKeys: String, CodingKey {
//        case pageIdNumber = 1684516498
//    }
//}
// Finally this was not needed as the 'extract' was obtained directly from parsing the whole dictionary. However, I'm leaving this here as it was perfect to learn 'enum CodingKeys: String, CodingKey'

struct PageIdNumber: Decodable {
    let pageid: Int
    let ns: Int
    let title: String
    let thumbnail: Thumbnail
    let extract: String
}

struct Thumbnail: Decodable {
    let source: String
    let width: Int
    let height: Int
}


