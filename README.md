
# JavaScript Lexer — ANTLR4

مشروع بناء محلّل معجمي (Lexical Analyzer) للغة JavaScript باستخدام **ANTLR 4.13.2** و **Java 21**.

## 1. متطلبات التشغيل

قبل البدء، تأكد من توفر:

- Java JDK 21 أو إصدار متوافق.
- وجود ملف ANTLR التالي داخل المشروع:
  `lib/antlr-4.13.2-complete.jar`

لا نحتاج إلى Maven لتشغيل المشروع؛ نعتمد حالياً على أوامر التشغيل اليدوي حتى تكون خطوات البناء موحّدة لدى جميع أعضاء الفريق.

للتحقق من Java:

```bash
java -version
javac -version
```

## 2. تنزيل المشروع

استنسخ المستودع ثم انتقل إلى مجلده:

```bash
git clone https://github.com/MohammadKarimSh/javascript-lexer-antlr4.git
cd javascript-lexer-antlr4
```

استبدل `<REPOSITORY_URL>` برابط مستودع GitHub الخاص بالمشروع.

## 3. توليد ملفات ANTLR

كلما عدّلنا ملف القواعد:

`src/main/antlr4/JavaScriptLexer.g4`

يجب إعادة توليد ملفات Java باستخدام الأمر التالي من المجلد الرئيسي للمشروع:

```bash
java -jar lib/antlr-4.13.2-complete.jar \
-Dlanguage=Java \
-package com.compiler.lexer.generated \
-Xexact-output-dir \
-o generated \
src/main/antlr4/JavaScriptLexer.g4
```

سيتم وضع الملفات المولّدة داخل مجلد `generated/`.

**ملاحظة مهمة:** لا تضف تعريف `package` داخل `JavaScriptLexer.g4` باستخدام `@header`؛ لأننا نحدد الحزمة من خلال الخيار `-package` في أمر التوليد. استخدام الطريقتين معاً يؤدي إلى تكرار تعريف الحزمة وأخطاء في الترجمة.

## 4. ترجمة المشروع

بعد توليد ملفات ANTLR، نفّذ الأمر التالي لترجمة ملفات Java:

```bash
javac -cp "lib/antlr-4.13.2-complete.jar" \
-d out \
$(find src/main/java generated -name "*.java")
```

سيتم وضع ملفات `.class` الناتجة داخل مجلد `out/`.

## 5. تشغيل البرنامج

شغّل البرنامج باستخدام:

```bash
java -cp "out:lib/antlr-4.13.2-complete.jar" \
com.compiler.lexer.Main
```

على Linux وmacOS نستخدم `:` للفصل بين عناصر `classpath`. على Windows نستخدم `;` بدلاً منها.

## 6. تجربة ملفات JavaScript

توجد أمثلة للاختبار داخل:

- `examples/valid/` — أمثلة على شيفرات JavaScript صحيحة.
- `examples/invalid/` — أمثلة تحتوي على حالات غير صحيحة لاختبار اكتشاف الأخطاء.

يمكن تعديل النص داخل `Main.java` مؤقتاً، أو تطوير البرنامج لاحقاً ليقرأ ملف JavaScript من مسار يُمرّر عند التشغيل.

## 7. بنية المشروع

```text
.
├── docs/
│   ├── architecture.md
│   ├── grammar-conventions.md
│   └── token-catalog.md
├── examples/
│   ├── invalid/
│   └── valid/
├── generated/                 # ملفات ANTLR المولّدة
├── lib/
│   └── antlr-4.13.2-complete.jar
├── src/
│   └── main/
│       ├── antlr4/
│       │   └── JavaScriptLexer.g4
│       └── java/
│           └── com/compiler/lexer/
│               ├── engine/
│               ├── errors/
│               ├── output/
│               └── Main.java
├── .gitignore
└── README.md
```

## 8. قواعد العمل ضمن الفريق

للحفاظ على استقرار المشروع وتجنّب تعارض التعديلات:

1. لا تنفّذ العمل مباشرة على `main`.
2. اسحب آخر التعديلات من فرع `develop` قبل البدء.
3. أنشئ فرعاً مستقلاً للمهمة، مثلاً:

   ```bash
   git checkout develop
   git pull origin develop
   git checkout -b feature/your-task
   ```

4. بعد إنهاء المهمة، اختبر التوليد والترجمة والتشغيل.
5. ارفع الفرع وافتح Pull Request إلى `develop`.
6. لا تدمج تعديلات على `JavaScriptLexer.g4` دون التنسيق مع مسؤول دمج القواعد؛ فهذا الملف مشترك بين مهام أعضاء الفريق.

## 9. سير العمل بعد استلام أي تحديث

بعد سحب تحديثات الفريق، إذا كانت القواعد أو ملفات Java قد تغيّرت، نفّذ من جديد:

```bash
# 1. توليد ملفات ANTLR
java -jar lib/antlr-4.13.2-complete.jar \
-Dlanguage=Java \
-package com.compiler.lexer.generated \
-Xexact-output-dir \
-o generated \
src/main/antlr4/JavaScriptLexer.g4

# 2. ترجمة ملفات Java
javac -cp "lib/antlr-4.13.2-complete.jar" \
-d out \
$(find src/main/java generated -name "*.java")

# 3. تشغيل البرنامج
java -cp "out:lib/antlr-4.13.2-complete.jar" \
com.compiler.lexer.Main
```

إذا لم تتغير ملفات القواعد، يمكن تجاوز خطوة توليد ANTLR، لكن يجب إعادة الترجمة بعد تعديل ملفات Java.

---

**إصدار ANTLR المعتمد:** 4.13.2  
**إصدار Java المعتمد:** 21  
**طريقة البناء الحالية:** Manual Compilation (بدون Maven)

