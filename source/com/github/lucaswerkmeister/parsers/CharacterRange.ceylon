shared class CharacterRange(
    Range<Character> chars,
    shared actual String name = chars.string)
    satisfies Pattern {
    
    shared actual Match attemptMatch(Matcher matcher, {Match*} rejectedMatches) {
        if (exists char = matcher.lookahead().first, chars.contains(char)) {
            return matcher.matchHere { length = 1; mightHaveOtherMatches = false; };
        } else {
            return matcher.fail();
        }
    }
}
