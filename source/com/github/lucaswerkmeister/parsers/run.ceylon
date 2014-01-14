"A draft for usage of the `patterns` library."
shared void run() {
    Pattern byte = SeveralOf {
        name = "byte";
        1..3;
        CharacterRange {
            '0'..'9';
        };
        Boolean verify(String match) {
            return 0 <= parseInteger(match) <= 255;
        };
    };
    Pattern ip4 = Concatenation {
        byte, ".", byte, ".", byte, ".", byte
    };
    String input = process.arguments.first else "127.0.0.1";
    value result = Matcher(ip4).match(input);
    print("'``input``' ``result.matched then "is" else "isn’t"`` a valid IPv4 address.");
}