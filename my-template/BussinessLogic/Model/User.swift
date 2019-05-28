//
//  User.swift
//  OnaChat
//
//  Created by 島田智貴 on 2019/05/08.
//  Copyright © 2019 Tomozip. All rights reserved.
//

import Foundation

struct User {

    let name: String
    let age: Int
    let location: String
    let bio: String
    let audienceCount: Int
    let pictures: [UserPicture]
}

struct UserPicture {
    let URLString: String
}

extension User {
    static var mockData: [User] {
        return [
            User(name: "かほ", age: 23, location: "東京", bio: "メンヘラ入ってるかほです(*´艸｀*)\n低浮上なので見つけれたらラッキーですね♥\n見つけられた人はぜひお話しましょ！\n\n♡ちっぱいですがよろしくです♡", audienceCount: 38, pictures: [UserPicture(URLString: "https://storage.googleapis.com/ona-chat/notEro/1.jpg")]),
            User(name: "まい", age: 24, location: "東京", bio: "まだまだ不慣れなところもたくさんあるから、無言で放置されるとどうしていいか分からなくなるから、優しくリードしてくれると、心も体も開いちゃいます//\nまいのカラダ、たくさん調教してください♡", audienceCount: 22, pictures: [UserPicture(URLString: "https://storage.googleapis.com/ona-chat/notEro/2.jpg")]),
            User(name: "ゆー", age: 21, location: "埼玉", bio: "ゆーです。\n皆様初めまして★\n\n実は私、人妻です(*´艸｀*)", audienceCount: 8, pictures: [UserPicture(URLString: "https://storage.googleapis.com/ona-chat/notEro/3.jpg")]),
            User(name: "のんちゃん", age: 22, location: "北海道", bio: "皆さん　こんにちは\n色々と宜しくお願いします。\n清く正しく美しく\nが、もっとうです。\nお顔は、ライブで・・・。|дﾟ)チラッ\n宜しくお願いします。(//△//)照←極度の人見知り", audienceCount: 21, pictures: [UserPicture(URLString: "https://storage.googleapis.com/ona-chat/notEro/4.jpg")]),
            User(name: "らら", age: 25, location: "栃木", bio: "恥ずかしがり屋の性格なので、誰にも言えず\nえっちなことを一人で妄想してる毎日です・・・\n日々、自分を慰めて切ない気持ちになっています", audienceCount: 18, pictures: [UserPicture(URLString: "https://storage.googleapis.com/ona-chat/notEro/5.jpg")]),
            User(name: "いちご", age: 28, location: "東京", bio: "よろしくおねがいします！！", audienceCount: 20, pictures: [UserPicture(URLString: "https://storage.googleapis.com/ona-chat/notEro/6.jpg")]),
            // User(name: "モモ", age: 24, location: "愛知", bio: "よろしくおねがいします！！", audienceCount: 42, pictures: [UserPicture(URLString: "https://storage.googleapis.com/ona-chat/users/7.jpg")]),
            //  User(name: "mina", age: 30, location: "宮城", bio: "よろしくおねがいします！！", audienceCount: 38, pictures: [UserPicture(URLString: "https://storage.googleapis.com/ona-chat/users/8.png")]),
            //  User(name: "mina", age: 21, location: "宮城", bio: "よろしくおねがいします！！", audienceCount: 38, pictures: [UserPicture(URLString: "https://storage.googleapis.com/ona-chat/users/9.png")]),
        ]
    }
}
