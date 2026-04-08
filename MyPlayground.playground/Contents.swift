import UIKit

//QUESTION 1

//let allAttendees = [101, 102, 103, 104]
//
//let attendeeInterests: [Int: Set<String>] = [
//    101: ["tech", "ai", "gaming"],
//    102: ["marketing", "networking"],
//    103: ["tech", "design", "marketing"]
//]
//
//let sessionTags: [String: Set<String>] = [
//    "SessionAlpha": ["tech", "networking"],
//    "SessionBeta": ["ai", "cloud"],
//    "SessionGamma": ["marketing", "design", "business"]
//]
//
//var result: [Int: [String]] = [:]
//
//for attendee in allAttendees {
//    let interests = attendeeInterests[attendee] ?? []
//    var matchedSessions: [String] = []
//    
//    for (session, tags) in sessionTags {
//        if interests.intersection(tags).count > 0 {
//            matchedSessions.append(session)
//        }
//    }
//    
//    result[attendee] = matchedSessions
//    
//    print(result)
//}


//QUESTION 2///////////////////////////////////////////////////////////
//let users = [1, 2, 3, 4]
//
//let userSkills: [Int: [String]] = [
//    1: ["swift", "ios", "ui"],
//    2: ["backend", "node", "api"],
//    3: ["swift", "backend", "system-design"]
//]
//
//let projectRequirements: [String: [String]] = [
//    "ProjectA": ["swift", "ui"],
//    "ProjectB": ["backend", "api"],
//    "ProjectC": ["system-design", "cloud"]
//]

//Return a dictionary where each user ID maps to a list of projects they are eligible for.
//Expected Output
//[
//    1: ["ProjectA"],
//    2: ["ProjectB"],
//    3: ["ProjectA", "ProjectB", "ProjectC"],
//    4: []
//]

//var result: [Int: [String]] = [:]
//
//for id in users {
//    let setSkills = Set(userSkills[id] ?? [] )
//    var matched: [String] = []
//    
//    for (key, value) in projectRequirements {
//        
//        if setSkills.intersection(value).count > 0 {
//            matched.append(key)
//        }
//    }
//    result[id] = matched
//    
//    print(result)
//}


//QUESTION 3/////////////////////////////////////////////
//let attendees = [201, 202, 203, 204]
//
//let attendeeSkills: [Int: [String]] = [
//    201: ["swift", "ios", "ui"],
//    202: ["backend", "node", "api", "cloud"],
//    203: ["swift", "backend", "system-design"],
//    204: ["ui", "design"]
//]
//
//let workshops: [String: [String]] = [
//    "MobileWorkshop": ["swift", "ios"],
//    "BackendWorkshop": ["backend", "api"],
//    "ArchitectureWorkshop": ["system-design", "cloud"],
//    "DesignWorkshop": ["ui", "design"]
//]

//A user qualifies for a workshop only if they match at least TWO required skills.
//Expected Output
//[
//    201: ["MobileWorkshop"],
//    202: ["BackendWorkshop", "ArchitectureWorkshop"],
//    203: [],
//    204: ["DesignWorkshop"]
//]

//var result: [Int: [String]] = [:]
//
//for id in attendees {
//    let attendeeSkillSet = Set(attendeeSkills[id] ?? [])
//    var matched:[String] = []
//    
//    for (key , value) in workshops {
//        if attendeeSkillSet.intersection(Set(value)).count >= 2 {
//            matched.append(key)
//        }
//    }
//    
//    result[id] = matched
//}
//
//print(result)

//QUESTION 4//////////////////////////////////////////////////////////////////////////
//let attendees = [301, 302, 303]
//
//let attendeeSkills: [Int: [String]] = [
//    301: ["swift", "ios", "ui", "performance"],
//    302: ["backend", "api", "cloud", "security"],
//    303: ["swift", "backend", "cloud", "system-design"]
//]
//
//let workshops: [String: [String]] = [
//    "MobileDeepDive": ["swift", "ios", "performance"],
//    "BackendScaling": ["backend", "api", "cloud"],
//    "CloudArchitecture": ["cloud", "system-design"],
//    "SecurityBasics": ["security", "auth"]
//]

//Expected Output
//[
//    301: "MobileDeepDive",
//    302: "BackendScaling",
//    303: "BackendScaling"
//]

//var result: [Int: String] = [:]
//for id in attendees {
//    var skillsSet = Set(attendeeSkills[id] ?? [])
//    var highMatchSCoreWorkshop = ""
//    var currScore = 0
//    
//    for (key, value) in workshops {
//        
//        if skillsSet.intersection(Set(value)).count > currScore {
//            currScore = skillsSet.intersection(Set(value)).count
//            highMatchSCoreWorkshop = key
//        }
//    }
//    result[id] = highMatchSCoreWorkshop
//}
//
//print(result)

//QUESTION 5//////////////////////////////////////////////////////////////////////////
let candidates = [401, 402, 403, 404]

let candidateSkills: [Int: [String]] = [
    401: ["swift", "ios", "ui"],
    402: ["backend", "api", "cloud"],
    403: ["ml", "python", "data"],
    404: ["swift", "backend"]
]

let projectNeeds: [String: [String]] = [
    "MobileApp": ["swift", "ios"],
    "BackendService": ["backend", "api"],
    "MLPipeline": ["ml", "data"]
]

//Task
//
//Form a team of exactly TWO candidates per project such that:
//
//Together, the two candidates cover ALL required skills of the project
//
//Choose the team with the minimum number of extra (unused) skills
//
//If tied, choose the team whose candidate IDs sum is smallest

//Expected Output
//[
//    "MobileApp": [401, 404],
//    "BackendService": [402, 404],
//    "MLPipeline": [403, nil]   // only one candidate fits; second is nil
//]

var result:[String: [Int?]] = [:]

for (key,value) in projectNeeds {
    var team:[Int?] = []
    
    for id in candidates {
        var skillSet = Set(candidateSkills[id] ?? [])
        if skillSet.intersection(Set(value)).count > 0 {
            team.append(id)
        }
    }
    
    if team.count < 1 {
        team.append(nil)
    }
    
    result[key] = team
}

print(result)
