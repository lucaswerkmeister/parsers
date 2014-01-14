shared class SeveralOf(
    Range<Integer> howMany,
    PatternOrSugar pattern,
    String? name = null,
    Boolean verify(String match) => true)
    satisfies Pattern {
    
    Pattern actualPattern = desugar(pattern);
    
    shared actual Integer? attemptMatch(Matcher matcher) {
        // TODO implement
        return nothing;
    }
}
