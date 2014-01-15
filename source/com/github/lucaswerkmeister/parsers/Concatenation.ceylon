shared class Concatenation(
    {PatternOrSugar*} patterns,
    shared actual String name = "(``",".join(patterns.map(desugar).map(Pattern.name))``)")
    satisfies Pattern {
    
    {Pattern*} actualPatterns = patterns.map(desugar);
    
    shared actual Match attemptMatch(Matcher matcher, {Match*} rejectedMatches) {
        {Match*} matches = {
            for (Pattern pattern in actualPatterns)
                matcher.requireMatch(pattern)
        };
        return matcher.matchHere { matches; };
    }
}
