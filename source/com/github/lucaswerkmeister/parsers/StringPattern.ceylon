shared class StringPattern(
    String pattern,
    shared actual String name = pattern)
    satisfies Pattern {
    
    shared actual Match attemptMatch(Matcher matcher, {Match*} rejectedMatches) {
        value la = matcher.lookahead().iterator();
        value it = pattern.iterator();
        variable Integer length = 0; // we count length ourselves so String.length doesn’t need to do it when we iterate over the string anyways
        for(Character c in pattern) {
            if(la.next()!=it.next()) {
                return matcher.fail();
            }
            length++;
        }
        return matcher.matchHere { length = length; mightHaveOtherMatches = false; };
    }
}
