//
//  APIDataStructure.swift
//  Homework54IGJSON
//
//  Created by 黃柏嘉 on 2022/1/13.
//

import Foundation

struct APIData:Codable{
    let graphql:Graphql
    struct Graphql:Codable{
        let user:User
        struct User:Codable{
            let biography:String
            let external_url:String
            let edge_followed_by:EdgeFollowedBy
            let edge_follow:EdgeFollow
            let full_name:String
            let profile_pic_url_hd:URL
            struct EdgeFollowedBy:Codable{
                let count:Int
            }
            struct EdgeFollow:Codable{
                let count:Int
            }
            let edge_owner_to_timeline_media:EdgeOwnerToTimelineMedia
            struct EdgeOwnerToTimelineMedia:Codable{
                let count:Int
                let edges:[Edges]
                struct Edges:Codable{
                    var node:Node
                    struct Node:Codable{
                        let display_url:URL
                        let edge_media_to_caption:EdgeMediaToCaption
                        struct EdgeMediaToCaption:Codable{
                            var edges:[Edges]
                            struct Edges:Codable{
                                var node:Node
                                struct Node:Codable{
                                    var text:String
                                }
                            }
                        }
                        let edge_media_to_comment:EdgeMediaToComment
                        struct EdgeMediaToComment:Codable{
                            let count:Int
                        }
                        let edge_liked_by:EdgeLikedBy
                        struct EdgeLikedBy:Codable{
                            let count:Int
                        }
                        let taken_at_timestamp:Date
                    }
                }
            }
        }
    }
}






