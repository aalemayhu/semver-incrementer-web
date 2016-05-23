import Vapor

let app = Application()

app.get("/") { request in
	return try app.view("welcome.html")
}

app.get(":version/:incr") { request in
    let sm = SemverIncrementer()
    let params = request.parameters
    guard let version = params["version"],
    let incr = params["incr"] else {
        return Response(status: .badRequest, text: "")
    }
    if version == "undefined" || incr == "undefined" {
        return Response(status: .badRequest, text: "")
    }
    return sm.formatted(originVersion: version, incrementBy: incr)
}

print("Visit http://localhost:8080")
app.start(port: 8080)
