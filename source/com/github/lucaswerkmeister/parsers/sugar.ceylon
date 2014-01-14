shared alias PatternOrSugar => Pattern|String|Range<Character>;

shared Pattern desugar(PatternOrSugar pattern) {
    switch(pattern)
    case (is Pattern) {
        return pattern;
    }
    case (is String) {
        return StringPattern(pattern);
    }
    case (is Range<Character>) {
        return CharacterRange(pattern);
    }
}
