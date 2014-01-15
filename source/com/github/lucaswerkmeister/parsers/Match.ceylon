shared interface Match {
    shared formal Integer offset;
    shared formal Integer length;
    shared formal String type;
    shared formal {Match*} children;
    shared formal Boolean mightHaveOtherMatches;
}