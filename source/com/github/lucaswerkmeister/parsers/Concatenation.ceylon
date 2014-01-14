shared class Concatenation(
    {PatternOrSugar*} patterns)
    satisfies Pattern {
    
    {Pattern*} actualPatterns = patterns.map(desugar);
    
    shared actual Integer? attemptMatch(Matcher matcher) {
        // TODO implement
        return nothing;
    }
}
