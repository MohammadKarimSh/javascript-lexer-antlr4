
// 1. Invalid Octal
09;

// 2. Invalid Hexadecimal
0x;

// 3. Invalid Binary
0b2;

// 4. Invalid Octal Prefix
0o8;

// 5. Exponent without digits
1e;

// 6. Numeric Separator Errors
1_;
1__0;

// 7. Identifier after number
3abc;
1.5abc;

// 8. Invalid Characters
@;
#;
