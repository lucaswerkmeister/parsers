import ceylon.collection { ArrayList }

shared class SeveralOf(
    Range<Integer> howMany,
    PatternOrSugar pattern,
    shared actual String name = "[ ``howMany.string`` of ``pattern``]",
    Boolean verify(String match) => true,
    Eagerness eagerness = greedy)
    satisfies Pattern {
    
    Pattern actualPattern = desugar(pattern);
    
    shared actual Match attemptMatch(Matcher matcher, {Match*} rejectedMatches) {
        {Integer+} order;
        if (lazy == eagerness) {
            order = howMany;
        } else {
            order = howMany.reversed;
        }
        for (i in order) {
            ArrayList<Match> matches = ArrayList<Match>(i);
            variable Integer j = 0;
            while (j < i-1) {
                value potentialMatch = matcher.tryMatch(actualPattern);
                if (is Match potentialMatch) {
                    j++;
                    matches.set(j, potentialMatch);
                } else {
                    // backtrack
                    j--;
                    if (j == -1) {
                        // backtracked behind the first token
                       break;
                    }
                }
            }
            if (j == -1) {
                // no matches found
                if (lazy == eagerness) {
                    // if i tokens couldn’t match anything, i+1, i+2, ... tokens won’t be able to match either
                    break;
                } else {
                    // let’s try with fewer tokens
                    continue;
                }
            } else {
                return matcher.matchHere {
                    matches;
                    mightHaveOtherMatches = i != order.last || matches.any(Match.mightHaveOtherMatches);
                };
            }
        }
        return matcher.fail();
    }
}
