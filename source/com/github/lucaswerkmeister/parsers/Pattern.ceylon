shared interface Pattern {
    
    shared formal String name;
    
    "Matches the pattern or throws a [[NoMatchException]]."
    shared formal Match attemptMatch(
        "The matcher to work with."
        Matcher matcher,
        "A series of matches that this pattern previously returned at the same location
         but which were rejected by an upstream pattern."
        {Match*} rejectedMatches);
}

shared abstract class Eagerness() of lazy|greedy { }
shared object lazy extends Eagerness() { }
shared object greedy extends Eagerness() { }
