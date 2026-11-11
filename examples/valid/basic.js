
// 1. Reserved Keywords
break;
case 1:
catch (error) {}
class MyClass {}
continue;
debugger;
default:
delete obj;
do {} while (false);
else {}
export default MyClass;
extends;
finally {}
for (;;) break;
function myFunction() {}
if (true) {}
import something from "module";
"item" in obj;
obj instanceof MyClass;
new MyClass();
returnValue();
super.method();
switch (value) {}
this.value;
throw new Error("error");
try {} catch (e) {}
typeof value;
void 0;
while (false) {}
with (obj) {}
await promise;
yield value;

// 2. Variables
var oldVariable = 10;
let newVariable = 20;
const constantVariable = 30;

// 3. Boolean and Null
true;
false;
null;

// 4. Decimal Integers
0;
1;
10;
123;
999999;
1_000;
12_345_678;

// 5. Floating Point
1.5;
0.5;
10.0;
123.456;
1.;
.5;

// 6. Scientific Notation
1e5;
1E5;
1e+5;
1e-5;
2.5e10;
3.14E-2;

// 7. Hexadecimal
0x0;
0x1;
0xFF;
0xABC123;
0xff_ff;

// 8. Octal
0o0;
0o7;
0o17;
0o755;

// 9. Binary
0b0;
0b1;
0b1010;
0b1111_0000;

// 10. BigInt
10n;
1000n;
0xFFn;
0o77n;
0b1010n;

// 11. Strings
"Hello";
"Hello World";
"12345";
"";
'Hello';
'Hello World';
'JavaScript';
'';
"Hello\nWorld";
"Hello\tWorld";
"Quote: \"";
'Quote: \'';
"Backslash: \\\\";

// 12. Template Literals
`Hello World`;
``;
`Hello ${name}`;
`Result: ${10 + 20}`;
`Name: ${name}, Age: ${age}`;
`Object: ${{name: "Ali", age: 20}.name}`;
`Outer ${`Inner ${value}`}`;
`This is a \`backtick\``;

// 13. Assignment Operators
a = 10;
a += 5;
a -= 5;
a *= 2;
a /= 2;
a %= 3;
a **= 2;
a <<= 1;
a >>= 1;
a >>>= 1;
a &= 1;
a |= 1;
a ^= 1;
a &&= true;
a ||= false;
a ??= 10;

// 14. Comparison Operators
a === b;
a !== b;
a == b;
a != b;
a <= b;
a >= b;
a < b;
a > b;

// 15. Arithmetic Operators
a++;
a--;
++a;
--a;
a ** b;
a + b;
a - b;
a * b;
a / b;
a % b;

// 16. Logical and Bitwise
a && b;
a || b;
a ?? b;
!a;
a & b;
a | b;
a ^ b;
~a;
a << b;
a >> b;
a >>> b;

// 17. Other Operators
const add = (a, b) => a + b;
obj?.name;
obj?.method();
const result = condition ? "Yes" : "No";
const numbers = [...array];

// 18. Punctuation
(
);
{
}
[
]
;
,
.
:

// 19. Identifiers
name;
myVariable;
userName;
_private;
$element;
variable123;
_value_123;
$123;
متغير;
café;
变量;

// 20. Comments

// Single line comment

/*
 Multi-line comment
 Second line
 Third line
*/

/* Empty comment */

// 21. Whitespace
var spaceTest = 1;
var
    newlineTest
        =
        2;

// 22. Combined Expressions
const user = {
    name: "Ali",
    age: 22,
    active: true,
    score: 95.5
};

function calculate(a, b) {
    const result = (a + b) * 2;
    return result;
}

const message = `Welcome ${user.name}`;

if (user.active && user.age >= 18) {
    console.log(message);
} else {
    console.log("Access denied");
}

const values = [1, 2, 3, 4];

for (let i = 0; i < values.length; i++) {
    values[i] += 1;
}
