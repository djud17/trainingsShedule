//
//  Training.swift
//  test_fitness
//
//  Created by Давид Тоноян  on 02.04.2022.
//

import Foundation

// MARK: - Trainings
struct Trainings: Codable {
    let trainers: [Trainer]
    let tabs: [TabElement]
    let lessons: [Lesson]
    let option: Option
}

// MARK: - Lesson
struct Lesson: Codable {
    let name, lessonDescription: String
    let place: Place
    let coachID, startTime, endTime, date: String
    let appointmentID, serviceID: String
    let availableSlots: Int
    let commercial, clientRecorded, isCancelled: Bool
    let tab: TabEnum
    let color: Color
    let tabID: Int

    enum CodingKeys: String, CodingKey {
        case name
        case lessonDescription = "description"
        case place
        case coachID = "coach_id"
        case startTime, endTime, date
        case appointmentID = "appointment_id"
        case serviceID = "service_id"
        case availableSlots = "available_slots"
        case commercial
        case clientRecorded = "client_recorded"
        case isCancelled = "is_cancelled"
        case tab, color
        case tabID = "tab_id"
    }
}

enum Color: String, Codable {
    case aa00Ff = "#AA00FF"
    case ff0000 = "#FF0000"
    case ff00Ff = "#FF00FF"
    case ffaa00 = "#FFAA00"
    case fff8Aa = "#FFF8AA"
    case ffff00 = "#FFFF00"
    case the00Aa00 = "#00AA00"
    case the0717Ff = "#0717FF"
    case the55Aaff = "#55AAFF"
    case the55Ff7F = "#55FF7F"
    case the55Ffff = "#55FFFF"
}

enum Place: String, Codable {
    case the50МетровыйБассейн = "50 метровый бассейн"
    case большойЗалОлимпияSPORT = "Большой зал ОлимпияSPORT"
    case детскийБассейн = "Детский бассейн"
    case малыйЗалОлимпияSPORT = "Малый зал ОлимпияSPORT"
    case тренировкаНаСвежемВоздухе = "Тренировка на свежем воздухе"
    case функциональнаяЗонаОлимпияСпорт = "Функциональная зона Олимпия Спорт"
}

enum TabEnum: String, Codable {
    case бассейн = "Бассейн"
    case боевыеИскусства = "Боевые искусства"
    case водныеУроки = "Водные уроки"
    case детскиеВодныеПрограммы = "Детские водные программы"
    case детскийКлуб = "Детский клуб"
    case кардиопрограммы = "Кардиопрограммы"
    case разумИТело = "Разум и тело"
    case силовыеПрограммы = "Силовые программы"
    case танцевальныеУроки = "Танцевальные уроки"
    case урокиСмешанногоФормата = "Уроки смешанного формата"
    case функциональныйТренинг = "Функциональный тренинг"
}

// MARK: - Option
struct Option: Codable {
    let clubName, linkAndroid, linkIos, primaryColor: String
    let secondaryColor: String

    enum CodingKeys: String, CodingKey {
        case clubName = "club_name"
        case linkAndroid = "link_android"
        case linkIos = "link_ios"
        case primaryColor = "primary_color"
        case secondaryColor = "secondary_color"
    }
}

// MARK: - TabElement
struct TabElement: Codable {
    let id: Int
    let name: TabEnum
}

// MARK: - Trainer
struct Trainer: Codable {
    let id, fullName, name, lastName: String
    let position: String
    let imageURL, imageURLSmall, imageURLMedium: String
    let trainerDescription: String

    enum CodingKeys: String, CodingKey {
        case id
        case fullName = "full_name"
        case name
        case lastName = "last_name"
        case position
        case imageURL = "image_url"
        case imageURLSmall = "image_url_small"
        case imageURLMedium = "image_url_medium"
        case trainerDescription = "description"
    }
}
