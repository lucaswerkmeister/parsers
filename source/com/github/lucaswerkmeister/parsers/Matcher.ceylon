shared interface Matcher {
    
    shared formal Match|NoMatchException tryMatch(Pattern pattern);
    
    shared formal Match requireMatch(Pattern pattern);
    
    shared formal {Character*} lookahead();
    
    shared formal Match matchHere(
        {Match*} children = empty,
        "The length of the match, or in other words, how many characters this match consumes.
         
         Default: the length of all [[children]] combined."
        Integer length = children.fold(0, (Integer partial, Match element) => partial + element.length),
        "If the [[Pattern]] might produce a different match when you ask it again and exclude this match
         (see [[Pattern.attemptMatch.rejectedMatches]]).
         
         For example, consider the pattern “An arbitrary amount of `'a'`s, followed by a single `'a'`” with the input `'aaa'`.
         If the first part of the pattern is matched “[[greedily|greedy]]”, it will consume the entire input, leaving nothing for the second part.
         However, the first pattern can also match less `'a'`s, so if we retry to match the combination and tell the first pattern
         that matching `'aaa'` did not lead to success, it can match less of the input, leaving an `'a'` for the second pattern.
         On the other hand, the second pattern has no choice in its matching, and if it didn’t match in some location, then
         there’s no point in retrying that match over and over again.
         
         The default is
             children.any(Match.mightHaveOtherMatches)
         that is, if one of the [[child patterns|children]] might match differently, the whole pattern might match differently."
        Boolean mightHaveOtherMatches = children.any(Match.mightHaveOtherMatches));
    
    shared formal Match fail(); // does not actually return
}

shared class NoMatchException(
    Pattern pattern) extends Exception() { }
