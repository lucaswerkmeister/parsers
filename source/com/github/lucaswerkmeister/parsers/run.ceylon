"A draft for usage of the `patterns` library."
shared void run() {
    Pattern byte = SeveralOf {
        name = "byte";
        1..3;
        '0'..'9';
        Boolean verify(String match)
            => (0 <= (parseInteger(match) else -1) <= 255);
    };
    Pattern ip4 = Concatenation {
        byte, ".", byte, ".", byte, ".", byte
    };
    String input = process.arguments.first else "127.0.0.1";
    value result = match(ip4, input);
    print("'``input``' ``result.matched then "is" else "isn’t"`` a valid IPv4 address.");
}
