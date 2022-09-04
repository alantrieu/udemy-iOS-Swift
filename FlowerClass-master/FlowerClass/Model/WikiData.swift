
import Foundation

protocol WikiData {
    func passWikiData(wikiExtract: String, wikiFlowerImage: String)
}

struct GetWikiData {
    
    var delegate: WikiData?
    
    func performRequest(with flowerName: String) {
        
        let baseWikiURL = "https://en.wikipedia.org/w/api.php?format=json&action=query&exintro=&explaintext=&redirects=1&pithumbsize=500&indexpageids&prop=extracts|pageimages&titles="
        let wikiURL = "\(baseWikiURL)\(flowerName)"
        let urlString = wikiURL.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)
        
        guard let url = URL(string: urlString!) else { fatalError() }
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard let safeData = data else { return }
            if let wikiFlowerData = self.getJSON(safeData) {
                self.delegate?.passWikiData(wikiExtract: wikiFlowerData.description, wikiFlowerImage: wikiFlowerData.picture)
            }
        }
        .resume()
    }
    
    private func getJSON (_ safeData: Data) -> WikiResults? {
        
        let decoder = JSONDecoder()
        do {
            let flowers = try decoder.decode(FlowerModel.self, from: safeData)
            let flowersDict = flowers.query.pages
            if let pageKey = flowersDict.first?.key { //changing dictionary key captured here
                let wikiExtract = flowersDict[pageKey]!.extract // Dictionary that the changing key refers to
                let wikiFlowerImage = flowersDict[pageKey]!.thumbnail.source
                
                let wikiResults = WikiResults(description: wikiExtract, picture: wikiFlowerImage)
                return wikiResults
            }
        } catch {
            print(error)
        }
        return nil
    }
}


