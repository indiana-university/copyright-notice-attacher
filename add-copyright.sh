#!/bin/bash

add_copyright()
{
  # Source file = $1
  # Notice path = $2

  if ! grep -q SPDX-License-Identifier $1
  then
    cat $2 $1 > $1.new && mv $1.new $1
  fi
}

# C, C++, C#, Java, JavaScript, TypeScript
for i in $(find . -name '*.c' -o \
                  -name '*.cpp' -o \
                  -name '*.h' -o \
                  -name '*.cs' -o \
                  -name '*.java' -o \
                  -name '*.js' -o \
                  -name '*.ts' -o \
                  -name '*.tsx')
do
  add_copyright $i notices/c-js-java-php.txt
done

# F#
for i in $(find . -name '*.fs')
do
  add_copyright $i notices/fsharp.txt
done

# Haskell
for i in $(find . -name '*.hs')
do
  add_copyright $i notices/haskell.txt
done

# HTML, XML
for i in $(find . -name '*.html' -o \
                  -name '*.xml')
do
  add_copyright $i notices/html-xml.txt
done

# Clojure, Common Lisp
for i in $(find . -name '*.clj' -o \
                  -name '*.cljs' -o \
                  -name '*.cl' -o \
                  -name '*.lisp')
do
  add_copyright $i notices/lisp.txt
done

# Matlab
for i in $(find . -name '*.m')
do
  add_copyright $i notices/matlab.txt
done

# Python, R, Ruby
for i in $(find . -name '*.py' -o \
                  -name '*.r' -o \
                  -name '*.rb')
do
  add_copyright $i notices/python-r-ruby.txt
done

# SQL
for i in $(find . -name '*.sql')
do
  add_copyright $i notices/sql.txt
done

echo "Copyright notices added to source files."