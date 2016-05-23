class SemverIncrementer {
    func formatted(originVersion: String, incrementBy: String) -> String {
        guard let version = Semver.fromString(str: originVersion.trim()) else {
            return "error:\(originVersion):not a valid version."
        }

        guard let by = Int(incrementBy) else {
            return "error:\(incrementBy) is not a valid increment value"
        }
        return version.increment(by: by).short
    }
}
