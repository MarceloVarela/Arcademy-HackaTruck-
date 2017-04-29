//
//  Publishers.swift
//  Estudo
//
//  Created by Student on 4/27/16.
//  Copyright © 2016 Student. All rights reserved.
//
import UIKit

class Publishers
{
    private var publishers = [Publisher]()
    private var immutablePublishers = [Publisher]()
    private var sections = [String]()
    
    // MARK: - Public
    
    var numberOfPublishers: Int {
        return publishers.count
    }
    
    var numberOfSections: Int {
        return sections.count
    }
    
    init()
    {
        publishers = createPublishers()
        immutablePublishers = publishers
        sections = ["Favoritos", "Noticias", "Aulas", "Avisos"]
    }
    
    func deleteItemsAtIndexPaths(indexPaths: [NSIndexPath])
    {
        var indexes = [Int]()
        for indexPath in indexPaths {
            indexes.append(absoluteIndexForIndexPath(indexPath))
        }
        var newPublishers = [Publisher]()
        for (index, publisher) in publishers.enumerate() {
            if !indexes.contains(index) {
                newPublishers.append(publisher)
            }
        }
        publishers = newPublishers
    }
    
    func movePublisherFromIndexPath(indexPath: NSIndexPath, toIndexPath newIndexPath: NSIndexPath) {
        if indexPath != newIndexPath {
            let index = absoluteIndexForIndexPath(indexPath)
            let publisher = publishers[index]
            publisher.section = sections[newIndexPath.section]
            let newIndex = absoluteIndexForIndexPath(newIndexPath)
            publishers.removeAtIndex(index)
            publishers.insert(publisher, atIndex: newIndex)
        }
    }
    
    func indexPathForNewRandomPublisher() -> NSIndexPath
    {
        let index = Int(arc4random_uniform(UInt32(immutablePublishers.count)))
        let publisherToCopy = immutablePublishers[index]
        let newPublisher = Publisher(copies: publisherToCopy)
        publishers.append(newPublisher)
        publishers.sortInPlace { $0.section < $1.section }
        return indexPathForPublisher(newPublisher)
    }
    
    func indexPathForPublisher(publisher: Publisher) -> NSIndexPath
    {
        let section = sections.indexOf(publisher.section)
        var item = 0
        for (index, currentPublisher) in publishersForSection(section!).enumerate() {
            if currentPublisher === publisher {
                item = index
                break
            }
        }
        return NSIndexPath(forItem: item, inSection: section!)
    }
    
    func numberOfPublishersInSection(index: Int) -> Int {
        let publishers = publishersForSection(index)
        return publishers.count
    }
    
    func publisherForItemAtIndexPath(indexPath: NSIndexPath) -> Publisher? {
        if indexPath.section > 0 {
            let publishers = publishersForSection(indexPath.section)
            return publishers[indexPath.item]
        } else {
            return publishers[indexPath.item]
        }
    }
    
    func titleForSectionAtIndexPath(indexPath: NSIndexPath) -> String?
    {
        if indexPath.section < sections.count {
            return sections[indexPath.section]
        }
        return nil
    }
    
    // MARK: - Private
    
    private func createPublishers() -> [Publisher]
    {
        var newPublishers = [Publisher]()
        newPublishers += Favoritos.publishers()
        newPublishers += Noticias.publishers()
        newPublishers += Aulas.publishers()
        newPublishers += Avisos.publishers()
        return newPublishers
    }
    
    private func absoluteIndexForIndexPath(indexPath: NSIndexPath) -> Int
    {
        var index = 0
        for i in 0..<indexPath.section {
            index += numberOfPublishersInSection(i)
        }
        index += indexPath.item
        return index
    }
    
    private func publishersForSection(index: Int) -> [Publisher] {
        let section = sections[index]
        let publishersInSection = publishers.filter {
            (publisher: Publisher) -> Bool in return publisher.section == section
        }
        return publishersInSection
    }
}

class Favoritos
{
    class func publishers() -> [Publisher]
    {
        var publishers = [Publisher]()
        publishers.append(Publisher(title: "Swift", url: "https://developer.apple.com/swift/", image: UIImage(named: "5")!, section: "Favoritos"))
        publishers.append(Publisher(title: "Matemática", url: "https://www.youtube.com/watch?v=2dO6Zquwp30", image: UIImage(named: "1")!, section: "Favoritos"))
        publishers.append(Publisher(title: "Geografia", url: "http://descomplica.com.br/geografia", image: UIImage(named: "2")!, section: "Favoritos"))
        publishers.append(Publisher(title: "History", url: "http://seuhistory.com/noticias", image: UIImage(named: "4")!, section: "Favoritos"))
        publishers.append(Publisher(title: "Dicionário em Português", url: "https://dicionariodoaurelio.com", image: UIImage(named: "3")!, section: "Favoritos"))
        return publishers
    }
}

class Noticias
{
    class func publishers() -> [Publisher]
    {
        var publishers = [Publisher]()
        publishers.append(Publisher(title: "Swift com Uber!", url: "http://olhardigital.uol.com.br/pro/noticia/swift-o-concorrente-do-uber-criado-por-um-ex-motorista-do-uber/55744", image: UIImage(named: "6")!, section: "Noticias"))
        publishers.append(Publisher(title: "Times", url: "http://www.nytimes.com", image: UIImage(named: "TIME")!, section: "Noticias"))
        publishers.append(Publisher(title: "Desing do futuro!", url: "http://www.apple.com/br/imac/design/", image: UIImage(named: "7")!, section: "Noticias"))
        publishers.append(Publisher(title: "Revistas", url: "http://www.scientificamerican.com", image: UIImage(named: "Smithsonian")!, section: "Noticias"))
        publishers.append(Publisher(title: "TIME", url: "http://time.com", image: UIImage(named: "TIME")!, section: "Noticias"))
        publishers.append(Publisher(title: "The Huffington Post", url: "http://www.huffingtonpost.com", image: UIImage(named: "The Huffington Post")!, section: "Noticias"))
        return publishers
    }
}

class Aulas
{
    class func publishers() -> [Publisher]
    {
        var publishers = [Publisher]()
        publishers.append(Publisher(title: "Historia Geral", url: "http://seuhistory.com/noticias", image: UIImage(named: "4")!, section: "Aulas"))
        publishers.append(Publisher(title: "Aulas gravadas", url: "https://www.youtube.com/watch?v=2dO6Zquwp30", image: UIImage(named: "1")!, section: "Aulas"))
        publishers.append(Publisher(title: "Inglês", url: "http://galandra.myshopify.com", image: UIImage(named: "8")!, section: "Aulas"))
        publishers.append(Publisher(title: "Smithsonian", url: "http://www.smithsonianmag.com/?no-ist", image: UIImage(named: "Smithsonian")!, section: "Aulas"))
        publishers.append(Publisher(title: "Wallpaper", url: "http://www.wallpaper.com", image: UIImage(named: "Wallpaper")!, section: "Aulas"))
        publishers.append(Publisher(title: "Sunset", url: "http://www.sunset.com", image: UIImage(named: "Sunset")!, section: "Aulas"))
        return publishers
    }
}

class Avisos
{
    class func publishers() -> [Publisher]
    {
        var publishers = [Publisher]()
        publishers.append(Publisher(title: "WIRED", url: "http://www.wired.com", image: UIImage(named: "WIRED")!, section: "Avisos"))
        publishers.append(Publisher(title: "Re/code", url: "http://recode.net", image: UIImage(named: "Recode")!, section: "Avisos"))
        publishers.append(Publisher(title: "Quartz", url: "http://qz.com", image: UIImage(named: "Quartz")!, section: "Avisos"))
        publishers.append(Publisher(title: "Daring Fireball", url: "http://daringfireball.net", image: UIImage(named: "Daring Fireball")!, section: "Avisos"))
        publishers.append(Publisher(title: "MIT Technology Review", url: "http://www.technologyreview.com", image: UIImage(named: "MIT Technology Review")!, section: "Aulas"))
        return publishers
    }
}















