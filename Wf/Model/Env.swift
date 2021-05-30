//
//  ModelData.swift
//  Wf
//
//  Created by defu.li on 2021/5/5.
//

import Foundation



final class Env: ObservableObject {
    @Published var flows: [Flow] = loadFlows()
    @Published var currentJobType: JobType = .ListFilter
    @Published var feedback: String = "[{\"content\":\"content1\", \"desc\":\"desc1\", \"arg\": \"arg1\", \"id\": 1, \"imageName\":\"\"},{\"content\":\"content2\", \"desc\":\"desc2\", \"arg\": \"arg2\", \"id\": 2, \"imageName\":\"\"}]"
}


func loadFlows() -> [Flow]{
    let job1 = RunScript(id: "C894F8ED-2CC8-46DD-A1FC-683628CCF296", xpos: 160, ypos: 180)
    let job2 = RunScript(id:  "200D6FF7-2B7F-42FF-8B27-331B37ABC36C", xpos: 560, ypos: 60)
    let job3 = PostNotification(id: "6D2F020C-4B37-4402-AE34-3C7CA86B08DB", title: "翻译结果", xpos: 760, ypos: 60)
    
    let job4 = ListFilter(id:  "50ACFBA3-8F38-4842-B93A-3B021E6F7E2A", xpos: 360, ypos: 180)
    let job5 = RunScript(id: "7C8EEBA5-D292-4BFE-8B3A-C8F5BC22BE65", xpos: 560, ypos: 180)
    let job6 = CopyToClipboard(id: "ED513634-4FBC-4258-AF29-9F6214C05D28", xpos: 760, ypos: 180)
    
    let job7 = RunScript(id: "506F8893-E009-4F0F-92F3-4656785B9875", xpos: 560, ypos: 300)
    let job8 = PostNotification(id: "EF04F569-D9CF-4145-ACE0-4BD0B3DEF672", title: "有道词典生词本", xpos: 760, ypos: 300)
    
    
    let flow = Flow(jobs: [job1, job2, job3, job4, job5, job6, job7, job8],
                    connections: [
                        FlowConnection(srcJobId: "200D6FF7-2B7F-42FF-8B27-331B37ABC36C", destJobIds: ["6D2F020C-4B37-4402-AE34-3C7CA86B08DB"]),
                        FlowConnection(srcJobId: "506F8893-E009-4F0F-92F3-4656785B9875", destJobIds: ["EF04F569-D9CF-4145-ACE0-4BD0B3DEF672"]),
                        FlowConnection(srcJobId: "50ACFBA3-8F38-4842-B93A-3B021E6F7E2A", destJobIds: [
                                        "7C8EEBA5-D292-4BFE-8B3A-C8F5BC22BE65",
                                        "506F8893-E009-4F0F-92F3-4656785B9875",
                                        "200D6FF7-2B7F-42FF-8B27-331B37ABC36C"]),
                        FlowConnection(srcJobId: "7C8EEBA5-D292-4BFE-8B3A-C8F5BC22BE65", destJobIds: ["ED513634-4FBC-4258-AF29-9F6214C05D28"]),
                        FlowConnection(srcJobId: "C894F8ED-2CC8-46DD-A1FC-683628CCF296", destJobIds: ["50ACFBA3-8F38-4842-B93A-3B021E6F7E2A"]),
                    ])
    
    
    var flows = [Flow]()
    flows.append(flow)
    return flows
}


func loadScriptJobs() -> [RunScript]{
//    let job1 = RunScript(id: "C894F8ED-2CC8-46DD-A1FC-683628CCF296")
//    let job2 = RunScript(id:  "200D6FF7-2B7F-42FF-8B27-331B37ABC36C")
//    let job3 = RunScript(id: "6D2F020C-4B37-4402-AE34-3C7CA86B08DB")
//
//    let job4 = RunScript(id:  "50ACFBA3-8F38-4842-B93A-3B021E6F7E2A")
//    let job5 = RunScript(id: "7C8EEBA5-D292-4BFE-8B3A-C8F5BC22BE65")
//    let job6 = RunScript(id: "ED513634-4FBC-4258-AF29-9F6214C05D28")
//
//    let job7 = RunScript(id: "506F8893-E009-4F0F-92F3-4656785B9875")
//    let job8 = RunScript(id: "EF04F569-D9CF-4145-ACE0-4BD0B3DEF672")
//
//
//    return [job1, job2, job3, job4, job5, job6, job7, job8]
    
    return []
}


func load<T: Decodable>(_ filename: String) -> T {
    let data: Data

    guard let file = Bundle.main.url(forResource: filename, withExtension: nil)
        else {
            fatalError("Couldn't find \(filename) in main bundle.")
    }

    do {
        data = try Data(contentsOf: file)
    } catch {
        fatalError("Couldn't load \(filename) from main bundle:\n\(error)")
    }

    do {
        let decoder = JSONDecoder()
        return try decoder.decode(T.self, from: data)
    } catch {
        fatalError("Couldn't parse \(filename) as \(T.self):\n\(error)")
    }
}
