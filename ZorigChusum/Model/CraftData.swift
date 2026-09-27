//
//  CraftData.swift
//  ZorigChusum
//
//  The array holding all thirteen Craft values.
//

import Foundation

let crafts: [Craft] = [
    Craft(id: 1, name: "Shingzo", englishName: "Carpentry", imageName: "shingzo",
          description: "Shingzo is the art of carpentry and woodwork. Bhutanese master carpenters (zowpons) raise dzongs, temples, bridges and farmhouses using timber joints that interlock without nails, often working from memory rather than written plans.",
          material: .wood,
          funFact: "Many of Bhutan's great dzongs were built without a single iron nail. The beams simply lock into one another."),

    Craft(id: 2, name: "Dozo", englishName: "Masonry", imageName: "dozo",
          description: "Dozo is the art of masonry. Masons build the thick, tapering stone walls of dzongs and chortens, and the rammed-earth walls of traditional houses, where damp earth is pounded layer by layer inside wooden frames.",
          material: .earth,
          funFact: "Rammed-earth walls are pounded by teams of builders, often women, who sing traditional work songs to keep the rhythm."),

    Craft(id: 3, name: "Parzo", englishName: "Carving", imageName: "parzo",
          description: "Parzo is the art of carving in wood, stone and slate. Carvers make ornate pillars, window frames and masks for sacred dances, as well as the wooden blocks used to print prayer flags and religious texts.",
          material: .wood,
          funFact: "Every prayer flag you see fluttering on a hillside was printed from a hand-carved wooden block."),

    Craft(id: 4, name: "Lhazo", englishName: "Painting", imageName: "lhazo",
          description: "Lhazo is the art of painting. Artists create thangkas (religious scroll paintings), temple murals and the colourful motifs that decorate Bhutanese buildings, following strict rules of proportion and iconography passed down from teacher to student.",
          material: .paint,
          funFact: "Traditional painters grind their colours from natural minerals, stones and plants."),

    Craft(id: 5, name: "Jinzo", englishName: "Sculpting", imageName: "jinzo",
          description: "Jinzo is the art of clay sculpture. Sculptors shape statues of deities and saints for temples, ritual objects, masks and small votive chortens (tsha-tsha), as well as traditional clay pots.",
          material: .earth,
          funFact: "Tsha-tsha are tiny clay chortens pressed from moulds and left in caves, shrines and at sacred places."),

    Craft(id: 6, name: "Lugzo", englishName: "Bronze-casting", imageName: "lugzo",
          description: "Lugzo is the art of casting bronze and other metals. Using the lost-wax method, casters produce statues, ritual bells, butter lamps and other sacred instruments used in monasteries and homes.",
          material: .metal,
          funFact: "In lost-wax casting, a wax model is covered in clay and melted out, leaving a mould for the molten bronze."),

    Craft(id: 7, name: "Garzo", englishName: "Blacksmithing", imageName: "garzo",
          description: "Garzo is the art of blacksmithing. Smiths forge iron into swords, knives, axes, farming tools and chains, working metal over a fire and anvil with hammers.",
          material: .metal,
          funFact: "The 15th-century saint Thangtong Gyalpo is famous for building iron chain suspension bridges across Himalayan rivers."),

    Craft(id: 8, name: "Troeko", englishName: "Ornament-making", imageName: "troeko",
          description: "Troeko is the art of making ornaments in gold, silver and copper. Silversmiths and goldsmiths craft jewellery such as the koma brooches that fasten the kira, as well as rings, amulet boxes and decorated containers, often set with turquoise and coral.",
          material: .metal,
          funFact: "A pair of koma brooches, usually joined by a chain, holds the kira in place at the shoulders."),

    Craft(id: 9, name: "Tsharzo", englishName: "Cane and bamboo work", imageName: "tsharzo",
          description: "Tsharzo is the art of cane and bamboo weaving. Craftspeople make bangchung (lidded food baskets), palang (containers for drinks), mats, baskets, bows and arrows from split cane and bamboo.",
          material: .fibre,
          funFact: "Bangchung are woven so tightly that they can hold rice, and they are a favourite gift and lunch box."),

    Craft(id: 10, name: "Thagzo", englishName: "Weaving", imageName: "thagzo",
          description: "Thagzo is the art of weaving. Weavers, most of them women, use backstrap and horizontal looms to create the fabric for the gho and kira, with detailed patterns in silk, cotton, wool and nettle fibre.",
          material: .fibre,
          funFact: "A richly patterned kira can take many months, or even a year, to weave by hand."),

    Craft(id: 11, name: "Tshemzo", englishName: "Tailoring, embroidery & appliqué", imageName: "tshemzo",
          description: "Tshemzo is the art of tailoring, embroidery and appliqué. Artisans sew clothing, ceremonial boots (tsholham) and religious textiles, including the enormous appliqué thongdrels unveiled at dawn during festivals.",
          material: .fibre,
          funFact: "Some thongdrels are several storeys tall and are shown only for a few hours, once a year."),

    Craft(id: 12, name: "Shagzo", englishName: "Woodturning", imageName: "shagzo",
          description: "Shagzo is the art of woodturning. Turners shape wood, especially knotted burls, on a lathe into bowls, cups and lidded containers such as the dapa, often finished with lacquer.",
          material: .wood,
          funFact: "Trashiyangtse in eastern Bhutan is especially well known for its turned wooden bowls."),

    Craft(id: 13, name: "Deh-sho", englishName: "Paper-making", imageName: "dehsho",
          description: "Deh-sho is the art of traditional paper-making. Paper makers boil and beat the inner bark of the daphne shrub into pulp, then lift thin sheets from water on a frame. The strong paper is used for religious texts, prayer flags and official documents.",
          material: .fibre,
          funFact: "Daphne paper is strong and long-lasting, which is why it is trusted for sacred texts."),
]
